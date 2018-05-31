@JS("signalR")
library ILogger;

import "package:js/js.dart";

/// Indicates the severity of a log message.
/// Log Levels are ordered in increasing severity. So `Debug` is more severe than `Trace`, etc.
@JS()
class LogLevel {
  external static num get

      /// Log level for very low severity diagnostic messages.
      Trace;
  external static num get

      /// Log level for low severity diagnostic messages.
      Debug;
  external static num get

      /// Log level for informational diagnostic messages.
      Information;
  external static num get

      /// Log level for diagnostic messages that indicate a non-fatal problem.
      Warning;
  external static num get

      /// Log level for diagnostic messages that indicate a failure in the current operation.
      Error;
  external static num get

      /// Log level for diagnostic messages that indicate a failure that will terminate the entire application.
      Critical;
  external static num get

      /// The highest possible log level. Used when configuring logging to indicate that no log messages should be emitted.
      None;
}

/// An abstraction that provides a sink for diagnostic messages.
@anonymous
@JS()
abstract class ILogger {
  /// Called by the framework to emit a diagnostic message.
  external void log(num /*enum LogLevel*/ logLevel, String message);
}
