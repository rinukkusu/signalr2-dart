@JS()
library Errors;

import "package:js/js.dart";

@JS("signalR.HttpError")
class HttpError extends Error {
  // @Ignore
  HttpError.fakeConstructor$();
  external get JS$___proto__;
  external set JS$___proto__(v);
  external num get statusCode;
  external set statusCode(num v);
  external factory HttpError(String errorMessage, num statusCode);
}

@JS("signalR.TimeoutError")
class TimeoutError extends Error {
  // @Ignore
  TimeoutError.fakeConstructor$();
  external get JS$___proto__;
  external set JS$___proto__(v);
  external factory TimeoutError([String errorMessage]);
}
