@JS("signalR")
library JsonHubProtocol;

import "package:js/js.dart";
import "IHubProtocol.dart" show IHubProtocol;
import "ILogger.dart" show ILogger;

/// Implements the JSON Hub Protocol.
@JS()
class JsonHubProtocol implements IHubProtocol {
  // @Ignore
  JsonHubProtocol.fakeConstructor$();

  /// @inheritDoc
  external String get name;
  external set name(String v);

  /// @inheritDoc
  external num get version;
  external set version(num v);

  /// @inheritDoc
  external num /*enum TransferFormat*/ get transferFormat;
  external set transferFormat(num /*enum TransferFormat*/ v);

  /// Creates an array of [HubMessage] objects from the specified serialized representation.
  external List<
          dynamic /*InvocationMessage|StreamInvocationMessage|StreamItemMessage|CompletionMessage|CancelInvocationMessage|PingMessage|CloseMessage*/ >
      parseMessages(dynamic input, ILogger logger);

  /// Writes the specified [HubMessage] to a string and returns it.
  external String writeMessage(
      dynamic /*InvocationMessage|StreamInvocationMessage|StreamItemMessage|CompletionMessage|CancelInvocationMessage|PingMessage|CloseMessage*/ message);
  external isInvocationMessage(message);
  external isStreamItemMessage(message);
  external isCompletionMessage(message);
  external assertNotEmptyString(value, errorMessage);
}
