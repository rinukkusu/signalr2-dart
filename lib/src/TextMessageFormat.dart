@JS()
library TextMessageFormat;

import "package:js/js.dart";

/// Copyright (c) .NET Foundation. All rights reserved.
/// Licensed under the Apache License, Version 2.0. See License.txt in the project root for license information.

/// Not exported from index
@JS("signalR.TextMessageFormat")
class TextMessageFormat {
  // @Ignore
  TextMessageFormat.fakeConstructor$();
  external static get RecordSeparatorCode;
  external static set RecordSeparatorCode(v);
  external static get RecordSeparator;
  external static set RecordSeparator(v);
  external static String write(String output);
  external static List<String> parse(String input);
}
