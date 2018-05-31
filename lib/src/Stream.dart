@JS("signalR")
library Stream;

import "package:js/js.dart";

/// Defines the expected type for a receiver of results streamed by the server.
/// @typeparam T The type of the items being sent by the server.
@anonymous
@JS()
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
@JS()
abstract class IStreamResult<T> {
  /// Attaches a [IStreamSubscriber], which will be invoked when new items are available from the stream.
  external ISubscription<T> subscribe(IStreamSubscriber<T> subscriber);
}

/// An interface that allows an [IStreamSubscriber] to be disconnected from a stream.
/// @typeparam T The type of the items being sent by the server.
@anonymous
@JS()
abstract class ISubscription<T> {
  /// Disconnects the [IStreamSubscriber] associated with this subscription from the stream.
  external void dispose();
}
