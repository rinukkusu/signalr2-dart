@JS()
library HttpConnection;

import 'dart:async';
import "package:js/js.dart";
import "IConnection.dart" show IConnection;
import "package:func/func.dart";
import "IHttpConnectionOptions.dart" show IHttpConnectionOptions;

@anonymous
@JS()
abstract class INegotiateResponse {
  external String get connectionId;
  external set connectionId(String v);
  external List<IAvailableTransport> get availableTransports;
  external set availableTransports(List<IAvailableTransport> v);
  external String get url;
  external set url(String v);
  external String get accessToken;
  external set accessToken(String v);
  external factory INegotiateResponse(
      {String connectionId,
      List<IAvailableTransport> availableTransports,
      String url,
      String accessToken});
}

@anonymous
@JS()
abstract class IAvailableTransport {
  external get transport;
  external set transport(v);
  external factory IAvailableTransport({transport});
}

@JS()
class HttpConnection implements IConnection {
  // @Ignore
  HttpConnection.fakeConstructor$();
  external get connectionState;
  external set connectionState(v);
  external get baseUrl;
  external set baseUrl(v);
  external get httpClient;
  external set httpClient(v);
  external get logger;
  external set logger(v);
  external get options;
  external set options(v);
  external get transport;
  external set transport(v);
  external get startPromise;
  external set startPromise(v);
  external get stopError;
  external set stopError(v);
  external get accessTokenFactory;
  external set accessTokenFactory(v);
  external dynamic get features;
  external set features(dynamic v);
  external VoidFunc1<dynamic /*String|ByteBuffer*/ > get onreceive;
  external set onreceive(VoidFunc1<dynamic /*String|ByteBuffer*/ > v);
  external VoidFunc1Opt1<Error> get onclose;
  external set onclose(VoidFunc1Opt1<Error> v);
  external factory HttpConnection(String url, [IHttpConnectionOptions options]);
  /*external Promise<Null> start();*/
  /*external Promise<Null> start(enum TransferFormat transferFormat);*/
  external Future<Null> start([num /*enum TransferFormat*/ transferFormat]);
  external Future<Null> send(dynamic /*String|ByteBuffer*/ data);
  external Future<Null> stop([Error error]);
  external startInternal(transferFormat);
  external getNegotiationResponse(url);
  external createConnectUrl(url, connectionId);
  external createTransport(
      url, requestedTransport, negotiateResponse, requestedTransferFormat);
  external constructTransport(transport);
  external resolveTransport(
      endpoint, requestedTransport, requestedTransferFormat);
  external isITransport(transport);
  external changeState(from, to);
  external stopConnection([error]);
  external resolveUrl(url);
  external resolveNegotiateUrl(url);
}
