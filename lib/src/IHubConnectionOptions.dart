@JS()
library IHubConnectionOptions;

import "package:js/js.dart";
import "IHttpConnectionOptions.dart" show IHttpConnectionOptions;
import "IHubProtocol.dart" show IHubProtocol;
import "HttpClient.dart" show IHttpClient;
import "Transports.dart" show ITransport;
import "ILogger.dart" show ILogger;

@anonymous
@JS()
abstract class IHubConnectionOptions implements IHttpConnectionOptions {
  external IHubProtocol get protocol;
  external set protocol(IHubProtocol v);
  external factory IHubConnectionOptions(
      {IHubProtocol protocol,
      IHttpClient httpClient,
      dynamic /*enum TransportType|ITransport*/ transport,
      dynamic /*ILogger|enum LogLevel*/ logging});
}
