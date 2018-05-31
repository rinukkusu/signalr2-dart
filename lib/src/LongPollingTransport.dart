@JS()
library LongPollingTransport;

import 'dart:async';
import "package:js/js.dart";
import "ITransport.dart" show ITransport;
import "HttpClient.dart" show HttpClient, HttpRequest;
import "package:func/func.dart";
import "ILogger.dart" show ILogger;
import "AbortController.dart" show AbortController;
import "dart:typed_data" show ByteBuffer;

/// Copyright (c) .NET Foundation. All rights reserved.
/// Licensed under the Apache License, Version 2.0. See License.txt in the project root for license information.
@JS("signalR.SHUTDOWN_TIMEOUT")
external get SHUTDOWN_TIMEOUT;

/// Not exported from 'index', this type is internal.
@JS("signalR.LongPollingTransport")
class LongPollingTransport implements ITransport {
  // @Ignore
  LongPollingTransport.fakeConstructor$();
  external HttpClient get httpClient;
  external set httpClient(HttpClient v);
  external Func0<dynamic /*String|Promise<String>*/ > get accessTokenFactory;
  external set accessTokenFactory(Func0<dynamic /*String|Promise<String>*/ > v);
  external ILogger get logger;
  external set logger(ILogger v);
  external bool get logMessageContent;
  external set logMessageContent(bool v);
  external String get url;
  external set url(String v);
  external HttpRequest get pollXhr;
  external set pollXhr(HttpRequest v);
  external AbortController get pollAbort;
  external set pollAbort(AbortController v);
  external dynamic get shutdownTimer;
  external set shutdownTimer(dynamic v);
  external num get shutdownTimeout;
  external set shutdownTimeout(num v);
  external bool get running;
  external set running(bool v);
  external bool get stopped;
  external set stopped(bool v);

  /// This is an internal type, not exported from 'index' so this is really just internal.
  external get pollAborted;
  external factory LongPollingTransport(
      HttpClient httpClient,
      dynamic /*String|Promise<String>*/ accessTokenFactory(),
      ILogger logger,
      bool logMessageContent,
      [num shutdownTimeout]);
  external Future<Null> connect(
      String url, num /*enum TransferFormat*/ transferFormat);
  external updateHeaderToken(HttpRequest request, String token);
  external Future<Null> poll(
      String url, HttpRequest pollOptions, Error closeError);
  external Future<Null> send(dynamic data);
  external Future<Null> stop();
  external VoidFunc1<dynamic /*String|ByteBuffer*/ > get onreceive;
  external set onreceive(VoidFunc1<dynamic /*String|ByteBuffer*/ > v);
  external VoidFunc1Opt1<Error> get onclose;
  external set onclose(VoidFunc1Opt1<Error> v);
}
