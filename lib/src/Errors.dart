@JS()
library Errors;

import "package:js/js.dart";

/// Error thrown when an HTTP request fails.
@JS("signalR.HttpError")
class HttpError extends Error {
  // @Ignore
  HttpError.fakeConstructor$();
  external get JS$___proto__;
  external set JS$___proto__(v);

  /// The HTTP status code represented by this error.
  external num get statusCode;
  external set statusCode(num v);

  /// Constructs a new instance of [HttpError].
  external factory HttpError(String errorMessage, num statusCode);
}

/// Error thrown when a timeout elapses.
@JS("signalR.TimeoutError")
class TimeoutError extends Error {
  // @Ignore
  TimeoutError.fakeConstructor$();

  /// tslint:disable-next-line:variable-name
  external Error get JS$___proto__;
  external set JS$___proto__(Error v);

  /// Constructs a new instance of [TimeoutError].
  external factory TimeoutError([String errorMessage]);
}
