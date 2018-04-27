@JS()
library Utils;

import "package:js/js.dart";

@JS("signalR.Arg")
class Arg {
  // @Ignore
  Arg.fakeConstructor$();
  external static void isRequired(dynamic val, String name);
  external static void isIn(dynamic val, dynamic values, String name);
}
