@JS()
library Common;

import "package:js/js.dart";

typedef void DataReceived(dynamic data);
typedef void ConnectionClosed([Error e]);
typedef void TransportClosed([Error e]);
