@JS("signalR")
library HubConnectionBuilder;

import "package:js/js.dart";
import "ILogger.dart" show ILogger;
import "IHttpConnectionOptions.dart" show IHttpConnectionOptions;
import "IHubProtocol.dart" show IHubProtocol;
import "HubConnection.dart" show HubConnection;

/// A builder for configuring [HubConnection] instances.
@JS()
class HubConnectionBuilder {
  /// Configures console logging for the [HubConnection].
  /*external HubConnectionBuilder configureLogging(enum LogLevel logLevel);*/
  /// Configures custom logging for the [HubConnection].
  /*external HubConnectionBuilder configureLogging(ILogger logger);*/
  external HubConnectionBuilder configureLogging(
      dynamic /*enum LogLevel|ILogger*/ logLevel_logger);

  /// Configures the [HubConnection] to use HTTP-based transports to connect to the specified URL.
  /// The transport will be selected automatically based on what the server and client support.
  /*external HubConnectionBuilder withUrl(String url);*/
  /// Configures the [HubConnection] to use the specified HTTP-based transport to connect to the specified URL.
  /*external HubConnectionBuilder withUrl(String url, enum HttpTransportType transportType);*/
  /// Configures the [HubConnection] to use HTTP-based transports to connect to the specified URL.
  /*external HubConnectionBuilder withUrl(
    String url, IHttpConnectionOptions options);*/
  external HubConnectionBuilder withUrl(String url,
      [dynamic /*enum HttpTransportType|IHttpConnectionOptions*/ transportType_options]);

  /// Configures the [HubConnection] to use the specified Hub Protocol.
  external HubConnectionBuilder withHubProtocol(IHubProtocol protocol);

  /// Creates a [HubConnection] from the configuration options specified in this builder.
  external HubConnection build();
}
