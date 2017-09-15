@JS()
library Formatters;

import "package:js/js.dart";
import "dart:typed_data" show ByteBuffer, Uint8List;

// Module TextMessageFormat
@JS("TextMessageFormat.write")
external String write(String output);
@JS("TextMessageFormat.parse")
external List<String> parse(String input);
// End module TextMessageFormat

// Module BinaryMessageFormat
@JS("BinaryMessageFormat.write")
external ByteBuffer BinaryMessageFormat_write(Uint8List output);
@JS("BinaryMessageFormat.parse")
external List<Uint8List> BinaryMessageFormat_parse(ByteBuffer input);
// End module BinaryMessageFormat
