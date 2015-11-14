#' ContentBundleService
#' 
#' Provides methods for creating, updating and retrieving ContentBundle
#' objects.
#' A ContentBundle is a grouping of Content that match filter
#' rules as well as taking into account explicitly included or excluded
#' Content.
#' 
#' ContentBundleService Object Factory
#' 
#' A function to create a variety of objects that are part of the ContentBundleService
#' Note: not all objects here are inputs to the functions of this service so 
#' please consult each function for the required inputs
#' 
#' Below is a list of objects and their required components to be created with this function:
#' 
#' \strong{ActivateContentBundles}
#' 
#' The action used for activating ContentBundle objects.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ContentBundleService.ActivateContentBundles}{Google Documentation for ActivateContentBundles}
#' \describe{
#'  \item{extends ContentBundleAction}{see documentation for ContentBundleAction}
#' }
#' 
#' \strong{ApiError}
#' 
#' The API error base class that provides details about an error that occurred
#' while processing a service request. The OGNL field path is provided for
#' parsers to identify the request data element that may have caused the error.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ContentBundleService.ApiError}{Google Documentation for ApiError}
#' \describe{
#'  \item{fieldPath}{a string -  The OGNL field path to identify cause of error.}
#'  \item{trigger}{a string -  The data that caused the error.}
#'  \item{errorString}{a string -  A simple string representation of the error and reason.}
#' }
#' 
#' \strong{ApiException}
#' 
#' Exception class for holding a list of service errors.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ContentBundleService.ApiException}{Google Documentation for ApiException}
#' \describe{
#'  \item{message}{a string (inherited from ApplicationException) -  Error message.}
#'  \item{errors}{a ApiError -  List of errors.}
#' }
#' 
#' \strong{ApiVersionError}
#' 
#' Errors related to the usage of API versions.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ContentBundleService.ApiVersionError}{Google Documentation for ApiVersionError}
#' \describe{
#'  \item{extends ApiError}{see documentation for ApiError}
#'  \item{reason}{a ApiVersionError.Reason - This can take one of the following values:
#'    \itemize{
#'      \item{UPDATE_TO_NEWER_VERSION - Indicates that the operation is not allowed in the version the request was
#' made in.}
#'      \item{UNKNOWN - The value returned if the actual value is not exposed by the requested API
#' version.}
#'    }
#'   }
#' }
#' 
#' \strong{ApplicationException}
#' 
#' Base class for exceptions.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ContentBundleService.ApplicationException}{Google Documentation for ApplicationException}
#' \describe{
#'  \item{message}{a string -  Error message.}
#' }
#' 
#' \strong{AuthenticationError}
#' 
#' An error for an exception that occurred when authenticating.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ContentBundleService.AuthenticationError}{Google Documentation for AuthenticationError}
#' \describe{
#'  \item{extends ApiError}{see documentation for ApiError}
#'  \item{reason}{a AuthenticationError.Reason - This can take one of the following values:
#'    \itemize{
#'      \item{AMBIGUOUS_SOAP_REQUEST_HEADER - The SOAP message contains a request header with an ambiguous definition of
#' the authentication header fields. This means either the authToken and
#' oAuthToken fields were both null or both were specified. Exactly one value
#' should be specified with each request.}
#'      \item{INVALID_EMAIL - The login provided is invalid.}
#'      \item{AUTHENTICATION_FAILED - Tried to authenticate with provided information, but failed.}
#'      \item{INVALID_OAUTH_SIGNATURE - The OAuth provided is invalid.}
#'      \item{INVALID_SERVICE - The specified service to use was not recognized.}
#'      \item{MISSING_SOAP_REQUEST_HEADER - The SOAP message is missing a request header with an authToken and optional
#' networkCode.}
#'      \item{MISSING_AUTHENTICATION_HTTP_HEADER - The HTTP request is missing a request header with an authToken}
#'      \item{MISSING_AUTHENTICATION - The request is missing an authToken}
#'      \item{NOT_WHITELISTED_FOR_API_ACCESS - The customer is not whitelisted for API access.}
#'      \item{NO_NETWORKS_TO_ACCESS - The user is not associated with any network.}
#'      \item{NETWORK_NOT_FOUND - No network for the given networkCode was found.}
#'      \item{NETWORK_CODE_REQUIRED - The user has access to more than one network, but did not provide a
#' networkCode.}
#'      \item{CONNECTION_ERROR - An error happened on the server side during connection to authentication
#' service.}
#'      \item{GOOGLE_ACCOUNT_ALREADY_ASSOCIATED_WITH_NETWORK - The user tried to create a test network using an account that already is
#' associated with a network.}
#'      \item{UNKNOWN - The value returned if the actual value is not exposed by the requested API
#' version.}
#'    }
#'   }
#' }
#' 
#' \strong{BooleanValue}
#' 
#' Contains a boolean value.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ContentBundleService.BooleanValue}{Google Documentation for BooleanValue}
#' \describe{
#'  \item{extends Value}{see documentation for Value}
#'  \item{value}{a boolean -  The boolean value.}
#' }
#' 
#' \strong{CollectionSizeError}
#' 
#' Error for the size of the collection being too large
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ContentBundleService.CollectionSizeError}{Google Documentation for CollectionSizeError}
#' \describe{
#'  \item{extends ApiError}{see documentation for ApiError}
#'  \item{reason}{a CollectionSizeError.Reason - This can take one of the following values:
#'    \itemize{
#'      \item{TOO_LARGE}
#'      \item{UNKNOWN - The value returned if the actual value is not exposed by the requested API
#' version.}
#'    }
#'   }
#' }
#' 
#' \strong{CommonError}
#' 
#' A place for common errors that can be used across services.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ContentBundleService.CommonError}{Google Documentation for CommonError}
#' \describe{
#'  \item{extends ApiError}{see documentation for ApiError}
#'  \item{reason}{a CommonError.Reason - This can take one of the following values:
#'    \itemize{
#'      \item{NOT_FOUND - Indicates that an attempt was made to retrieve an entity that does not
#' exist.}
#'      \item{ALREADY_EXISTS - Indicates that an attempt was made to create an entity that already exists.}
#'      \item{DUPLICATE_OBJECT - Indicates that two elements in the collection were identical.}
#'      \item{CANNOT_UPDATE - Indicates that an attempt was made to change an immutable field.}
#'      \item{CONCURRENT_MODIFICATION - Indicates that another request attempted to update the same data in the same
#' network at about the same time. Please wait and try the request again.}
#'      \item{UNKNOWN - The value returned if the actual value is not exposed by the requested API
#' version.}
#'    }
#'   }
#' }
#' 
#' \strong{ContentBundle}
#' 
#' A ContentBundle is a grouping of individual Content. A ContentBundle is
#' defined as including the Content that match certain filter rules, along with
#' the option to explicitly include or exclude certain Content IDs.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ContentBundleService.ContentBundle}{Google Documentation for ContentBundle}
#' \describe{
#'  \item{id}{a integer -  ID that uniquely identifies the ContentBundle. This attribute is read-only
#' and is assigned by Google when a content bundle is created.}
#'  \item{name}{a string -  The name of the ContentBundle. This attribute is required and has a maximum
#' length of 255 characters.}
#'  \item{description}{a string -  The description of the ContentBundle. This attribute is required and has a
#' maximum length of 65,535 characters.}
#'  \item{status}{a ContentBundleStatus - The ContentBundleStatus of the ContentBundle. This attribute is read-only
#' and defaults to ContentBundleStatus INACTIVE. This can take one of the following values:
#'    \itemize{
#'      \item{ACTIVE - The object is active and stats are collected.}
#'      \item{INACTIVE - The object is no longer active and no stats collected.}
#'      \item{ARCHIVED - The object has been archived.}
#'    }
#'   }
#' }
#' 
#' \strong{ContentBundleAction}
#' 
#' Represents the actions that can be performed on ContentBundle objects. May take one of the actions listed below.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ContentBundleService.ContentBundleAction}{Google Documentation for ContentBundleAction}
#' \describe{
#'  \item{ActivateContentBundles}{The action used for activating ContentBundle objects.}
#'  \item{DeactivateContentBundles}{The action used for deactivating ContentBundle objects.}
#'  \item{ExcludeContentFromContentBundle}{The action used for explicitly excluding specific content from a
#' ContentBundle object.}
#'  \item{IncludeContentInContentBundle}{The action used for explicitly including specific content in a ContentBundle
#' object.}
#' }
#' 
#' \strong{ContentBundlePage}
#' 
#' Captures a page of ContentBundle objects.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ContentBundleService.ContentBundlePage}{Google Documentation for ContentBundlePage}
#' \describe{
#'  \item{totalResultSetSize}{a integer -  The size of the total result set to which this page belongs.}
#'  \item{startIndex}{a integer -  The absolute index in the total result set on which this page begins.}
#'  \item{results}{a ContentBundle -  The collection of content bundles contained within this page.}
#' }
#' 
#' \strong{Date}
#' 
#' Represents a date.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ContentBundleService.Date}{Google Documentation for Date}
#' \describe{
#'  \item{year}{a integer -  Year (e.g., 2009)}
#'  \item{month}{a integer -  Month (1..12)}
#'  \item{day}{a integer -  Day (1..31)}
#' }
#' 
#' \strong{DateTime}
#' 
#' Represents a date combined with the time of day.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ContentBundleService.DateTime}{Google Documentation for DateTime}
#' \describe{
#'  \item{date}{a Date}
#'  \item{hour}{a integer}
#'  \item{minute}{a integer}
#'  \item{second}{a integer}
#'  \item{timeZoneID}{a string}
#' }
#' 
#' \strong{DateTimeValue}
#' 
#' Contains a date-time value.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ContentBundleService.DateTimeValue}{Google Documentation for DateTimeValue}
#' \describe{
#'  \item{extends Value}{see documentation for Value}
#'  \item{value}{a DateTime -  The DateTime value.}
#' }
#' 
#' \strong{DateValue}
#' 
#' Contains a date value.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ContentBundleService.DateValue}{Google Documentation for DateValue}
#' \describe{
#'  \item{extends Value}{see documentation for Value}
#'  \item{value}{a Date -  The Date value.}
#' }
#' 
#' \strong{DeactivateContentBundles}
#' 
#' The action used for deactivating ContentBundle objects.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ContentBundleService.DeactivateContentBundles}{Google Documentation for DeactivateContentBundles}
#' \describe{
#'  \item{extends ContentBundleAction}{see documentation for ContentBundleAction}
#' }
#' 
#' \strong{ExcludeContentFromContentBundle}
#' 
#' The action used for explicitly excluding specific content from a
#' ContentBundle object.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ContentBundleService.ExcludeContentFromContentBundle}{Google Documentation for ExcludeContentFromContentBundle}
#' \describe{
#'  \item{extends ContentBundleAction}{see documentation for ContentBundleAction}
#'  \item{contentStatement}{a Statement -  The Publisher Query Language statement specifying which Content to exclude
#' from the ContentBundle. The statement is expressed in terms of Content
#' fields such as name and status.  All fields supported by ContentService
#' getContentByStatement are supported on this statement.}
#' }
#' 
#' \strong{FeatureError}
#' 
#' Errors related to feature management. If you attempt using a feature that is
#' not available to the current network you'll receive a FeatureError with the
#' missing feature as the trigger.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ContentBundleService.FeatureError}{Google Documentation for FeatureError}
#' \describe{
#'  \item{extends ApiError}{see documentation for ApiError}
#'  \item{reason}{a FeatureError.Reason - This can take one of the following values:
#'    \itemize{
#'      \item{MISSING_FEATURE - A feature is being used that is not enabled on the current network.}
#'      \item{UNKNOWN - The value returned if the actual value is not exposed by the requested API
#' version.}
#'    }
#'   }
#' }
#' 
#' \strong{IncludeContentInContentBundle}
#' 
#' The action used for explicitly including specific content in a ContentBundle
#' object.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ContentBundleService.IncludeContentInContentBundle}{Google Documentation for IncludeContentInContentBundle}
#' \describe{
#'  \item{extends ContentBundleAction}{see documentation for ContentBundleAction}
#'  \item{contentStatement}{a Statement -  The Publisher Query Language statement specifying which Content to include
#' in the ContentBundle. The statement is expressed in terms of Content fields
#' such as name and status.  All fields supported by ContentService
#' getContentByStatement are supported on this statement.}
#' }
#' 
#' \strong{InternalApiError}
#' 
#' Indicates that a server-side error has occured. InternalApiErrors are
#' generally not the result of an invalid request or message sent by the
#' client.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ContentBundleService.InternalApiError}{Google Documentation for InternalApiError}
#' \describe{
#'  \item{extends ApiError}{see documentation for ApiError}
#'  \item{reason}{a InternalApiError.Reason - The error reason represented by an enum. This can take one of the following values:
#'    \itemize{
#'      \item{UNEXPECTED_INTERNAL_API_ERROR - API encountered an unexpected internal error.}
#'      \item{TRANSIENT_ERROR - A temporary error occurred during the request. Please retry.}
#'      \item{UNKNOWN - The cause of the error is not known or only defined in newer versions.}
#'      \item{DOWNTIME - The API is currently unavailable for a planned downtime.}
#'    }
#'   }
#' }
#' 
#' \strong{NotNullError}
#' 
#' Caused by supplying a null value for an attribute that cannot be null.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ContentBundleService.NotNullError}{Google Documentation for NotNullError}
#' \describe{
#'  \item{extends ApiError}{see documentation for ApiError}
#'  \item{reason}{a NotNullError.Reason - The error reason represented by an enum. This can take one of the following values:
#'    \itemize{
#'      \item{ARG1_NULL - Assuming that a method will not have more than 3 arguments, if it does,
#' return NULL}
#'      \item{ARG2_NULL}
#'      \item{ARG3_NULL}
#'      \item{NULL}
#'      \item{UNKNOWN - The value returned if the actual value is not exposed by the requested API
#' version.}
#'    }
#'   }
#' }
#' 
#' \strong{NumberValue}
#' 
#' Contains a numeric value.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ContentBundleService.NumberValue}{Google Documentation for NumberValue}
#' \describe{
#'  \item{extends Value}{see documentation for Value}
#'  \item{value}{a string -  The numeric value represented as a string.}
#' }
#' 
#' \strong{ObjectValue}
#' 
#' Contains an object value.  This object is experimental! ObjectValue is an
#' experimental, innovative, and rapidly changing new feature for DFP.
#' Unfortunately, being on the bleeding edge means that we may make
#' backwards-incompatible changes to ObjectValue. We will inform the community
#' when this feature is no longer experimental.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ContentBundleService.ObjectValue}{Google Documentation for ObjectValue}
#' \describe{
#'  \item{extends Value}{see documentation for Value}
#' }
#' 
#' \strong{ParseError}
#' 
#' Lists errors related to parsing.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ContentBundleService.ParseError}{Google Documentation for ParseError}
#' \describe{
#'  \item{extends ApiError}{see documentation for ApiError}
#'  \item{reason}{a ParseError.Reason - The error reason represented by an enum. This can take one of the following values:
#'    \itemize{
#'      \item{UNPARSABLE - Indicates an error in parsing an attribute.}
#'      \item{UNKNOWN - The value returned if the actual value is not exposed by the requested API
#' version.}
#'    }
#'   }
#' }
#' 
#' \strong{PermissionError}
#' 
#' Errors related to incorrect permission.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ContentBundleService.PermissionError}{Google Documentation for PermissionError}
#' \describe{
#'  \item{extends ApiError}{see documentation for ApiError}
#'  \item{reason}{a PermissionError.Reason - This can take one of the following values:
#'    \itemize{
#'      \item{PERMISSION_DENIED - User does not have the required permission for the request.}
#'      \item{UNKNOWN - The value returned if the actual value is not exposed by the requested API
#' version.}
#'    }
#'   }
#' }
#' 
#' \strong{PlacementError}
#' 
#' Class defining all validation errors for a placement.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ContentBundleService.PlacementError}{Google Documentation for PlacementError}
#' \describe{
#'  \item{extends ApiError}{see documentation for ApiError}
#'  \item{reason}{a PlacementError.Reason - This can take one of the following values:
#'    \itemize{
#'      \item{INVALID_ENTITY_TYPE - Entity type is something other than inventory or content.}
#'      \item{SHARED_INVENTORY_ASSIGNED - Shared inventory cannot be assigned to a placement.}
#'      \item{PLACEMENTS_CANNOT_INCLUDE_INVENTORY_FROM_MULTIPLE_DISTRIBUTOR_NETWORKS - Shared inventory from one distributor network cannot be in the same
#' placement with inventory from another distributor.}
#'      \item{PLACEMENTS_CANNOT_INCLUDE_BOTH_LOCAL_AND_SHARED_INVENTORY - Shared inventory and local inventory cannot be in the same placement.}
#'      \item{UNKNOWN - The value returned if the actual value is not exposed by the requested API
#' version.}
#'    }
#'   }
#' }
#' 
#' \strong{PublisherQueryLanguageContextError}
#' 
#' An error that occurs while executing a PQL query contained in a Statement
#' object.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ContentBundleService.PublisherQueryLanguageContextError}{Google Documentation for PublisherQueryLanguageContextError}
#' \describe{
#'  \item{extends ApiError}{see documentation for ApiError}
#'  \item{reason}{a PublisherQueryLanguageContextError.Reason - The error reason represented by an enum. This can take one of the following values:
#'    \itemize{
#'      \item{UNEXECUTABLE - Indicates that there was an error executing the PQL.}
#'      \item{UNKNOWN - The value returned if the actual value is not exposed by the requested API
#' version.}
#'    }
#'   }
#' }
#' 
#' \strong{PublisherQueryLanguageSyntaxError}
#' 
#' An error that occurs while parsing a PQL query contained in a Statement
#' object.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ContentBundleService.PublisherQueryLanguageSyntaxError}{Google Documentation for PublisherQueryLanguageSyntaxError}
#' \describe{
#'  \item{extends ApiError}{see documentation for ApiError}
#'  \item{reason}{a PublisherQueryLanguageSyntaxError.Reason - The error reason represented by an enum. This can take one of the following values:
#'    \itemize{
#'      \item{UNPARSABLE - Indicates that there was a PQL syntax error.}
#'      \item{UNKNOWN - The value returned if the actual value is not exposed by the requested API
#' version.}
#'    }
#'   }
#' }
#' 
#' \strong{QuotaError}
#' 
#' Describes a client-side error on which a user is attempting to perform an
#' action to which they have no quota remaining.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ContentBundleService.QuotaError}{Google Documentation for QuotaError}
#' \describe{
#'  \item{extends ApiError}{see documentation for ApiError}
#'  \item{reason}{a QuotaError.Reason - This can take one of the following values:
#'    \itemize{
#'      \item{EXCEEDED_QUOTA - The number of requests made per second is too high and has exceeded the
#' allowable limit. The recommended approach to handle this error is to wait
#' about 5 seconds and then retry the request. Note that this does not
#' guarantee the request will succeed. If it fails again, try increasing the
#' wait time.  Another way to mitigate this error is to limit requests to 2 per
#' second for Small Business networks, or 8 per second for Premium networks.
#' Once again this does not guarantee that every request will succeed, but may
#' help reduce the number of times you receive this error.}
#'      \item{UNKNOWN - The value returned if the actual value is not exposed by the requested API
#' version.}
#'    }
#'   }
#' }
#' 
#' \strong{RequiredError}
#' 
#' Errors due to missing required field.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ContentBundleService.RequiredError}{Google Documentation for RequiredError}
#' \describe{
#'  \item{extends ApiError}{see documentation for ApiError}
#'  \item{reason}{a RequiredError.Reason - The error reason represented by an enum. This can take one of the following values:
#'    \itemize{
#'      \item{REQUIRED - Missing required field.}
#'    }
#'   }
#' }
#' 
#' \strong{ServerError}
#' 
#' Errors related to the server.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ContentBundleService.ServerError}{Google Documentation for ServerError}
#' \describe{
#'  \item{extends ApiError}{see documentation for ApiError}
#'  \item{reason}{a ServerError.Reason - This can take one of the following values:
#'    \itemize{
#'      \item{SERVER_ERROR - Indicates that an unexpected error occured.}
#'      \item{SERVER_BUSY - Indicates that the server is currently experiencing a high load. Please wait
#' and try your request again.}
#'      \item{UNKNOWN - The value returned if the actual value is not exposed by the requested API
#' version.}
#'    }
#'   }
#' }
#' 
#' \strong{SetValue}
#' 
#' Contains a set of Value Values. May not contain duplicates.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ContentBundleService.SetValue}{Google Documentation for SetValue}
#' \describe{
#'  \item{extends Value}{see documentation for Value}
#'  \item{values}{a Value -  The values. They must all be the same type of Value and not contain
#' duplicates.}
#' }
#' 
#' \strong{SoapRequestHeader}
#' 
#' Represents the SOAP request header used by API requests.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ContentBundleService.SoapRequestHeader}{Google Documentation for SoapRequestHeader}
#' \describe{
#'  \item{networkCode}{a string -  The network code to use in the context of a request.}
#'  \item{applicationName}{a string -  The name of client library application.}
#' }
#' 
#' \strong{SoapResponseHeader}
#' 
#' Represents the SOAP request header used by API responses.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ContentBundleService.SoapResponseHeader}{Google Documentation for SoapResponseHeader}
#' \describe{
#'  \item{requestId}{a string}
#'  \item{responseTime}{a integer}
#' }
#' 
#' \strong{Statement}
#' 
#' Captures the WHERE, ORDER BY and LIMIT clauses of a PQL query. Statements
#' are typically used to retrieve objects of a predefined domain type, which
#' makes SELECT clause unnecessary.  An example query text might be "WHERE
#' status = 'ACTIVE' ORDER BY id LIMIT 30".  Statements support bind variables.
#' These are substitutes for literals and can be thought of as input parameters
#' to a PQL query.  An example of such a query might be "WHERE id = :idValue".
#' Statements also support use of the LIKE keyword. This provides partial and
#' wildcard string matching.  An example of such a query might be "WHERE name
#' LIKE 'startswith\%'".  If using an API version newer than V201010, the value
#' for the variable idValue must then be set with an object of type Value and
#' is one of NumberValue, TextValue or BooleanValue.  If using an API version
#' older than or equal to V201010, the value for the variable idValue must then
#' be set with an object of type Param and is one of DoubleParam, LongParam or
#' StringParam.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ContentBundleService.Statement}{Google Documentation for Statement}
#' \describe{
#'  \item{query}{a string -  Holds the query in PQL syntax. See link for how to form PQL.}
#'  \item{values}{a String_ValueMapEntry -  Holds keys and values for bind variables and their values. The key is the
#' name of the bind variable. The value is the literal value of the variable.
#' In the example "WHERE status = :bindStatus ORDER BY id LIMIT 30", the bind
#' variable, represented by :bindStatus is named bindStatus, which would also
#' be the parameter map key. The bind variable's value would be represented by
#' a parameter map value of type TextValue. The final result, for example,
#' would be an entry of "bindStatus" => StringParam("ACTIVE").}
#' }
#' 
#' \strong{StatementError}
#' 
#' An error that occurs while parsing Statement objects.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ContentBundleService.StatementError}{Google Documentation for StatementError}
#' \describe{
#'  \item{extends ApiError}{see documentation for ApiError}
#'  \item{reason}{a StatementError.Reason - The error reason represented by an enum. This can take one of the following values:
#'    \itemize{
#'      \item{VARIABLE_NOT_BOUND_TO_VALUE - A bind variable has not been bound to a value.}
#'      \item{UNKNOWN - The value returned if the actual value is not exposed by the requested API
#' version.}
#'    }
#'   }
#' }
#' 
#' \strong{String_ValueMapEntry}
#' 
#' This represents an entry in a map with a key of type String and value of
#' type Value.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ContentBundleService.String_ValueMapEntry}{Google Documentation for String_ValueMapEntry}
#' \describe{
#'  \item{key}{a string}
#'  \item{value}{a Value}
#' }
#' 
#' \strong{TextValue}
#' 
#' Contains a string value.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ContentBundleService.TextValue}{Google Documentation for TextValue}
#' \describe{
#'  \item{extends Value}{see documentation for Value}
#'  \item{value}{a string -  The string value.}
#' }
#' 
#' \strong{UniqueError}
#' 
#' An error for a field which must satisfy a uniqueness constraint
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ContentBundleService.UniqueError}{Google Documentation for UniqueError}
#' \describe{
#'  \item{extends ApiError}{see documentation for ApiError}
#' }
#' 
#' \strong{UpdateResult}
#' 
#' Represents the result of performing an action on objects.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ContentBundleService.UpdateResult}{Google Documentation for UpdateResult}
#' \describe{
#'  \item{numChanges}{a integer -  The number of objects that were changed as a result of performing the
#' action.}
#' }
#' 
#' \strong{Value}
#' 
#' Value represents a value.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ContentBundleService.Value}{Google Documentation for Value}
#' \describe{
#' }
#' 
#' 
#' 
#' @usage dfp_ContentBundleService_object_factory(obj_type, obj_data)
#' 
#' @param obj_type a string from one of the object types described below
#' @param obj_data a \code{list} of \code{lists} or a \code{data.frame} with the required components to create
#' the obj_type specified. All input names must match the expected attributes for the object.
#' If submitting a list of attributes to create 1 object make sure to nest it inside top-level list, so that
#' it is a list of length 1 with 1 list of attributes to create the object.
#' @return a string of formatted XML that can be inserted into a SOAP request body to the API
#' @export
dfp_ContentBundleService_object_factory <- function(obj_type, obj_data){

  if(is.data.frame(obj_data)){
    sampled_names <- names(obj_data)
  } else if(is.list(obj_data)){
    sampled_names <- names(obj_data[[1]])
  } else {
    stop("obj_data must be a list or data.frame")
  }

  if(obj_type=='ApiError'){
    stopifnot(all(sampled_names %in% c('fieldPath', 'trigger', 'errorString')))
  }

  if(obj_type=='ApiException'){
    stopifnot(all(sampled_names %in% c('message', 'errors')))
  }

  if(obj_type=='ApiVersionError'){
    stopifnot(all(sampled_names %in% c('reason')))
  }

  if(obj_type=='ApplicationException'){
    stopifnot(all(sampled_names %in% c('message')))
  }

  if(obj_type=='AuthenticationError'){
    stopifnot(all(sampled_names %in% c('reason')))
  }

  if(obj_type=='BooleanValue'){
    stopifnot(all(sampled_names %in% c('value')))
  }

  if(obj_type=='CollectionSizeError'){
    stopifnot(all(sampled_names %in% c('reason')))
  }

  if(obj_type=='CommonError'){
    stopifnot(all(sampled_names %in% c('reason')))
  }

  if(obj_type=='ContentBundle'){
    stopifnot(all(sampled_names %in% c('id', 'name', 'description', 'status')))
  }

  if(obj_type=='ContentBundlePage'){
    stopifnot(all(sampled_names %in% c('totalResultSetSize', 'startIndex', 'results')))
  }

  if(obj_type=='Date'){
    stopifnot(all(sampled_names %in% c('year', 'month', 'day')))
  }

  if(obj_type=='DateTime'){
    stopifnot(all(sampled_names %in% c('date', 'hour', 'minute', 'second', 'timeZoneID')))
  }

  if(obj_type=='DateTimeValue'){
    stopifnot(all(sampled_names %in% c('value')))
  }

  if(obj_type=='DateValue'){
    stopifnot(all(sampled_names %in% c('value')))
  }

  if(obj_type=='ExcludeContentFromContentBundle'){
    stopifnot(all(sampled_names %in% c('contentStatement')))
  }

  if(obj_type=='FeatureError'){
    stopifnot(all(sampled_names %in% c('reason')))
  }

  if(obj_type=='IncludeContentInContentBundle'){
    stopifnot(all(sampled_names %in% c('contentStatement')))
  }

  if(obj_type=='InternalApiError'){
    stopifnot(all(sampled_names %in% c('reason')))
  }

  if(obj_type=='NotNullError'){
    stopifnot(all(sampled_names %in% c('reason')))
  }

  if(obj_type=='NumberValue'){
    stopifnot(all(sampled_names %in% c('value')))
  }

  if(obj_type=='ParseError'){
    stopifnot(all(sampled_names %in% c('reason')))
  }

  if(obj_type=='PermissionError'){
    stopifnot(all(sampled_names %in% c('reason')))
  }

  if(obj_type=='PlacementError'){
    stopifnot(all(sampled_names %in% c('reason')))
  }

  if(obj_type=='PublisherQueryLanguageContextError'){
    stopifnot(all(sampled_names %in% c('reason')))
  }

  if(obj_type=='PublisherQueryLanguageSyntaxError'){
    stopifnot(all(sampled_names %in% c('reason')))
  }

  if(obj_type=='QuotaError'){
    stopifnot(all(sampled_names %in% c('reason')))
  }

  if(obj_type=='RequiredError'){
    stopifnot(all(sampled_names %in% c('reason')))
  }

  if(obj_type=='ServerError'){
    stopifnot(all(sampled_names %in% c('reason')))
  }

  if(obj_type=='SetValue'){
    stopifnot(all(sampled_names %in% c('values')))
  }

  if(obj_type=='SoapRequestHeader'){
    stopifnot(all(sampled_names %in% c('networkCode', 'applicationName')))
  }

  if(obj_type=='SoapResponseHeader'){
    stopifnot(all(sampled_names %in% c('requestId', 'responseTime')))
  }

  if(obj_type=='Statement'){
    stopifnot(all(sampled_names %in% c('query', 'values')))
  }

  if(obj_type=='StatementError'){
    stopifnot(all(sampled_names %in% c('reason')))
  }

  if(obj_type=='String_ValueMapEntry'){
    stopifnot(all(sampled_names %in% c('key', 'value')))
  }

  if(obj_type=='TextValue'){
    stopifnot(all(sampled_names %in% c('value')))
  }

  if(obj_type=='UpdateResult'){
    stopifnot(all(sampled_names %in% c('numChanges')))
  }

}
#' 
#' createContentBundles
#' 
#' Creates new ContentBundle objects.
#' 
#' @usage dfp_createContentBundles(request_data)
#' @param request_data a \code{list} or \code{data.frame} of data elements
#' to be formatted for a SOAP request (XML format, but passed as character string)#' @return a \code{list} containing all the elements of a createContentBundlesResponse
#' @export
dfp_createContentBundles <- function(request_data){

  request_body <- make_request_body(service='ContentBundleService', root_name='createContentBundles', data=request_data)
  request <- build_soap_request(body = request_body)

  response <- xmlChildren(xmlChildren(xmlChildren(xmlRoot(request))$Body)[['createContentBundlesResponse']])$rval
  response <- if(is.null(response)) NULL else xmlToList(response)
  return(response)
}
#' 
#' getContentBundlesByStatement
#' 
#' Gets a ContentBundlePage of ContentBundle objects that satisfy the given Statement query. The following fields are supported for filtering:  a set of content bundles 
#' \itemize{
#'   \item{id}
#'   \item{name}
#'   \item{status}
#' }
#' 
#' @usage dfp_getContentBundlesByStatement(request_data)
#' @param request_data a \code{list} or \code{data.frame} of data elements
#' to be formatted for a SOAP request (XML format, but passed as character string)#' @return a \code{list} containing all the elements of a getContentBundlesByStatementResponse
#' @export
dfp_getContentBundlesByStatement <- function(request_data){

  request_body <- make_request_body(service='ContentBundleService', root_name='getContentBundlesByStatement', data=request_data)
  request <- build_soap_request(body = request_body)

  response <- xmlChildren(xmlChildren(xmlChildren(xmlRoot(request))$Body)[['getContentBundlesByStatementResponse']])$rval
  response <- if(is.null(response)) NULL else xmlToList(response)
  return(response)
}
#' 
#' performContentBundleAction
#' 
#' Performs actions on ContentBundle objects that match the given Statement query. a set of content bundles
#' 
#' @usage dfp_performContentBundleAction()
#' @return a \code{list} containing all the elements of a performContentBundleActionResponse
#' @export
dfp_performContentBundleAction <- function(){

  request_body <- make_request_body(service='ContentBundleService', root_name='performContentBundleAction', data=NULL)
  request <- build_soap_request(body = request_body)

  response <- xmlChildren(xmlChildren(xmlChildren(xmlRoot(request))$Body)[['performContentBundleActionResponse']])$rval
  response <- if(is.null(response)) NULL else xmlToList(response)
  return(response)
}
#' 
#' updateContentBundles
#' 
#' Updates the specified ContentBundle objects.
#' 
#' @usage dfp_updateContentBundles(request_data)
#' @param request_data a \code{list} or \code{data.frame} of data elements
#' to be formatted for a SOAP request (XML format, but passed as character string)#' @return a \code{list} containing all the elements of a updateContentBundlesResponse
#' @export
dfp_updateContentBundles <- function(request_data){

  request_body <- make_request_body(service='ContentBundleService', root_name='updateContentBundles', data=request_data)
  request <- build_soap_request(body = request_body)

  response <- xmlChildren(xmlChildren(xmlChildren(xmlRoot(request))$Body)[['updateContentBundlesResponse']])$rval
  response <- if(is.null(response)) NULL else xmlToList(response)
  return(response)
}
#' 