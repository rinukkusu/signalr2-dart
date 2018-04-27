@JS()
library ILogger;

import "package:js/js.dart";

@JS("signalR.LogLevel")
class LogLevel {
  external static num get Trace;
  external static num get Information;
  external static num get Warning;
  external static num get Error;
  external static num get None;
}

@anonymous
@JS("signalR.ILogger")
abstract class ILogger {
  external void log(num /*enum LogLevel*/ logLevel, String message);
}
