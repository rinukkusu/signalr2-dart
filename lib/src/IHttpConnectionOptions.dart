@JS()
library IHttpConnectionOptions;

import "package:js/js.dart";
import "HttpClient.dart" show IHttpClient;
import "Transports.dart" show ITransport;
import "ILogger.dart" show ILogger;

@anonymous
@JS()
abstract class IHttpConnectionOptions {
  external IHttpClient get httpClient;
  external set httpClient(IHttpClient v);
  external dynamic /*enum TransportType|ITransport*/ get transport;
  external set transport(dynamic /*enum TransportType|ITransport*/ v);
  external dynamic /*ILogger|enum LogLevel*/ get logging;
  external set logging(dynamic /*ILogger|enum LogLevel*/ v);
  external factory IHttpConnectionOptions(
      {IHttpClient httpClient,
      dynamic /*enum TransportType|ITransport*/ transport,
      dynamic /*ILogger|enum LogLevel*/ logging});
}
