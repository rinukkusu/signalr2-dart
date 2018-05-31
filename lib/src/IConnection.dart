@JS()
library IConnection;

import 'dart:async';
import "package:js/js.dart";
import "dart:typed_data" show ByteBuffer;
import "package:func/func.dart";

@anonymous
@JS()
abstract class IConnection {
  external dynamic get features;
  external set features(dynamic v);
  external Future<Null> start(num /*enum TransferFormat*/ transferFormat);
  external Future<Null> send(dynamic /*String|ByteBuffer*/ data);
  external Future<Null> stop([Error error]);
  external VoidFunc1<dynamic /*String|ByteBuffer*/ > get onreceive;
  external set onreceive(VoidFunc1<dynamic /*String|ByteBuffer*/ > v);
  external VoidFunc1Opt1<Error> get onclose;
  external set onclose(VoidFunc1Opt1<Error> v);
}
