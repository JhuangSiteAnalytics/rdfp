#' CreativeWrapperService
#' 
#' Provides methods for the creation and management of creative wrappers.
#' CreativeWrapper CreativeWrappers allow HTML snippets to be served along
#' with creatives.
#' Creative wrappers must be associated with a
#' LabelType#CREATIVE_WRAPPER label and applied to ad units by
#' AdUnit#appliedLabels.
#' 
#' CreativeWrapperService Object Factory
#' 
#' A function to create a variety of objects that are part of the CreativeWrapperService
#' Note: not all objects here are inputs to the functions of this service so 
#' please consult each function for the required inputs
#' 
#' Below is a list of objects and their required components to be created with this function:
#' 
#' \strong{ActivateCreativeWrappers}
#' 
#' The action used for activating CreativeWrapper objects.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/CreativeWrapperService.ActivateCreativeWrappers}{Google Documentation for ActivateCreativeWrappers}
#' \describe{
#'  \item{extends CreativeWrapperAction}{see documentation for CreativeWrapperAction}
#' }
#' 
#' \strong{ApiError}
#' 
#' The API error base class that provides details about an error that occurred
#' while processing a service request. The OGNL field path is provided for
#' parsers to identify the request data element that may have caused the error.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/CreativeWrapperService.ApiError}{Google Documentation for ApiError}
#' \describe{
#'  \item{fieldPath}{a string -  The OGNL field path to identify cause of error.}
#'  \item{trigger}{a string -  The data that caused the error.}
#'  \item{errorString}{a string -  A simple string representation of the error and reason.}
#' }
#' 
#' \strong{ApiException}
#' 
#' Exception class for holding a list of service errors.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/CreativeWrapperService.ApiException}{Google Documentation for ApiException}
#' \describe{
#'  \item{message}{a string (inherited from ApplicationException) -  Error message.}
#'  \item{errors}{a ApiError -  List of errors.}
#' }
#' 
#' \strong{ApiVersionError}
#' 
#' Errors related to the usage of API versions.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/CreativeWrapperService.ApiVersionError}{Google Documentation for ApiVersionError}
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
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/CreativeWrapperService.ApplicationException}{Google Documentation for ApplicationException}
#' \describe{
#'  \item{message}{a string -  Error message.}
#' }
#' 
#' \strong{AuthenticationError}
#' 
#' An error for an exception that occurred when authenticating.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/CreativeWrapperService.AuthenticationError}{Google Documentation for AuthenticationError}
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
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/CreativeWrapperService.BooleanValue}{Google Documentation for BooleanValue}
#' \describe{
#'  \item{extends Value}{see documentation for Value}
#'  \item{value}{a boolean -  The boolean value.}
#' }
#' 
#' \strong{CollectionSizeError}
#' 
#' Error for the size of the collection being too large
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/CreativeWrapperService.CollectionSizeError}{Google Documentation for CollectionSizeError}
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
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/CreativeWrapperService.CommonError}{Google Documentation for CommonError}
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
#' \strong{CreativeWrapper}
#' 
#' A CreativeWrapper allows the wrapping of HTML snippets to be served along
#' with Creative objects.  Creative wrappers must be associated with a
#' LabelType CREATIVE_WRAPPER label and applied to ad units by AdUnit
#' appliedLabels.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/CreativeWrapperService.CreativeWrapper}{Google Documentation for CreativeWrapper}
#' \describe{
#'  \item{id}{a integer -  The unique ID of the CreativeWrapper. This value is readonly and is assigned
#' by Google.}
#'  \item{labelId}{a integer -  The ID of the Label which will be used to label ad units. The labelId on a
#' creative wrapper cannot be changed once it is created.}
#'  \item{header}{a CreativeWrapperHtmlSnippet -  The header HTML snippet that this creative wrapper delivers.}
#'  \item{footer}{a CreativeWrapperHtmlSnippet -  The footer HTML snippet that this creative wrapper delivers.}
#'  \item{ordering}{a CreativeWrapperOrdering - If there are multiple wrappers for a creative, then ordering defines the
#' order in which the HTML snippets are rendered. This can take one of the following values:
#'    \itemize{
#'      \item{NO_PREFERENCE - Wrapping occurs after INNER but before OUTER}
#'      \item{INNER - Wrapping occurs as early as possible.}
#'      \item{OUTER - Wrapping occurs after both NO_PREFERENCE and INNER}
#'    }
#'   }
#'  \item{status}{a CreativeWrapperStatus - The status of the CreativeWrapper. This attribute is readonly. This can take one of the following values:
#'    \itemize{
#'      \item{ACTIVE}
#'      \item{INACTIVE}
#'    }
#'   }
#' }
#' 
#' \strong{CreativeWrapperAction}
#' 
#' Represents the actions that can be performed on CreativeWrapper objects. May take one of the actions listed below.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/CreativeWrapperService.CreativeWrapperAction}{Google Documentation for CreativeWrapperAction}
#' \describe{
#'  \item{ActivateCreativeWrappers}{The action used for activating CreativeWrapper objects.}
#'  \item{DeactivateCreativeWrappers}{The action used for deactivating CreativeWrapper objects.}
#' }
#' 
#' \strong{CreativeWrapperError}
#' 
#' Errors specific to creative wrappers.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/CreativeWrapperService.CreativeWrapperError}{Google Documentation for CreativeWrapperError}
#' \describe{
#'  \item{extends ApiError}{see documentation for ApiError}
#'  \item{reason}{a CreativeWrapperError.Reason - The error reason represented by an enum. This can take one of the following values:
#'    \itemize{
#'      \item{LABEL_ALREADY_ASSOCIATED_WITH_CREATIVE_WRAPPER - The label is already associated with a CreativeWrapper.}
#'      \item{INVALID_LABEL_TYPE - The label type of a creative wrapper must be LabelType CREATIVE_WRAPPER.}
#'      \item{UNRECOGNIZED_MACRO - A macro used inside the snippet is not recognized.}
#'      \item{NEITHER_HEADER_NOR_FOOTER_SPECIFIED - When creating a new creative wrapper, either header or footer should exist.}
#'      \item{CANNOT_USE_CREATIVE_WRAPPER_TYPE - The network has not been enabled for creating labels of type LabelType
#' CREATIVE_WRAPPER.}
#'      \item{CANNOT_UPDATE_LABEL_ID - Cannot update CreativeWrapper labelId.}
#'      \item{CANNOT_APPLY_TO_AD_UNIT_WITH_VIDEO_SIZES - Cannot apply LabelType CREATIVE_WRAPPER labels to an ad unit if it has no
#' descendants with AdUnit adUnitSizes of AdUnitSize environmentType as
#' EnvironmentType BROWSER.}
#'      \item{CANNOT_APPLY_TO_MOBILE_AD_UNIT - Cannot apply LabelType CREATIVE_WRAPPER labels to an ad unit if AdUnit
#' targetPlatform is of type TargetPlatform MOBILE}
#'      \item{UNKNOWN - The value returned if the actual value is not exposed by the requested API
#' version.}
#'    }
#'   }
#' }
#' 
#' \strong{CreativeWrapperHtmlSnippet}
#' 
#' The CreativeWrapperHtmlSnippet contains the HTML snippet that is delivered
#' as the header or footer.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/CreativeWrapperService.CreativeWrapperHtmlSnippet}{Google Documentation for CreativeWrapperHtmlSnippet}
#' \describe{
#'  \item{htmlSnippet}{a string -  The HTML snippet.}
#' }
#' 
#' \strong{CreativeWrapperPage}
#' 
#' Captures a page of CreativeWrapper objects.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/CreativeWrapperService.CreativeWrapperPage}{Google Documentation for CreativeWrapperPage}
#' \describe{
#'  \item{totalResultSetSize}{a integer -  The size of the total result set to which this page belongs.}
#'  \item{startIndex}{a integer -  The absolute index in the total result set on which this page begins.}
#'  \item{results}{a CreativeWrapper -  The collection of creative wrappers contained within this page.}
#' }
#' 
#' \strong{Date}
#' 
#' Represents a date.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/CreativeWrapperService.Date}{Google Documentation for Date}
#' \describe{
#'  \item{year}{a integer -  Year (e.g., 2009)}
#'  \item{month}{a integer -  Month (1..12)}
#'  \item{day}{a integer -  Day (1..31)}
#' }
#' 
#' \strong{DateTime}
#' 
#' Represents a date combined with the time of day.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/CreativeWrapperService.DateTime}{Google Documentation for DateTime}
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
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/CreativeWrapperService.DateTimeValue}{Google Documentation for DateTimeValue}
#' \describe{
#'  \item{extends Value}{see documentation for Value}
#'  \item{value}{a DateTime -  The DateTime value.}
#' }
#' 
#' \strong{DateValue}
#' 
#' Contains a date value.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/CreativeWrapperService.DateValue}{Google Documentation for DateValue}
#' \describe{
#'  \item{extends Value}{see documentation for Value}
#'  \item{value}{a Date -  The Date value.}
#' }
#' 
#' \strong{DeactivateCreativeWrappers}
#' 
#' The action used for deactivating CreativeWrapper objects.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/CreativeWrapperService.DeactivateCreativeWrappers}{Google Documentation for DeactivateCreativeWrappers}
#' \describe{
#'  \item{extends CreativeWrapperAction}{see documentation for CreativeWrapperAction}
#' }
#' 
#' \strong{FeatureError}
#' 
#' Errors related to feature management. If you attempt using a feature that is
#' not available to the current network you'll receive a FeatureError with the
#' missing feature as the trigger.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/CreativeWrapperService.FeatureError}{Google Documentation for FeatureError}
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
#' \strong{InternalApiError}
#' 
#' Indicates that a server-side error has occured. InternalApiErrors are
#' generally not the result of an invalid request or message sent by the
#' client.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/CreativeWrapperService.InternalApiError}{Google Documentation for InternalApiError}
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
#' \strong{LabelError}
#' 
#' Errors specific to labels.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/CreativeWrapperService.LabelError}{Google Documentation for LabelError}
#' \describe{
#'  \item{extends ApiError}{see documentation for ApiError}
#'  \item{reason}{a LabelError.Reason - The error reason represented by an enum. This can take one of the following values:
#'    \itemize{
#'      \item{INVALID_PREFIX - A user created label cannot begin with the Google internal system label
#' prefix.}
#'      \item{NAME_INVALID_CHARS - Label name contains unsupported or reserved characters.}
#'      \item{UNKNOWN - The value returned if the actual value is not exposed by the requested API
#' version.}
#'    }
#'   }
#' }
#' 
#' \strong{NotNullError}
#' 
#' Caused by supplying a null value for an attribute that cannot be null.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/CreativeWrapperService.NotNullError}{Google Documentation for NotNullError}
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
#' \strong{NullError}
#' 
#' Errors associated with violation of a NOT NULL check.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/CreativeWrapperService.NullError}{Google Documentation for NullError}
#' \describe{
#'  \item{extends ApiError}{see documentation for ApiError}
#'  \item{reason}{a NullError.Reason - The error reason represented by an enum. This can take one of the following values:
#'    \itemize{
#'      \item{NULL_CONTENT - Specified list/container must not contain any null elements}
#'    }
#'   }
#' }
#' 
#' \strong{NumberValue}
#' 
#' Contains a numeric value.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/CreativeWrapperService.NumberValue}{Google Documentation for NumberValue}
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
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/CreativeWrapperService.ObjectValue}{Google Documentation for ObjectValue}
#' \describe{
#'  \item{extends Value}{see documentation for Value}
#' }
#' 
#' \strong{ParseError}
#' 
#' Lists errors related to parsing.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/CreativeWrapperService.ParseError}{Google Documentation for ParseError}
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
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/CreativeWrapperService.PermissionError}{Google Documentation for PermissionError}
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
#' \strong{PublisherQueryLanguageContextError}
#' 
#' An error that occurs while executing a PQL query contained in a Statement
#' object.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/CreativeWrapperService.PublisherQueryLanguageContextError}{Google Documentation for PublisherQueryLanguageContextError}
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
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/CreativeWrapperService.PublisherQueryLanguageSyntaxError}{Google Documentation for PublisherQueryLanguageSyntaxError}
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
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/CreativeWrapperService.QuotaError}{Google Documentation for QuotaError}
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
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/CreativeWrapperService.RequiredError}{Google Documentation for RequiredError}
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
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/CreativeWrapperService.ServerError}{Google Documentation for ServerError}
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
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/CreativeWrapperService.SetValue}{Google Documentation for SetValue}
#' \describe{
#'  \item{extends Value}{see documentation for Value}
#'  \item{values}{a Value -  The values. They must all be the same type of Value and not contain
#' duplicates.}
#' }
#' 
#' \strong{SoapRequestHeader}
#' 
#' Represents the SOAP request header used by API requests.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/CreativeWrapperService.SoapRequestHeader}{Google Documentation for SoapRequestHeader}
#' \describe{
#'  \item{networkCode}{a string -  The network code to use in the context of a request.}
#'  \item{applicationName}{a string -  The name of client library application.}
#' }
#' 
#' \strong{SoapResponseHeader}
#' 
#' Represents the SOAP request header used by API responses.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/CreativeWrapperService.SoapResponseHeader}{Google Documentation for SoapResponseHeader}
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
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/CreativeWrapperService.Statement}{Google Documentation for Statement}
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
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/CreativeWrapperService.StatementError}{Google Documentation for StatementError}
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
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/CreativeWrapperService.String_ValueMapEntry}{Google Documentation for String_ValueMapEntry}
#' \describe{
#'  \item{key}{a string}
#'  \item{value}{a Value}
#' }
#' 
#' \strong{StringLengthError}
#' 
#' Errors for Strings which do not meet given length constraints.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/CreativeWrapperService.StringLengthError}{Google Documentation for StringLengthError}
#' \describe{
#'  \item{extends ApiError}{see documentation for ApiError}
#'  \item{reason}{a StringLengthError.Reason - This can take one of the following values:
#'    \itemize{
#'      \item{TOO_LONG}
#'      \item{TOO_SHORT}
#'      \item{UNKNOWN - The value returned if the actual value is not exposed by the requested API
#' version.}
#'    }
#'   }
#' }
#' 
#' \strong{TextValue}
#' 
#' Contains a string value.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/CreativeWrapperService.TextValue}{Google Documentation for TextValue}
#' \describe{
#'  \item{extends Value}{see documentation for Value}
#'  \item{value}{a string -  The string value.}
#' }
#' 
#' \strong{TypeError}
#' 
#' An error for a field which is an invalid type.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/CreativeWrapperService.TypeError}{Google Documentation for TypeError}
#' \describe{
#'  \item{extends ApiError}{see documentation for ApiError}
#' }
#' 
#' \strong{UniqueError}
#' 
#' An error for a field which must satisfy a uniqueness constraint
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/CreativeWrapperService.UniqueError}{Google Documentation for UniqueError}
#' \describe{
#'  \item{extends ApiError}{see documentation for ApiError}
#' }
#' 
#' \strong{UpdateResult}
#' 
#' Represents the result of performing an action on objects.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/CreativeWrapperService.UpdateResult}{Google Documentation for UpdateResult}
#' \describe{
#'  \item{numChanges}{a integer -  The number of objects that were changed as a result of performing the
#' action.}
#' }
#' 
#' \strong{Value}
#' 
#' Value represents a value.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/CreativeWrapperService.Value}{Google Documentation for Value}
#' \describe{
#' }
#' 
#' 
#' 
#' @usage dfp_CreativeWrapperService_object_factory(obj_type, obj_data)
#' 
#' @param obj_type a string from one of the object types described below
#' @param obj_data a \code{list} of \code{lists} or a \code{data.frame} with the required components to create
#' the obj_type specified. All input names must match the expected attributes for the object.
#' If submitting a list of attributes to create 1 object make sure to nest it inside top-level list, so that
#' it is a list of length 1 with 1 list of attributes to create the object.
#' @return a string of formatted XML that can be inserted into a SOAP request body to the API
#' @export
dfp_CreativeWrapperService_object_factory <- function(obj_type, obj_data){

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

  if(obj_type=='CreativeWrapper'){
    stopifnot(all(sampled_names %in% c('id', 'labelId', 'header', 'footer', 'ordering', 'status')))
  }

  if(obj_type=='CreativeWrapperError'){
    stopifnot(all(sampled_names %in% c('reason')))
  }

  if(obj_type=='CreativeWrapperHtmlSnippet'){
    stopifnot(all(sampled_names %in% c('htmlSnippet')))
  }

  if(obj_type=='CreativeWrapperPage'){
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

  if(obj_type=='FeatureError'){
    stopifnot(all(sampled_names %in% c('reason')))
  }

  if(obj_type=='InternalApiError'){
    stopifnot(all(sampled_names %in% c('reason')))
  }

  if(obj_type=='LabelError'){
    stopifnot(all(sampled_names %in% c('reason')))
  }

  if(obj_type=='NotNullError'){
    stopifnot(all(sampled_names %in% c('reason')))
  }

  if(obj_type=='NullError'){
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

  if(obj_type=='StringLengthError'){
    stopifnot(all(sampled_names %in% c('reason')))
  }

  if(obj_type=='TextValue'){
    stopifnot(all(sampled_names %in% c('value')))
  }

  if(obj_type=='UpdateResult'){
    stopifnot(all(sampled_names %in% c('numChanges')))
  }

}
#' 
#' createCreativeWrappers
#' 
#' Creates a new CreativeWrapper objects. The following fields are required: <ul> <li>CreativeWrapper labelId</li> <li>CreativeWrapper ordering</li> <li>CreativeWrapper header or CreativeWrapper footer</li> </ul>
#' 
#' @usage dfp_createCreativeWrappers(request_data)
#' @param request_data a \code{list} or \code{data.frame} of data elements
#' to be formatted for a SOAP request (XML format, but passed as character string)#' @return a \code{list} containing all the elements of a createCreativeWrappersResponse
#' @export
dfp_createCreativeWrappers <- function(request_data){

  request_body <- make_request_body(service='CreativeWrapperService', root_name='createCreativeWrappers', data=request_data)
  request <- build_soap_request(body = request_body)

  response <- xmlChildren(xmlChildren(xmlChildren(xmlRoot(request))$Body)[['createCreativeWrappersResponse']])$rval
  response <- if(is.null(response)) NULL else xmlToList(response)
  return(response)
}
#' 
#' getCreativeWrappersByStatement
#' 
#' Gets a CreativeWrapperPage of CreativeWrapper objects that satisfy the given Statement query. The following fields are supported for filtering:  a set of creative wrappers. 
#' \itemize{
#'   \item{id}
#'   \item{labelId}
#'   \item{status}
#'   \item{ordering}
#' }
#' 
#' @usage dfp_getCreativeWrappersByStatement(request_data)
#' @param request_data a \code{list} or \code{data.frame} of data elements
#' to be formatted for a SOAP request (XML format, but passed as character string)#' @return a \code{list} containing all the elements of a getCreativeWrappersByStatementResponse
#' @export
dfp_getCreativeWrappersByStatement <- function(request_data){

  request_body <- make_request_body(service='CreativeWrapperService', root_name='getCreativeWrappersByStatement', data=request_data)
  request <- build_soap_request(body = request_body)

  response <- xmlChildren(xmlChildren(xmlChildren(xmlRoot(request))$Body)[['getCreativeWrappersByStatementResponse']])$rval
  response <- if(is.null(response)) NULL else xmlToList(response)
  return(response)
}
#' 
#' performCreativeWrapperAction
#' 
#' Performs actions on CreativeWrapper objects that match the given Statement query. a set of labels
#' 
#' @usage dfp_performCreativeWrapperAction()
#' @return a \code{list} containing all the elements of a performCreativeWrapperActionResponse
#' @export
dfp_performCreativeWrapperAction <- function(){

  request_body <- make_request_body(service='CreativeWrapperService', root_name='performCreativeWrapperAction', data=NULL)
  request <- build_soap_request(body = request_body)

  response <- xmlChildren(xmlChildren(xmlChildren(xmlRoot(request))$Body)[['performCreativeWrapperActionResponse']])$rval
  response <- if(is.null(response)) NULL else xmlToList(response)
  return(response)
}
#' 
#' updateCreativeWrappers
#' 
#' Updates the specified CreativeWrapper objects.
#' 
#' @usage dfp_updateCreativeWrappers(request_data)
#' @param request_data a \code{list} or \code{data.frame} of data elements
#' to be formatted for a SOAP request (XML format, but passed as character string)#' @return a \code{list} containing all the elements of a updateCreativeWrappersResponse
#' @export
dfp_updateCreativeWrappers <- function(request_data){

  request_body <- make_request_body(service='CreativeWrapperService', root_name='updateCreativeWrappers', data=request_data)
  request <- build_soap_request(body = request_body)

  response <- xmlChildren(xmlChildren(xmlChildren(xmlRoot(request))$Body)[['updateCreativeWrappersResponse']])$rval
  response <- if(is.null(response)) NULL else xmlToList(response)
  return(response)
}
#' 