@JS()
library IConnection;

import 'dart:async';
import "package:js/js.dart";
import "Common.dart" show DataReceived, ConnectionClosed;

@anonymous
@JS()
abstract class IConnection {
  external dynamic get features;
  external set features(dynamic v);
  external Future<Null> start();
  external Future<Null> send(dynamic data);
  external void stop();
  external DataReceived get onDataReceived;
  external set onDataReceived(DataReceived v);
  external ConnectionClosed get onClosed;
  external set onClosed(ConnectionClosed v);
}
