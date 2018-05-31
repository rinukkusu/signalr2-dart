@JS()
library ILogger;

import "package:js/js.dart";

/// Copyright (c) .NET Foundation. All rights reserved.
/// Licensed under the Apache License, Version 2.0. See License.txt in the project root for license information.

/// These values are designed to match the ASP.NET Log Levels since that's the pattern we're emulating here.
/// Indicates the severity of a log message.
/// Log Levels are ordered in increasing severity. So `Debug` is more severe than `Trace`, etc.
@JS("signalR.LogLevel")
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
@JS("signalR.ILogger")
abstract class ILogger {
  /// Called by the framework to emit a diagnostic message.
  external void log(num /*enum LogLevel*/ logLevel, String message);
}
