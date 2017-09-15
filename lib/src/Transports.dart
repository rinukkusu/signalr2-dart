@JS()
library Transports;

import 'dart:async';
import "package:js/js.dart";
import "Common.dart" show DataReceived, TransportClosed;
import "ILogger.dart" show ILogger;
import "HttpClient.dart" show IHttpClient;

@JS()
class TransportType {
  external static num get WebSockets;
  external static num get ServerSentEvents;
  external static num get LongPolling;
}

@JS()
class TransferMode {
  external static num get Text;
  external static num get Binary;
}

@anonymous
@JS()
abstract class ITransport {
  external Future<num /*enum TransferMode*/ > connect(
      String url, num /*enum TransferMode*/ requestedTransferMode);
  external Future<Null> send(dynamic data);
  external void stop();
  external DataReceived get onDataReceived;
  external set onDataReceived(DataReceived v);
  external TransportClosed get onClosed;
  external set onClosed(TransportClosed v);
}

@JS()
class WebSocketTransport implements ITransport {
  // @Ignore
  WebSocketTransport.fakeConstructor$();
  external get logger;
  external set logger(v);
  external get webSocket;
  external set webSocket(v);
  external factory WebSocketTransport(ILogger logger);
  external Future<num /*enum TransferMode*/ > connect(
      String url, num /*enum TransferMode*/ requestedTransferMode);
  external Future<Null> send(dynamic data);
  external void stop();
  external DataReceived get onDataReceived;
  external set onDataReceived(DataReceived v);
  external TransportClosed get onClosed;
  external set onClosed(TransportClosed v);
}

@JS()
class ServerSentEventsTransport implements ITransport {
  // @Ignore
  ServerSentEventsTransport.fakeConstructor$();
  external get httpClient;
  external set httpClient(v);
  external get logger;
  external set logger(v);
  external get eventSource;
  external set eventSource(v);
  external get url;
  external set url(v);
  external factory ServerSentEventsTransport(
      IHttpClient httpClient, ILogger logger);
  external Future<num /*enum TransferMode*/ > connect(
      String url, num /*enum TransferMode*/ requestedTransferMode);
  external Future<Null> send(dynamic data);
  external void stop();
  external DataReceived get onDataReceived;
  external set onDataReceived(DataReceived v);
  external TransportClosed get onClosed;
  external set onClosed(TransportClosed v);
}

@JS()
class LongPollingTransport implements ITransport {
  // @Ignore
  LongPollingTransport.fakeConstructor$();
  external get httpClient;
  external set httpClient(v);
  external get logger;
  external set logger(v);
  external get url;
  external set url(v);
  external get pollXhr;
  external set pollXhr(v);
  external get shouldPoll;
  external set shouldPoll(v);
  external factory LongPollingTransport(IHttpClient httpClient, ILogger logger);
  external Future<num /*enum TransferMode*/ > connect(
      String url, num /*enum TransferMode*/ requestedTransferMode);
  external poll(url, transferMode);
  external Future<Null> send(dynamic data);
  external void stop();
  external DataReceived get onDataReceived;
  external set onDataReceived(DataReceived v);
  external TransportClosed get onClosed;
  external set onClosed(TransportClosed v);
}
