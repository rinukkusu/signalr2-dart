@JS()
library AbortController;

import "package:js/js.dart";
import "package:func/func.dart";

/// Copyright (c) .NET Foundation. All rights reserved.
/// Licensed under the Apache License, Version 2.0. See License.txt in the project root for license information.

/// Rough polyfill of https://developer.mozilla.org/en-US/docs/Web/API/AbortController
/// We don't actually ever use the API being polyfilled, we always use the polyfill because
/// it's a very new API right now.

/// Not exported from index.
@JS("signalR.AbortController")
class AbortController implements AbortSignal {
  // @Ignore
  AbortController.fakeConstructor$();
  external bool get isAborted;
  external set isAborted(bool v);
  external VoidFunc0 get onabort;
  external set onabort(VoidFunc0 v);
  external abort();
  external AbortSignal get signal;
  external bool get aborted;
  external set aborted(bool v);
}

/// Represents a signal that can be monitored to determine if a request has been aborted.
@anonymous
@JS("signalR.AbortSignal")
abstract class AbortSignal {
  /// Indicates if the request has been aborted.
  external bool get aborted;
  external set aborted(bool v);

  /// Set this to a handler that will be invoked when the request is aborted.
  external VoidFunc0 get onabort;
  external set onabort(VoidFunc0 v);
  external factory AbortSignal({bool aborted, VoidFunc0 onabort});
}
