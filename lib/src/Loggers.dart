@JS("signalR")
library Loggers;

import "package:js/js.dart";
import "ILogger.dart" show ILogger;

/// A logger that does nothing when log messages are sent to it.
@JS()
class NullLogger implements ILogger {
  // @Ignore
  NullLogger.fakeConstructor$();

  /// The singleton instance of the [NullLogger].
  external static ILogger get instance;
  external static set instance(ILogger v);
  external factory NullLogger();

  /// @inheritDoc
  external void log(num /*enum LogLevel*/ logLevel, String message);
}
