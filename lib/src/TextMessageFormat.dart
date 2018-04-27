@JS()
library TextMessageFormat;

import "package:js/js.dart";

@JS("signalR.TextMessageFormat")
class TextMessageFormat {
  // @Ignore
  TextMessageFormat.fakeConstructor$();
  external static num get RecordSeparatorCode;
  external static set RecordSeparatorCode(num v);
  external static String get RecordSeparator;
  external static set RecordSeparator(String v);
  external static String write(String output);
  external static List<String> parse(String input);
}
