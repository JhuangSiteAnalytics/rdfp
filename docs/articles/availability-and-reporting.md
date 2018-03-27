# Availability and Reporting with rdfp
Steven Mortimer  
`r Sys.Date()`  



First, we load `dplyr` and `lubridate` to use in this vignette along with loading 
the `rdfp` package and specifying the DFP network we would like to connect to. 


```r
suppressWarnings(suppressMessages(library(dplyr)))
suppressWarnings(suppressMessages(library(lubridate)))
library(rdfp)
options(stringsAsFactors = FALSE)
options(rdfp.network_code = 123456789)
```

Just a note, that it's not necessary to setup your own application client_id and 
client_secret through the Google Developer's Console. The only difference is that 
the authentication will be run through the client created and associated with the 
`rdfp` package. By using the package client, you will *NOT* be giving access to 
your DFP to anyone, the package is just the medium for you to connect to 
your own data. If you wanted more control you would specify those options like so: 


```r
options(rdfp.application_name = "MyApp")
options(rdfp.client_id = "012345678901-99thisisatest99.apps.googleusercontent.com")
options(rdfp.client_secret = "Th1s1sMyC1ientS3cr3t")

dfp_auth()
```



### Availability by Month

Ad traffickers or display advertising reporters might get requests to determine 
the availability of a line item by month for a multi-month contract proposal. A 
LineItem has one InventoryTargeting object that describes which AdUnit and 
Placement objects it can target, and optional additional Targeting subclass 
objects that represent geographical, custom, or other criteria. You can either: 

1. Create your own line item from scratch
2. Use `dfp_getLineItemsByStatement()` to pull down details on a line item and modify
any fields that need to be different for your line item.

#### A LineItem from Scratch

Creating your own line item is easy. Some line item fields are absolutely required 
in order to forecast so you may need to try different lines to see how they forecast. 
Personally, I've found that most line items need the fields we create in the example 
below (e.g `primaryGoal`, `targeting`, etc). If you'd like to see all possible 
line item fields, you can review the documentation for this object at https://developers.google.com/doubleclick-publishers/docs/reference/v201702/LineItemService.LineItem


```r
sample_line <- list()
sample_line$startDateTime <- ''
sample_line$endDateTime <- ''
sample_line$deliveryRateType <- 'EVENLY'
sample_line$lineItemType <- 'STANDARD'
sample_line$priority <- 8
sample_line$costType <- 'CPM'
sample_line$creativePlaceholders$size <- list(width=666, height=176, isAspectRatio='false')
sample_line$creativePlaceholders$expectedCreativeCount <- 1
sample_line$creativePlaceholders$creativeSizeType <- 'PIXEL'
sample_line$primaryGoal <- list(goalType='LIFETIME', unitType='IMPRESSIONS', units=1000)
sample_line$targeting <- list(inventoryTargeting=list(targetedAdUnits=list(adUnitId=133765936, 
                                                                           includeDescendants="true")))
```

You'll notice that this example line item does not have targeting, which you can 
add. It also does not have a `startDateTime` and `endDateTime`. We'll write a loop 
and pass those in each time to get availability for each month across multiple months.

#### Modifying an Existing LineItem

If you want to use an existing line item because it's already got so many details, 
then here is an example of how you would pull that item down and use it. You will 
need to change out the `filterStatement` to pick the line item you want. 


```r

my_filter <- "WHERE LineItemType='STANDARD' and Status='DELIVERING'"
line_item_details <- dfp_getLineItemsByStatement(list(filterStatement=list(query=my_filter)))

# pull out the 3rd element in the list of returned results
single_item <- line_item_details$rval[3]$results

# replace targeting matrices to list
# because of the parsing some targeting fields are returned as 
# matrices, but we need to convert back to a list
# remember this technique when passing other existing line items
single_item$targeting$inventoryTargeting <- as.list(as.data.frame(single_item$targeting$inventoryTargeting, 
                                                                  check.names=F, 
                                                                  stringsAsFactors = F)
                                                    )
```

#### Creating Datetimes in DFP

DFP keeps track of dates and times by separating things like the year, month, 
and day into 3 separate integers. The special DFP format requires a function to 
convert `Date` objects in R into the corresponding DFP list. The following 
function is helpful in doing just that.


```r
date2DFPDateTimeObj <- function(this_date,
                                daytime = c('beginning','end'), 
                                timeZoneID = 'America/New_York'){
  
  this_hour <- if(daytime=='beginning') 0 else 23
  this_minute <- if(daytime=='beginning') 0 else 59
  this_second <- if(daytime=='beginning') 0 else 59
  
  x <- list(date=list(year=as.integer(format(this_date, '%Y')), 
                      month=as.integer(format(this_date, '%m')), 
                      day=as.integer(format(this_date, '%d'))), 
            hour=if(this_hour == 0 & this_date == Sys.Date()) pmin(hour(Sys.time()+hours(2)), 23) else this_hour, 
            minute=if(this_minute == 0 & this_date == Sys.Date()) pmin(minute(Sys.time()), 59) else this_minute,
            second=if(this_second == 0 & this_date == Sys.Date()) pmin(as.integer(second(Sys.time())), 59) else this_second,
            timeZoneID=timeZoneID)
  return(x)
}
```

#### Generating Forecasts

Here is an example of how to loop through individual months and determine 
availability for the sample line item created previously. It is fairly 
straightforward to take the month start and end dates and substitute them 
into the hypothetical line item. The one quirk is that, in order to follow the API, 
we must create lists of lists that are redundant at times. For example, the forecast 
request has a `lineItem` field that takes a `ProspectiveLineItem` that contains
its own `lineItem` field: `list(lineItem=list(lineItem=this_sample_line) ...`. 
As long as you follow the object fields according to the Google reference documentation, 
then everything should work. Most everything needs to be formed as a list of lists 
with field names.


```r
all_forecasts <- NULL
month_start_dates <- as.Date(format(Sys.Date() %m+% months(1:12), '%Y-%m-01'))
month_end_dates <- ceiling_date(month_start_dates, 'months') - 1
for(i in 1:length(month_start_dates)){
  this_sample_line <- sample_line
  this_sample_line$startDateTime <- date2DFPDateTimeObj(month_start_dates[i], daytime='beginning')
  this_sample_line$endDateTime <- date2DFPDateTimeObj(month_end_dates[i], daytime='end')
  forecast_request <- list(lineItem=list(lineItem=this_sample_line),
                           forecastOptions=list(includeTargetingCriteriaBreakdown='false', 
                                                includeContendingLineItems='false'))
  this_result <- dfp_getAvailabilityForecast(forecast_request)
  this_result <- this_result[,c('unitType', 'availableUnits', 'reservedUnits')]
  this_result$forecast_month <- format(month_start_dates[i], '%Y-%m')
  all_forecasts <- rbind(all_forecasts, this_result)
}
head(all_forecasts)
#>      unitType availableUnits reservedUnits forecast_month
#> 1 IMPRESSIONS        6530284          1000        2017-06
#> 2 IMPRESSIONS        7630054          1000        2017-07
#> 3 IMPRESSIONS        7866620          1000        2017-08
#> 4 IMPRESSIONS        8802948          1000        2017-09
#> 5 IMPRESSIONS        9212361          1000        2017-10
#> 6 IMPRESSIONS        9110461          1000        2017-11
```


### Availability by Targeting Criteria

The previous example shows how to determine availability across multiple months 
for a single line item. It is also possible to determine the availability for 
each targeting segment of your forecast. The `dfp_getAvailabilityForecast()` 
function takes a second or two, so it is very inefficient to submit each county 
individually. Instead, you can submit a line item with targeting that says 
County A or County B or County C ... until you've covered each county that you 
need a forecast for. If you ask for targeting criteria breakdowns in the 
`forecastOptions`, then you can retrieve the availability contribution from each 
county while only using one call to `dfp_getAvailabilityForecast()`.

#### Determining Geo Ids

In this example, we'll determine availability for all counties in Texas. First, 
you will need to determine the geography codes for all of the counties in Texas. 
Luckily, DFP provides a table of geographic codes for the entire world. Codes 
can be retrieved like so:


```r
request_data <- list(selectStatement=
                       list(query="SELECT 
                                      Id
                                    , Name
                                    , CanonicalParentId
                                    , CountryCode
                                    , Type 
                                  FROM Geo_Target 
                                  WHERE CountryCode='US'"))

dfp_select_result <- dfp_select(request_data)$rval
us_geos <- dfp_select_parse(dfp_select_result)
us_states <- us_geos %>%
  filter(type == 'STATE', name == 'Texas') %>%
  select(id, state=name)

us_counties <- us_geos %>%
  filter(type == 'COUNTY') %>%
  select(id, canonicalparentid, county=name)

texas_counties <- inner_join(us_counties, us_states, by=c('canonicalparentid'='id'))
```

Next, we need to format the geographies into objects of type `Location` that 
at least contain an id denoting the area. 


```r

# format the county ids into a list so they can be passed 
# over to the geoTargeting field of the ProspectiveLineItem
geo_targets <- as.list(texas_counties$id)
geo_targets <- lapply(geo_targets, FUN=function(x){list(id=x)})
names(geo_targets) <- rep('targetedLocations', length(geo_targets))
```

The sample line we created earlier does not contain the start and end datetimes, 
so we'll consider a 90-day period in the future.


```r
this_sample_line <- sample_line

# look at availability for the next 90 days
this_sample_line$startDateTime <- date2DFPDateTimeObj(Sys.Date() + 1, daytime='beginning')
this_sample_line$endDateTime <- date2DFPDateTimeObj(Sys.Date() + 91, daytime='end')
```

#### Setting up The Targeting

Specifying the targeting can be a little tricky. We need to NULL the original 
targeting field we created in the sample line and put geoTargeting first because 
the documentation and the API needs elements in the order that they are specified. 
For example, the ForecastService needs the targeting fields to be in the order listed at
https://developers.google.com/doubleclick-publishers/docs/reference/v201702/ForecastService.Targeting. 


```r

# recreate the targeting field from scratch
this_sample_line$targeting <- NULL
this_sample_line$targeting$geoTargeting <- geo_targets
# re-use the inventoryTargeting criteria from the original sample
this_sample_line$targeting$inventoryTargeting <- sample_line$targeting$inventoryTargeting
```

#### Requesting Targeting Criteria Breakdowns

Finally, we'll make the request to determine availability. There are 2 important 
details in getting back the breakdown of availability for each county in this example. 

1. Ensure that `includeTargetingCriteriaBreakdown='true'`
2. Ensure that `as_df=FALSE` in `dfp_getAvailabilityForecast()`

Targeting criteria breakdowns are omitted by default so we need to tell DFP to 
return them. Those breakdowns are formatted as a nested list, so if you do not 
specify, you'll be stuck with a very wide data.frame containing one column 
for every element in the nested list and it is not easy to work with.


```r
# request the targeting criteria breakdown this time to get that detail
forecast_request <- list(lineItem=list(lineItem=this_sample_line),
                         forecastOptions=list(includeTargetingCriteriaBreakdown='true', 
                                              includeContendingLineItems='false'))

# get the forecasted availability and make sure to specify as_df=FALSE
this_result <- dfp_getAvailabilityForecast(forecast_request, as_df=FALSE)
breakdowns <- this_result$rval[c(names(this_result$rval) %in% 'targetingCriteriaBreakdowns')]
```

#### Parsing Targeting Criteria Breakdowns

Once you've got the result, you'll see an element in the list called `targetingCriteriaBreakdowns`. 
This element contains a breakdown for each targeting field specified, including the 
inventory targeting that is for the ad unit. We are not interested in that breakdown 
and it is not mutually exclusive from the geoTargeting, so we need to exclude.
There are many ways to determine the break downs you want. In the example below 
we use `sapply` to find all breakdowns that have a dimension of `'GEOGRAPHY'`, but 
we could also check that the targetingCriteriaId is in the list of county ids. This 
all depends on which breakdowns you're interested in and how you want to pull them 
out of the forecasted response.


```r
# only select the breakdowns that are GEOGRAPHY
# this omits the Ad Unit and Ad Size breakdowns
geo_breakdowns <- breakdowns[sapply(breakdowns, 
                                    FUN=function(x){
                                      x$targetingDimension == 'GEOGRAPHY'
                                    })]

avails <- plyr::ldply(geo_breakdowns, 
                      .fun=function(x){
                        return(as.data.frame(x))
                      }, .id=NULL)

avails <- avails %>% 
  mutate(ImpressionsTotal=as.integer(matchedUnits),
         ImpressionsAvailable=as.integer(availableUnits), 
         ImpressionsBooked=as.integer(ImpressionsTotal-ImpressionsAvailable), 
         PctAvail=ImpressionsAvailable/ImpressionsTotal) %>%
  select(targetingCriteriaName, ImpressionsTotal, ImpressionsBooked, ImpressionsAvailable, PctAvail)
```

The breakdowns are not necessarily mutually exclusive, so be careful when 
totaling them up. The counties are exclusive, so it's okay to sum them.


```r
# total availability across Texas counties
sum(avails$ImpressionsAvailable) / sum(avails$ImpressionsTotal)
#> [1] 0.4824948
```

### Availability for an Existing Line

Sometimes you just want to check the availability on an existing line, say, 
to see if you can renew an existing contract. DFP makes this very easy, by providing 
the function `dfp_getAvailabilityForecastById()`. You'll need to first determine 
the Id of the line item you would like to check, then plug it into the function.


```r

my_filter <- "WHERE LineItemType='STANDARD' and Status='DELIVERING'"
line_item_details <- dfp_getLineItemsByStatement(list(filterStatement=list(query=my_filter)))

# pull out the 3rd element in the list of returned results
single_item <- line_item_details$rval[3]$results

# request for this id with no special forecastOptions
forecast_request <- list(lineItemId=single_item$id,
                         forecastOptions = list())

this_result <- dfp_getAvailabilityForecastById(forecast_request)
this_result[,c('lineItemId', 'orderId', 'availableUnits', 'deliveredUnits', 'matchedUnits')]
#>   lineItemId    orderId availableUnits deliveredUnits matchedUnits
#> 1 1928467816 1254284896        1558529          86394      2054665
```


### Running Reports 

#### Delivery by Advertiser

A common request is to check how each line item is delivering for an advertiser. 
This type of request can be run through a DFP report job. Report jobs have a 
special flow, but there is a single function (`dfp_full_report_wrapper`) in 
the **rdfp** package that will manage that flow and run a requested job for you. 

In this example, we specify dimensions including the line, order, advertiser, 
and ad unit. The `'FLAT'` ad unit view just ensures that we get tabular data 
with one row per ad unit in case we'd like to total them up. If you'd like to 
run multiple reports with slight variations in date or dimensions, it is encouraged 
that you keep you criteria and use a loop or vectorized function to generate 
each report since the request data must be formatted as a list in each call.


```r
report_request_data <- list(reportJob =
                              list(reportQuery =
                                     list(dimensions = 'AD_UNIT_NAME',
                                          dimensions = 'ADVERTISER_NAME',
                                          dimensions = 'ORDER_NAME',
                                          dimensions = 'LINE_ITEM_NAME',
                                          adUnitView = 'FLAT',
                                          columns = 'AD_SERVER_IMPRESSIONS', 
                                          columns = 'AD_SERVER_CLICKS',
                                          dateRangeType = 'LAST_MONTH')
                                   )
                            )
delivery_dat <- dfp_full_report_wrapper(report_request_data)
```

#### Working with Saved Queries

DFP has a feature that allows for saving query criteria. These queries can be 
pulled back via the API and the criteria submitted back so that you always 
run the same report each time, or can easily replicate a query that another person 
has created in the UI.


```r

# look for a particular saved query
this_result <- dfp_getSavedQueriesByStatement(list(filterStatement=list(query="WHERE id = 936165016")), as_df=F)
this_report_query <- this_result$rval$results$reportQuery

# resubmit the report job with the saved query
report_request_data2 <- list(reportJob=list(reportQuery = this_report_query))
delivery_dat2 <- dfp_full_report_wrapper(report_request_data2)
```

### Check out the Tests

The **rdfp** package has quite a bit of unit test coverage to track any changes 
made between newly released versions of DFP (typically 3 each year). 
These tests are an excellent source of examples because they cover most all 
cases of utilizing the package functions. 

For example, if you're not sure on how to use custom date ranges when 
requesting a report through the ReportService, just check out the tests at 
https://github.com/ReportMort/rdfp/blob/master/tests/testthat/test_ReportService.R

If you want to know how to create a user, just look at the test for `dfp_createUsers()`


```r
request_data <- list(users=list(name="TestUser - 1",
                                email="testuser123456789@gmail.com",
                                roleId=-1)
                     )
dfp_createUsers_result <- dfp_createUsers(request_data)
```
