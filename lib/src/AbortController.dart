@JS("signalR")
library AbortController;

import "package:js/js.dart";
import "package:func/func.dart";

@JS()
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

/// Represents a signal that can be monitored to determine if a request has been aborted.
@anonymous
@JS()
abstract class AbortSignal {
  /// Indicates if the request has been aborted.
  external bool get aborted;
  external set aborted(bool v);

  /// Set this to a handler that will be invoked when the request is aborted.
  external VoidFunc0 get onabort;
  external set onabort(VoidFunc0 v);
  external factory AbortSignal({bool aborted, VoidFunc0 onabort});
}
