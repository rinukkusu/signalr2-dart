@JS()
library Stream;

import "package:js/js.dart";

/// Copyright (c) .NET Foundation. All rights reserved.
/// Licensed under the Apache License, Version 2.0. See License.txt in the project root for license information.

/// This is an API that is similar to Observable, but we don't want users to confuse it for that so we rename things. Someone could
/// easily adapt it into the Rx interface if they wanted to. Unlike in C#, we can't just implement an "interface" and get extension
/// methods for free. The methods have to actually be added to the object (there are no extension methods in JS!). We don't want to
/// depend on RxJS in the core library, so instead we duplicate the minimum logic needed and then users can easily adapt these into
/// proper RxJS observables if they want.

/// Defines the expected type for a receiver of results streamed by the server.
/// @typeparam T The type of the items being sent by the server.
@anonymous
@JS("signalR.IStreamSubscriber")
abstract class IStreamSubscriber<T> {
  /// A boolean that will be set by the [IStreamResult] when the stream is closed.
  external bool get closed;
  external set closed(bool v);

  /// Called by the framework when a new item is available.
  external void next(T value);

  /// Called by the framework when an error has occurred.
  /// After this method is called, no additional methods on the [IStreamSubscriber] will be called.
  external void error(dynamic err);

  /// Called by the framework when the end of the stream is reached.
  /// After this method is called, no additional methods on the [IStreamSubscriber] will be called.
  external void complete();
}

/// Defines the result of a streaming hub method.
/// @typeparam T The type of the items being sent by the server.
@anonymous
@JS("signalR.IStreamResult")
abstract class IStreamResult<T> {
  /// Attaches a [IStreamSubscriber], which will be invoked when new items are available from the stream.
  external ISubscription<T> subscribe(IStreamSubscriber<T> subscriber);
}

/// An interface that allows an [IStreamSubscriber] to be disconnected from a stream.
/// @typeparam T The type of the items being sent by the server.
@anonymous
@JS("signalR.ISubscription")
abstract class ISubscription<T> {
  /// Disconnects the [IStreamSubscriber] associated with this subscription from the stream.
  external void dispose();
}
