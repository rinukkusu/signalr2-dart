@JS()
library IHttpConnectionOptions;

import "package:js/js.dart";
import "HttpClient.dart" show HttpClient;
import "ITransport.dart" show ITransport;
import "ILogger.dart" show ILogger;

/// Copyright (c) .NET Foundation. All rights reserved.
/// Licensed under the Apache License, Version 2.0. See License.txt in the project root for license information.

/// Options provided to the 'withUrl' method on [HubConnectionBuilder] to configure options for the HTTP-based transports.
@anonymous
@JS("signalR.IHttpConnectionOptions")
abstract class IHttpConnectionOptions {
  /// An [HttpClient] that will be used to make HTTP requests.
  external HttpClient get httpClient;
  external set httpClient(HttpClient v);

  /// An [HttpTransportType] value specifying the transport to use for the connection.
  external dynamic /*enum HttpTransportType|ITransport*/ get transport;
  external set transport(dynamic /*enum HttpTransportType|ITransport*/ v);

  /// Configures the logger used for logging.
  /// Provide an [ILogger] instance, and log messages will be logged via that instance. Alternatively, provide a value from
  /// the [LogLevel] enumeration and a default logger which logs to the Console will be configured to log messages of the specified
  /// level (or higher).
  external dynamic /*ILogger|enum LogLevel*/ get logger;
  external set logger(dynamic /*ILogger|enum LogLevel*/ v);

  /// A function that provides an access token required for HTTP Bearer authentication.
  external dynamic /*String|Promise<String>*/ accessTokenFactory();

  /// A boolean indicating if message content should be logged.
  /// Message content can contain sensitive user data, so this is disabled by default.
  external bool get logMessageContent;
  external set logMessageContent(bool v);

  /// A boolean indicating if negotiation should be skipped.
  /// Negotiation can only be skipped when the [transport] property is set to 'HttpTransportType.WebSockets'.
  external bool get skipNegotiation;
  external set skipNegotiation(bool v);
}
