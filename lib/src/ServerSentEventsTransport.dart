@JS()
library ServerSentEventsTransport;

import 'dart:async';
import "package:js/js.dart";
import "ITransport.dart" show ITransport;
import "HttpClient.dart" show HttpClient;
import "package:func/func.dart";
import "ILogger.dart" show ILogger;
import "dart:typed_data" show ByteBuffer;

/// Copyright (c) .NET Foundation. All rights reserved.
/// Licensed under the Apache License, Version 2.0. See License.txt in the project root for license information.
@JS("signalR.ServerSentEventsTransport")
class ServerSentEventsTransport implements ITransport {
  // @Ignore
  ServerSentEventsTransport.fakeConstructor$();
  external HttpClient get httpClient;
  external set httpClient(HttpClient v);
  external Func0<dynamic /*String|Promise<String>*/ > get accessTokenFactory;
  external set accessTokenFactory(Func0<dynamic /*String|Promise<String>*/ > v);
  external ILogger get logger;
  external set logger(ILogger v);
  external bool get logMessageContent;
  external set logMessageContent(bool v);
  external get eventSource;
  external set eventSource(v);
  external String get url;
  external set url(String v);
  external factory ServerSentEventsTransport(
      HttpClient httpClient,
      dynamic /*String|Promise<String>*/ accessTokenFactory(),
      ILogger logger,
      bool logMessageContent);
  external Future<Null> connect(
      String url, num /*enum TransferFormat*/ transferFormat);
  external Future<Null> send(dynamic data);
  external Future<Null> stop();
  external close([Error e]);
  external VoidFunc1<dynamic /*String|ByteBuffer*/ > get onreceive;
  external set onreceive(VoidFunc1<dynamic /*String|ByteBuffer*/ > v);
  external VoidFunc1Opt1<Error> get onclose;
  external set onclose(VoidFunc1Opt1<Error> v);
}
