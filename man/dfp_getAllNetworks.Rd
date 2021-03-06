% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/NetworkService.R
\name{dfp_getAllNetworks}
\alias{dfp_getAllNetworks}
\title{NetworkService}
\usage{
dfp_getAllNetworks(as_df = TRUE, verbose = FALSE)
}
\arguments{
\item{as_df}{a boolean indicating whether to attempt to parse the result into
a \code{data.frame}}

\item{verbose}{a boolean indicating whether to print the service URL and POSTed XML}
}
\value{
a \code{data.frame} or \code{list} containing all the elements of a getAllNetworksResponse
}
\description{
Provides operations for retrieving information related to the publisher's
networks. This service can be used to obtain the list of all networks that
the current login has access to, or to obtain information about a specific
network.
}
\details{
getAllNetworks

Returns the list of Network objects to which the current login has access.
Intended to be used without a network code in the SOAP header when the login may have more than one network associated with it.Returns the list of Network objects to which the current login has access.
Intended to be used without a network code in the SOAP header when the login may have more than one network associated with it.@return the networks to which the current login has access Returns the list of Network objects to which the current login has access.
Intended to be used without a network code in the SOAP header when the login may have more than one network associated with it.@return the networks to which the current login has access
}
\examples{
\dontrun{
 res <- dfp_getAllNetworks()
}
}
\seealso{
\href{https://developers.google.com/doubleclick-publishers/docs/reference/v201802/NetworkService#getAllNetworks}{Google Documentation for getAllNetworks}
}
