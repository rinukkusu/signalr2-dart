@JS()
library HttpConnection;

import 'dart:async';
import "package:js/js.dart";
import "IConnection.dart" show IConnection;
import "HttpClient.dart" show HttpClient;
import "ILogger.dart" show ILogger;
import "IHttpConnectionOptions.dart" show IHttpConnectionOptions;
import "ITransport.dart" show ITransport;
import "package:func/func.dart";
import "dart:typed_data" show ByteBuffer;

/// Copyright (c) .NET Foundation. All rights reserved.
/// Licensed under the Apache License, Version 2.0. See License.txt in the project root for license information.
@JS("signalR.ConnectionState")
class ConnectionState {
  external static num get Connecting;
  external static num get Connected;
  external static num get Disconnected;
}

@anonymous
@JS("signalR.INegotiateResponse")
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
@JS("signalR.IAvailableTransport")
abstract class IAvailableTransport {
  external get transport;
  external set transport(v);
  external factory IAvailableTransport({transport});
}

@JS("signalR.MAX_REDIRECTS")
external get MAX_REDIRECTS;

@JS("signalR.HttpConnection")
class HttpConnection implements IConnection {
  // @Ignore
  HttpConnection.fakeConstructor$();
  external num /*enum ConnectionState*/ get connectionState;
  external set connectionState(num /*enum ConnectionState*/ v);
  external String get baseUrl;
  external set baseUrl(String v);
  external HttpClient get httpClient;
  external set httpClient(HttpClient v);
  external ILogger get logger;
  external set logger(ILogger v);
  external IHttpConnectionOptions get options;
  external set options(IHttpConnectionOptions v);
  external ITransport get transport;
  external set transport(ITransport v);
  external Future<Null> get startPromise;
  external set startPromise(Future<Null> v);
  external Error get stopError;
  external set stopError(Error v);
  external Func0<dynamic /*String|Promise<String>*/ > get accessTokenFactory;
  external set accessTokenFactory(Func0<dynamic /*String|Promise<String>*/ > v);
  external dynamic get features;
  external set features(dynamic v);
  external VoidFunc1<dynamic /*String|ByteBuffer*/ > get onreceive;
  external set onreceive(VoidFunc1<dynamic /*String|ByteBuffer*/ > v);
  external VoidFunc1Opt1<Error> get onclose;
  external set onclose(VoidFunc1Opt1<Error> v);
  external factory HttpConnection(String url, [IHttpConnectionOptions options]);
  /*external Promise<Null> start();*/
  /*external Promise<Null> start(enum TransferFormat transferFormat);*/
  /*external Promise<Null> start([enum TransferFormat transferFormat]);*/
  external Future<Null> start([num /*enum TransferFormat*/ transferFormat]);
  external Future<Null> send(dynamic /*String|ByteBuffer*/ data);
  external Future<Null> stop([Error error]);
  external Future<Null> startInternal(
      num /*enum TransferFormat*/ transferFormat);
  external Future<INegotiateResponse> getNegotiationResponse(String url);
  external createConnectUrl(String url, String connectionId);
  external Future<Null> createTransport(
      String url,
      dynamic /*enum HttpTransportType|ITransport*/ requestedTransport,
      INegotiateResponse negotiateResponse,
      num /*enum TransferFormat*/ requestedTransferFormat);
  external constructTransport(num /*enum HttpTransportType*/ transport);
  external num /*enum HttpTransportType|Null*/ resolveTransport(
      IAvailableTransport endpoint,
      num /*enum HttpTransportType*/ requestedTransport,
      num /*enum TransferFormat*/ requestedTransferFormat);
  external bool /*transport is ITransport*/ isITransport(dynamic transport);
  external bool changeState(
      num /*enum ConnectionState*/ from, num /*enum ConnectionState*/ to);
  external Future<Null> stopConnection([Error error]);
  external String resolveUrl(String url);
  external String resolveNegotiateUrl(String url);
}

@JS()
external transportMatches(num /*enum HttpTransportType*/ requestedTransport,
    num /*enum HttpTransportType*/ actualTransport);
