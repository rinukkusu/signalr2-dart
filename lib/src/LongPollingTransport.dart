@JS()
library LongPollingTransport;

import 'dart:async';
import "package:js/js.dart";
import "ITransport.dart" show ITransport;
import "HttpClient.dart" show HttpClient;
import "ILogger.dart" show ILogger;
import "package:func/func.dart";

@JS()
class LongPollingTransport implements ITransport {
  // @Ignore
  LongPollingTransport.fakeConstructor$();
  external get httpClient;
  external set httpClient(v);
  external get accessTokenFactory;
  external set accessTokenFactory(v);
  external get logger;
  external set logger(v);
  external get logMessageContent;
  external set logMessageContent(v);
  external get url;
  external set url(v);
  external get pollXhr;
  external set pollXhr(v);
  external get pollAbort;
  external set pollAbort(v);
  external get shutdownTimer;
  external set shutdownTimer(v);
  external get shutdownTimeout;
  external set shutdownTimeout(v);
  external get running;
  external set running(v);
  external get stopped;
  external set stopped(v);
  external bool get pollAborted;
  external set pollAborted(bool v);
  external factory LongPollingTransport(
      HttpClient httpClient,
      dynamic /*String|Promise<String>*/ accessTokenFactory(),
      ILogger logger,
      bool logMessageContent,
      [num shutdownTimeout]);
  external Future<Null> connect(
      String url, num /*enum TransferFormat*/ transferFormat);
  external updateHeaderToken(request, token);
  external poll(url, pollOptions, closeError);
  external Future<Null> send(dynamic data);
  external Future<Null> stop();
  external VoidFunc1<dynamic /*String|ByteBuffer*/ > get onreceive;
  external set onreceive(VoidFunc1<dynamic /*String|ByteBuffer*/ > v);
  external VoidFunc1Opt1<Error> get onclose;
  external set onclose(VoidFunc1Opt1<Error> v);
}
