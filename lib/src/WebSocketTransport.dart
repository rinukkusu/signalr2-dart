@JS()
library WebSocketTransport;

import 'dart:async';
import "package:js/js.dart";
import "ITransport.dart" show ITransport;
import "ILogger.dart" show ILogger;
import "package:func/func.dart";
import "dart:typed_data" show ByteBuffer;

@JS()
class WebSocketTransport implements ITransport {
  // @Ignore
  WebSocketTransport.fakeConstructor$();
  external get logger;
  external set logger(v);
  external get accessTokenFactory;
  external set accessTokenFactory(v);
  external get logMessageContent;
  external set logMessageContent(v);
  external get webSocket;
  external set webSocket(v);
  external factory WebSocketTransport(
      dynamic /*String|Promise<String>*/ accessTokenFactory(),
      ILogger logger,
      bool logMessageContent);
  external Future<Null> connect(
      String url, num /*enum TransferFormat*/ transferFormat);
  external Future<Null> send(dynamic data);
  external Future<Null> stop();
  external VoidFunc1<dynamic /*String|ByteBuffer*/ > get onreceive;
  external set onreceive(VoidFunc1<dynamic /*String|ByteBuffer*/ > v);
  external VoidFunc1Opt1<Error> get onclose;
  external set onclose(VoidFunc1Opt1<Error> v);
}
