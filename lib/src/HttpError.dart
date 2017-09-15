@JS()
library HttpError;

import "package:js/js.dart";

@JS()
class HttpError extends Error {
  // @Ignore
  HttpError.fakeConstructor$();
  external num get statusCode;
  external set statusCode(num v);
  external factory HttpError(String errorMessage, num statusCode);
}
