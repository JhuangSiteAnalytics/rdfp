#' ReconciliationReportService
#' 
#' Provides methods for retrieving, submitting and reverting the
#' ReconciliationReport objects.
#' A ReconciliationReport is a group of
#' ReconciliationReportRow objects.
#' 
#' ReconciliationReportService Object Factory
#' 
#' A function to create a variety of objects that are part of the ReconciliationReportService
#' Note: not all objects here are inputs to the functions of this service so 
#' please consult each function for the required inputs
#' 
#' Below is a list of objects and their required components to be created with this function:
#' 
#' \strong{ApiError}
#' 
#' The API error base class that provides details about an error that occurred
#' while processing a service request. The OGNL field path is provided for
#' parsers to identify the request data element that may have caused the error.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ReconciliationReportService.ApiError}{Google Documentation for ApiError}
#' \describe{
#'  \item{fieldPath}{a string -  The OGNL field path to identify cause of error.}
#'  \item{trigger}{a string -  The data that caused the error.}
#'  \item{errorString}{a string -  A simple string representation of the error and reason.}
#' }
#' 
#' \strong{ApiException}
#' 
#' Exception class for holding a list of service errors.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ReconciliationReportService.ApiException}{Google Documentation for ApiException}
#' \describe{
#'  \item{message}{a string (inherited from ApplicationException) -  Error message.}
#'  \item{errors}{a ApiError -  List of errors.}
#' }
#' 
#' \strong{ApiVersionError}
#' 
#' Errors related to the usage of API versions.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ReconciliationReportService.ApiVersionError}{Google Documentation for ApiVersionError}
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
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ReconciliationReportService.ApplicationException}{Google Documentation for ApplicationException}
#' \describe{
#'  \item{message}{a string -  Error message.}
#' }
#' 
#' \strong{AuthenticationError}
#' 
#' An error for an exception that occurred when authenticating.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ReconciliationReportService.AuthenticationError}{Google Documentation for AuthenticationError}
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
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ReconciliationReportService.BooleanValue}{Google Documentation for BooleanValue}
#' \describe{
#'  \item{extends Value}{see documentation for Value}
#'  \item{value}{a boolean -  The boolean value.}
#' }
#' 
#' \strong{CollectionSizeError}
#' 
#' Error for the size of the collection being too large
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ReconciliationReportService.CollectionSizeError}{Google Documentation for CollectionSizeError}
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
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ReconciliationReportService.CommonError}{Google Documentation for CommonError}
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
#' \strong{Date}
#' 
#' Represents a date.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ReconciliationReportService.Date}{Google Documentation for Date}
#' \describe{
#'  \item{year}{a integer -  Year (e.g., 2009)}
#'  \item{month}{a integer -  Month (1..12)}
#'  \item{day}{a integer -  Day (1..31)}
#' }
#' 
#' \strong{DateTime}
#' 
#' Represents a date combined with the time of day.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ReconciliationReportService.DateTime}{Google Documentation for DateTime}
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
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ReconciliationReportService.DateTimeValue}{Google Documentation for DateTimeValue}
#' \describe{
#'  \item{extends Value}{see documentation for Value}
#'  \item{value}{a DateTime -  The DateTime value.}
#' }
#' 
#' \strong{DateValue}
#' 
#' Contains a date value.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ReconciliationReportService.DateValue}{Google Documentation for DateValue}
#' \describe{
#'  \item{extends Value}{see documentation for Value}
#'  \item{value}{a Date -  The Date value.}
#' }
#' 
#' \strong{FeatureError}
#' 
#' Errors related to feature management. If you attempt using a feature that is
#' not available to the current network you'll receive a FeatureError with the
#' missing feature as the trigger.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ReconciliationReportService.FeatureError}{Google Documentation for FeatureError}
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
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ReconciliationReportService.InternalApiError}{Google Documentation for InternalApiError}
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
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ReconciliationReportService.NotNullError}{Google Documentation for NotNullError}
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
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ReconciliationReportService.NullError}{Google Documentation for NullError}
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
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ReconciliationReportService.NumberValue}{Google Documentation for NumberValue}
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
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ReconciliationReportService.ObjectValue}{Google Documentation for ObjectValue}
#' \describe{
#'  \item{extends Value}{see documentation for Value}
#' }
#' 
#' \strong{ParseError}
#' 
#' Lists errors related to parsing.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ReconciliationReportService.ParseError}{Google Documentation for ParseError}
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
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ReconciliationReportService.PermissionError}{Google Documentation for PermissionError}
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
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ReconciliationReportService.PublisherQueryLanguageContextError}{Google Documentation for PublisherQueryLanguageContextError}
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
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ReconciliationReportService.PublisherQueryLanguageSyntaxError}{Google Documentation for PublisherQueryLanguageSyntaxError}
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
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ReconciliationReportService.QuotaError}{Google Documentation for QuotaError}
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
#' \strong{RangeError}
#' 
#' A list of all errors associated with the Range constraint.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ReconciliationReportService.RangeError}{Google Documentation for RangeError}
#' \describe{
#'  \item{extends ApiError}{see documentation for ApiError}
#'  \item{reason}{a RangeError.Reason - This can take one of the following values:
#'    \itemize{
#'      \item{TOO_HIGH}
#'      \item{TOO_LOW}
#'      \item{UNKNOWN - The value returned if the actual value is not exposed by the requested API
#' version.}
#'    }
#'   }
#' }
#' 
#' \strong{ReconciliationError}
#' 
#' Lists all errors associated with reconciliation.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ReconciliationReportService.ReconciliationError}{Google Documentation for ReconciliationError}
#' \describe{
#'  \item{extends ApiError}{see documentation for ApiError}
#'  \item{reason}{a ReconciliationError.Reason - The error reason represented by an enum. This can take one of the following values:
#'    \itemize{
#'      \item{CANNOT_CREATE_RECONCILIATION_REPORT_VERSION - Reconciliation report is reconciled, and need to revert. Or reconciliation
#' report is Deleted, and not possible.}
#'      \item{INVALID_RECONCILIATION_REPORT_STATE_TRANSITION - Reconciliation report can't be put into that reconciliation state.}
#'      \item{INVALID_RECONCILIATION_PROPOSAL_SUBMISSION_SEQUENCE - Previous cycles of the proposal must be reconciled first.}
#'      \item{USER_CANNOT_RECONCILE_RECONCILIATION_REPORT - User does not have permission to put reconciliation report into reconciled
#' state.}
#'      \item{CONTRACTED_VOLUME_CANNOT_BE_NULL - The billed from is contracted, but the contracted volume cannot be null.}
#'      \item{DFP_VOLUME_CANNOT_BE_NULL - The billed from is DFP, but the DFP volume cannot be null.}
#'      \item{MANUAL_VOLUME_CANNOT_BE_NULL - The billed from is manual, but the manual volume cannot be null.}
#'      \item{THIRD_PARTY_VOLUME_CANNOT_BE_NULL - The billed from is third-party, but the third-party volume cannot be null.}
#'      \item{DUPLICATE_LINE_ITEM_AND_CREATIVE - Duplicate tuples of (line item ID, creative ID).}
#'      \item{CANNOT_RECONCILE_LINE_ITEM_CREATIVE - Cannot reconcile the ReconciliationReportRow as the line item ID and the
#' creative ID association is invalid.}
#'      \item{LINE_ITEM_DAYS_MISMATCH - Third-party days delivered and manual days delivered cannot differ for rows
#' with same line item ID when line item cost type is CPD.}
#'      \item{LINE_ITEM_BILL_OFF_OF_MISMATCH - ReconciliationReportRow billFrom field cannot differ for rows with same line
#' item id when line item cost type is CPD.}
#'      \item{CANNOT_MODIFY_RECONCILED_ORDER - The order of the modifying rows in under reconciled status. The row couldn't
#' be changed.}
#'      \item{CANNOT_MODIFY_ACROSS_MULTIPLE_RECONCILIATION_REPORTS - Can not modify across multiple reconciliation reports.}
#'      \item{CANNOT_UPDATE_VOLUME_WHEN_BILLABLE_REVENUE_OVERRIDDEN - Cannot update reconciled volume when a billable revenue override is set.}
#'      \item{UNKNOWN - The value returned if the actual value is not exposed by the requested API
#' version.}
#'    }
#'   }
#' }
#' 
#' \strong{ReconciliationImportError}
#' 
#' The API errors for reconciliation CSV import.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ReconciliationReportService.ReconciliationImportError}{Google Documentation for ReconciliationImportError}
#' \describe{
#'  \item{extends ApiError}{see documentation for ApiError}
#'  \item{reason}{a ReconciliationImportError.Reason - The error reason represented by an enum. This can take one of the following values:
#'    \itemize{
#'      \item{MISSING_EDITABLE_COLUMN - The imported CSV missing some editable and essential columns.}
#'      \item{INCONSISTENT_IMPORT_COLUMNS - The imported CSV columns count doesn't equal with defined columns count.}
#'      \item{COLUMN_CONVERSION_TYPE_ERROR - The imported CSV column value cannot be converted to defined entity type.}
#'      \item{INCONSISTENT_COLUMNS_COUNT - The imported CSV column values count are less or more than field headers
#' count.}
#'      \item{IMPORT_INTERNAL_ERROR - The imported CSV cause an internal error which is out of expectation.}
#'      \item{UNKNOWN - The value returned if the actual value is not exposed by the requested API
#' version.}
#'    }
#'   }
#' }
#' 
#' \strong{ReconciliationReport}
#' 
#' A ReconciliationReport represents a report that can be reconciled.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ReconciliationReportService.ReconciliationReport}{Google Documentation for ReconciliationReport}
#' \describe{
#'  \item{id}{a integer -  The unique ID of the ReconciliationReport. This attribute is read-only.}
#'  \item{status}{a ReconciliationReportStatus - The reconciliation state of the ReconciliationReport. This attribute is
#' read-only. This can take one of the following values:
#'    \itemize{
#'      \item{DRAFT - The starting status of a reconciliation report. Reconciliation reports are
#' updatable in the DRAFT state.}
#'      \item{RECONCILED - The final status of a reconciliation report. Reconciliation reports are not
#' updatable in the RECONCILED state.}
#'      \item{REVERTED - A similar status as DRAFT. Reconciliation reports are updatable in the
#' REVERTED state.}
#'      \item{PENDING - It indicates that the reconciliation report is not ready for various of
#' reasons. Reconciliation reports in the PENDING state can't be viewed in the
#' DoubleClick for Publisher UI.}
#'      \item{UNKNOWN - The value returned if the actual value is not exposed by the requested API
#' version.}
#'    }
#'   }
#'  \item{startDate}{a Date -  The start date of a billing period. Billing period is monthly. This
#' attribute is read-only.}
#'  \item{notes}{a string -  The reconciliation report notes. This attribute is optional and has a
#' maximum length of 65535.}
#' }
#' 
#' \strong{ReconciliationReportPage}
#' 
#' Captures a page of ReconciliationReport objects
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ReconciliationReportService.ReconciliationReportPage}{Google Documentation for ReconciliationReportPage}
#' \describe{
#'  \item{totalResultSetSize}{a integer -  The size of the total result set to which this page belongs.}
#'  \item{startIndex}{a integer -  The absolute index in the total result set on which this page begins.}
#'  \item{results}{a ReconciliationReport -  The collection of reconciliation reports contained within this page.}
#' }
#' 
#' \strong{RequiredError}
#' 
#' Errors due to missing required field.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ReconciliationReportService.RequiredError}{Google Documentation for RequiredError}
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
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ReconciliationReportService.ServerError}{Google Documentation for ServerError}
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
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ReconciliationReportService.SetValue}{Google Documentation for SetValue}
#' \describe{
#'  \item{extends Value}{see documentation for Value}
#'  \item{values}{a Value -  The values. They must all be the same type of Value and not contain
#' duplicates.}
#' }
#' 
#' \strong{SoapRequestHeader}
#' 
#' Represents the SOAP request header used by API requests.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ReconciliationReportService.SoapRequestHeader}{Google Documentation for SoapRequestHeader}
#' \describe{
#'  \item{networkCode}{a string -  The network code to use in the context of a request.}
#'  \item{applicationName}{a string -  The name of client library application.}
#' }
#' 
#' \strong{SoapResponseHeader}
#' 
#' Represents the SOAP request header used by API responses.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ReconciliationReportService.SoapResponseHeader}{Google Documentation for SoapResponseHeader}
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
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ReconciliationReportService.Statement}{Google Documentation for Statement}
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
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ReconciliationReportService.StatementError}{Google Documentation for StatementError}
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
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ReconciliationReportService.String_ValueMapEntry}{Google Documentation for String_ValueMapEntry}
#' \describe{
#'  \item{key}{a string}
#'  \item{value}{a Value}
#' }
#' 
#' \strong{TextValue}
#' 
#' Contains a string value.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ReconciliationReportService.TextValue}{Google Documentation for TextValue}
#' \describe{
#'  \item{extends Value}{see documentation for Value}
#'  \item{value}{a string -  The string value.}
#' }
#' 
#' \strong{Value}
#' 
#' Value represents a value.
#' \href{https://developers.google.com/doubleclick-publishers/docs/reference/v201508/ReconciliationReportService.Value}{Google Documentation for Value}
#' \describe{
#' }
#' 
#' 
#' 
#' @usage dfp_ReconciliationReportService_object_factory(obj_type, obj_data)
#' 
#' @param obj_type a string from one of the object types described below
#' @param obj_data a \code{list} of \code{lists} or a \code{data.frame} with the required components to create
#' the obj_type specified. All input names must match the expected attributes for the object.
#' If submitting a list of attributes to create 1 object make sure to nest it inside top-level list, so that
#' it is a list of length 1 with 1 list of attributes to create the object.
#' @return a string of formatted XML that can be inserted into a SOAP request body to the API
#' @export
dfp_ReconciliationReportService_object_factory <- function(obj_type, obj_data){

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

  if(obj_type=='RangeError'){
    stopifnot(all(sampled_names %in% c('reason')))
  }

  if(obj_type=='ReconciliationError'){
    stopifnot(all(sampled_names %in% c('reason')))
  }

  if(obj_type=='ReconciliationImportError'){
    stopifnot(all(sampled_names %in% c('reason')))
  }

  if(obj_type=='ReconciliationReport'){
    stopifnot(all(sampled_names %in% c('id', 'status', 'startDate', 'notes')))
  }

  if(obj_type=='ReconciliationReportPage'){
    stopifnot(all(sampled_names %in% c('totalResultSetSize', 'startIndex', 'results')))
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

}
#' 
#' getReconciliationReportsByStatement
#' 
#' Gets an ReconciliationReportPage of ReconciliationReport objects that satisfy the given Statement query. The following fields are supported for filtering.  filter a set of reconciliation reports 
#' \itemize{
#'   \item{id}
#'   \item{status}
#'   \item{startDate}
#' }
#' 
#' @usage dfp_getReconciliationReportsByStatement(request_data)
#' @param request_data a \code{list} or \code{data.frame} of data elements
#' to be formatted for a SOAP request (XML format, but passed as character string)#' @return a \code{list} containing all the elements of a getReconciliationReportsByStatementResponse
#' @export
dfp_getReconciliationReportsByStatement <- function(request_data){

  request_body <- make_request_body(service='ReconciliationReportService', root_name='getReconciliationReportsByStatement', data=request_data)
  request <- build_soap_request(body = request_body)

  response <- xmlChildren(xmlChildren(xmlChildren(xmlRoot(request))$Body)[['getReconciliationReportsByStatementResponse']])$rval
  response <- if(is.null(response)) NULL else xmlToList(response)
  return(response)
}
#' 
#' updateReconciliationReports
#' 
#' Updates the specified ReconciliationReport objects.
#' 
#' @usage dfp_updateReconciliationReports(request_data)
#' @param request_data a \code{list} or \code{data.frame} of data elements
#' to be formatted for a SOAP request (XML format, but passed as character string)#' @return a \code{list} containing all the elements of a updateReconciliationReportsResponse
#' @export
dfp_updateReconciliationReports <- function(request_data){

  request_body <- make_request_body(service='ReconciliationReportService', root_name='updateReconciliationReports', data=request_data)
  request <- build_soap_request(body = request_body)

  response <- xmlChildren(xmlChildren(xmlChildren(xmlRoot(request))$Body)[['updateReconciliationReportsResponse']])$rval
  response <- if(is.null(response)) NULL else xmlToList(response)
  return(response)
}
#' 