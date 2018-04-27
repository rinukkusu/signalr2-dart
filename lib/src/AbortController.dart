@JS()
library AbortController;

import "package:js/js.dart";
import "package:func/func.dart";

@JS("signalR.AbortController")
class AbortController implements AbortSignal {
  // @Ignore
  AbortController.fakeConstructor$();
  external get isAborted;
  external set isAborted(v);
  external VoidFunc0 get onabort;
  external set onabort(VoidFunc0 v);
  external void abort();
  external AbortSignal get signal;
  external set signal(AbortSignal v);
  external bool get aborted;
  external set aborted(bool v);
}

@anonymous
@JS("signalR.AbortSignal")
abstract class AbortSignal {
  external bool get aborted;
  external set aborted(bool v);
  external VoidFunc0 get onabort;
  external set onabort(VoidFunc0 v);
  external factory AbortSignal({bool aborted, VoidFunc0 onabort});
}
