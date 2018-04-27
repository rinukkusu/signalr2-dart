@JS()
library IConnection;

import 'dart:async';
import "package:js/js.dart";
import "Common.dart" show DataReceived, ConnectionClosed;

@anonymous
@JS("signalR.IConnection")
abstract class IConnection {
  external dynamic get features;
  external set features(dynamic v);
  external Future<Null> start(num /*enum TransferFormat*/ transferFormat);
  external Future<Null> send(dynamic data);
  external Future<Null> stop([Error error]);
  external DataReceived get onreceive;
  external set onreceive(DataReceived v);
  external ConnectionClosed get onclose;
  external set onclose(ConnectionClosed v);
}
