@JS()
library Loggers;

import "package:js/js.dart";
import "ILogger.dart" show ILogger;

@JS("signalR.NullLogger")
class NullLogger implements ILogger {
  // @Ignore
  NullLogger.fakeConstructor$();
  external void log(num /*enum LogLevel*/ logLevel, String message);
}

@JS("signalR.ConsoleLogger")
class ConsoleLogger implements ILogger {
  // @Ignore
  ConsoleLogger.fakeConstructor$();
  external get minimumLogLevel;
  external set minimumLogLevel(v);
  external factory ConsoleLogger(num /*enum LogLevel*/ minimumLogLevel);
  external void log(num /*enum LogLevel*/ logLevel, String message);
}

@JS("signalR.LoggerFactory")
class LoggerFactory {
  // @Ignore
  LoggerFactory.fakeConstructor$();
  external static ILogger createLogger(
      [dynamic /*ILogger|enum LogLevel*/ logging]);
}
