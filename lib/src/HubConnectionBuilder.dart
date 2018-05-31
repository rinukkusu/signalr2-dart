@JS()
library HubConnectionBuilder;

import "package:js/js.dart";
import "IHubProtocol.dart" show IHubProtocol;
import "IHttpConnectionOptions.dart" show IHttpConnectionOptions;
import "ILogger.dart" show ILogger;
import "HubConnection.dart" show HubConnection;

/// Copyright (c) .NET Foundation. All rights reserved.
/// Licensed under the Apache License, Version 2.0. See License.txt in the project root for license information.

/// A builder for configuring [HubConnection] instances.
@JS("signalR.HubConnectionBuilder")
class HubConnectionBuilder {
  // @Ignore
  HubConnectionBuilder.fakeConstructor$();

  /// @internal
  external IHubProtocol get protocol;
  external set protocol(IHubProtocol v);

  /// @internal
  external IHttpConnectionOptions get httpConnectionOptions;
  external set httpConnectionOptions(IHttpConnectionOptions v);

  /// @internal
  external String get url;
  external set url(String v);

  /// @internal
  external ILogger get logger;
  external set logger(ILogger v);

  /// Configures console logging for the [HubConnection].
  /*external HubConnectionBuilder configureLogging(enum LogLevel logLevel);*/
  /// Configures custom logging for the [HubConnection].
  /*external HubConnectionBuilder configureLogging(ILogger logger);*/
  /*external HubConnectionBuilder configureLogging(enum LogLevel|ILogger logging);*/
  external HubConnectionBuilder configureLogging(
      dynamic /*enum LogLevel|ILogger*/ logLevel_logger_logging);

  /// Configures the [HubConnection] to use HTTP-based transports to connect to the specified URL.
  /// The transport will be selected automatically based on what the server and client support.
  /*external HubConnectionBuilder withUrl(String url);*/
  /// Configures the [HubConnection] to use the specified HTTP-based transport to connect to the specified URL.
  /*external HubConnectionBuilder withUrl(String url, enum HttpTransportType transportType);*/
  /// Configures the [HubConnection] to use HTTP-based transports to connect to the specified URL.
  /*external HubConnectionBuilder withUrl(
    String url, IHttpConnectionOptions options);*/
  /*external HubConnectionBuilder withUrl(String url, [IHttpConnectionOptions|enum HttpTransportType transportTypeOrOptions]);*/
  external HubConnectionBuilder withUrl(String url,
      [dynamic /*enum HttpTransportType|IHttpConnectionOptions*/ transportType_options_transportTypeOrOptions]);

  /// Configures the [HubConnection] to use the specified Hub Protocol.
  external HubConnectionBuilder withHubProtocol(IHubProtocol protocol);

  /// Creates a [HubConnection] from the configuration options specified in this builder.
  external HubConnection build();
}

@JS("signalR.isLogger")
external bool /*logger is ILogger*/ isLogger(dynamic logger);
