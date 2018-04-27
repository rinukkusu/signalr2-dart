@JS()
library Transports;

import 'dart:async';
import "package:js/js.dart";
import "IConnection.dart" show IConnection;
import "Common.dart" show DataReceived, TransportClosed;
import "ILogger.dart" show ILogger;
import "HttpClient.dart" show HttpClient;

@JS("signalR.TransportType")
class TransportType {
  external static num get WebSockets;
  external static num get ServerSentEvents;
  external static num get LongPolling;
}

@JS("signalR.TransferFormat")
class TransferFormat {
  external static num get Text;
  external static num get Binary;
}

@anonymous
@JS("signalR.ITransport")
abstract class ITransport {
  external Future<Null> connect(String url,
      num /*enum TransferFormat*/ transferFormat, IConnection connection);
  external Future<Null> send(dynamic data);
  external Future<Null> stop();
  external DataReceived get onreceive;
  external set onreceive(DataReceived v);
  external TransportClosed get onclose;
  external set onclose(TransportClosed v);
}

@JS("signalR.WebSocketTransport")
class WebSocketTransport implements ITransport {
  // @Ignore
  WebSocketTransport.fakeConstructor$();
  external get logger;
  external set logger(v);
  external get accessTokenFactory;
  external set accessTokenFactory(v);
  external get webSocket;
  external set webSocket(v);
  external factory WebSocketTransport(
      String accessTokenFactory(), ILogger logger);
  external Future<Null> connect(String url,
      num /*enum TransferFormat*/ transferFormat, IConnection connection);
  external Future<Null> send(dynamic data);
  external Future<Null> stop();
  external DataReceived get onreceive;
  external set onreceive(DataReceived v);
  external TransportClosed get onclose;
  external set onclose(TransportClosed v);
}

@JS("signalR.ServerSentEventsTransport")
class ServerSentEventsTransport implements ITransport {
  // @Ignore
  ServerSentEventsTransport.fakeConstructor$();
  external get httpClient;
  external set httpClient(v);
  external get accessTokenFactory;
  external set accessTokenFactory(v);
  external get logger;
  external set logger(v);
  external get eventSource;
  external set eventSource(v);
  external get url;
  external set url(v);
  external factory ServerSentEventsTransport(
      HttpClient httpClient, String accessTokenFactory(), ILogger logger);
  external Future<Null> connect(String url,
      num /*enum TransferFormat*/ transferFormat, IConnection connection);
  external Future<Null> send(dynamic data);
  external Future<Null> stop();
  external DataReceived get onreceive;
  external set onreceive(DataReceived v);
  external TransportClosed get onclose;
  external set onclose(TransportClosed v);
}

@JS("signalR.LongPollingTransport")
class LongPollingTransport implements ITransport {
  // @Ignore
  LongPollingTransport.fakeConstructor$();
  external get httpClient;
  external set httpClient(v);
  external get accessTokenFactory;
  external set accessTokenFactory(v);
  external get logger;
  external set logger(v);
  external get url;
  external set url(v);
  external get pollXhr;
  external set pollXhr(v);
  external get pollAbort;
  external set pollAbort(v);
  external factory LongPollingTransport(
      HttpClient httpClient, String accessTokenFactory(), ILogger logger);
  external Future<Null> connect(String url,
      num /*enum TransferFormat*/ transferFormat, IConnection connection);
  external poll(url, transferFormat);
  external Future<Null> send(dynamic data);
  external Future<Null> stop();
  external DataReceived get onreceive;
  external set onreceive(DataReceived v);
  external TransportClosed get onclose;
  external set onclose(TransportClosed v);
}
