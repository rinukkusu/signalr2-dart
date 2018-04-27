@JS()
library HttpConnection;

import 'dart:async';
import "package:js/js.dart";
import "HttpClient.dart" show HttpClient;
import "Transports.dart" show ITransport;
import "ILogger.dart" show ILogger;
import "package:func/func.dart";
import "IConnection.dart" show IConnection;
import "Common.dart" show DataReceived, ConnectionClosed;

@anonymous
@JS("signalR.IHttpConnectionOptions")
abstract class IHttpConnectionOptions {
  external HttpClient get httpClient;
  external set httpClient(HttpClient v);
  external dynamic /*enum TransportType|ITransport*/ get transport;
  external set transport(dynamic /*enum TransportType|ITransport*/ v);
  external dynamic /*ILogger|enum LogLevel*/ get logger;
  external set logger(dynamic /*ILogger|enum LogLevel*/ v);
  external Func0<String> get accessTokenFactory;
  external set accessTokenFactory(Func0<String> v);
  external factory IHttpConnectionOptions(
      {HttpClient httpClient,
      dynamic /*enum TransportType|ITransport*/ transport,
      dynamic /*ILogger|enum LogLevel*/ logger,
      Func0<String> accessTokenFactory});
}

@JS("signalR.HttpConnection")
class HttpConnection implements IConnection {
  // @Ignore
  HttpConnection.fakeConstructor$();
  external get connectionState;
  external set connectionState(v);
  external get baseUrl;
  external set baseUrl(v);
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
  external Future<Null> start(num /*enum TransferFormat*/ transferFormat);
  external startInternal(transferFormat);
  external getNegotiationResponse(headers);
  external updateConnectionId(negotiateResponse);
  external createTransport(
      requestedTransport, negotiateResponse, requestedTransferFormat, headers);
  external constructTransport(transport);
  external resolveTransport(
      endpoint, requestedTransport, requestedTransferFormat);
  external isITransport(transport);
  external changeState(from, to);
  external Future<Null> send(dynamic data);
  external Future<Null> stop([Error error]);
  external stopConnection(raiseClosed, [error]);
  external resolveUrl(url);
  external resolveNegotiateUrl(url);
  external DataReceived get onreceive;
  external set onreceive(DataReceived v);
  external ConnectionClosed get onclose;
  external set onclose(ConnectionClosed v);
}
