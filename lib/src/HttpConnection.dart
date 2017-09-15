@JS()
library HttpConnection;

import 'dart:async';
import "package:js/js.dart";
import "IConnection.dart" show IConnection;
import "IHttpConnectionOptions.dart" show IHttpConnectionOptions;
import "Common.dart" show DataReceived, ConnectionClosed;

@JS()
class HttpConnection implements IConnection {
  // @Ignore
  HttpConnection.fakeConstructor$();
  external get connectionState;
  external set connectionState(v);
  external get url;
  external set url(v);
  external get httpClient;
  external set httpClient(v);
  external get logger;
  external set logger(v);
  external get options;
  external set options(v);
  external get transport;
  external set transport(v);
  external get connectionId;
  external set connectionId(v);
  external get startPromise;
  external set startPromise(v);
  external dynamic get features;
  external set features(dynamic v);
  external factory HttpConnection(String url, [IHttpConnectionOptions options]);
  external Future<Null> start();
  external startInternal();
  external createTransport(transport, availableTransports);
  external isITransport(transport);
  external changeState(from, to);
  external Future<Null> send(dynamic data);
  external Future<Null> stop();
  external stopConnection(raiseClosed, [error]);
  external resolveUrl(url);
  external DataReceived get onDataReceived;
  external set onDataReceived(DataReceived v);
  external ConnectionClosed get onClosed;
  external set onClosed(ConnectionClosed v);
}
