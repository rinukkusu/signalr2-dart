@JS()
library Loggers;

import "package:js/js.dart";
import "ILogger.dart" show ILogger;

@JS()
class NullLogger implements ILogger {
  // @Ignore
  NullLogger.fakeConstructor$();
  external void log(num /*enum LogLevel*/ logLevel, String message);
}

@JS()
class ConsoleLogger implements ILogger {
  // @Ignore
  ConsoleLogger.fakeConstructor$();
  external get minimumLogLevel;
  external set minimumLogLevel(v);
  external factory ConsoleLogger(num /*enum LogLevel*/ minimumLogLevel);
  external void log(num /*enum LogLevel*/ logLevel, String message);
}

// Module LoggerFactory
@JS("LoggerFactory.createLogger")
external ILogger createLogger([dynamic /*ILogger|enum LogLevel*/ logging]);
// End module LoggerFactory
