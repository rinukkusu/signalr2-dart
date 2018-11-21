@JS()
library ServerSentEventsTransport;

import 'dart:async';
import "package:js/js.dart";
import "ITransport.dart" show ITransport;
import "HttpClient.dart" show HttpClient;
import "ILogger.dart" show ILogger;
import "package:func2/func.dart";

@JS()
class ServerSentEventsTransport implements ITransport {
  // @Ignore
  ServerSentEventsTransport.fakeConstructor$();
  external get httpClient;
  external set httpClient(v);
  external get accessTokenFactory;
  external set accessTokenFactory(v);
  external get logger;
  external set logger(v);
  external get logMessageContent;
  external set logMessageContent(v);
  external get eventSource;
  external set eventSource(v);
  external get url;
  external set url(v);
  external factory ServerSentEventsTransport(
      HttpClient httpClient,
      dynamic /*String|Promise<String>*/ accessTokenFactory(),
      ILogger logger,
      bool logMessageContent);
  external Future<Null> connect(
      String url, num /*enum TransferFormat*/ transferFormat);
  external Future<Null> send(dynamic data);
  external Future<Null> stop();
  external close([e]);
  external VoidFunc1<dynamic /*String|ByteBuffer*/ > get onreceive;
  external set onreceive(VoidFunc1<dynamic /*String|ByteBuffer*/ > v);
  external VoidFunc1Opt1<Error> get onclose;
  external set onclose(VoidFunc1Opt1<Error> v);
}
