@JS()
library JsonHubProtocol;

import "package:js/js.dart";
import "IHubProtocol.dart"
    show IHubProtocol, InvocationMessage, StreamItemMessage, CompletionMessage;
import "ILogger.dart" show ILogger;

/// Copyright (c) .NET Foundation. All rights reserved.
/// Licensed under the Apache License, Version 2.0. See License.txt in the project root for license information.
@JS("signalR.JSON_HUB_PROTOCOL_NAME")
external String get JSON_HUB_PROTOCOL_NAME;

/// Implements the JSON Hub Protocol.
@JS("signalR.JsonHubProtocol")
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
  external void isInvocationMessage(InvocationMessage message);
  external void isStreamItemMessage(StreamItemMessage message);
  external void isCompletionMessage(CompletionMessage message);
  external void assertNotEmptyString(dynamic value, String errorMessage);
}
