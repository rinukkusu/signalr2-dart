@JS()
library JsonHubProtocol;

import "package:js/js.dart";
import "IHubProtocol.dart" show IHubProtocol;
import "ILogger.dart" show ILogger;

@JS("signalR.JSON_HUB_PROTOCOL_NAME")
external String get JSON_HUB_PROTOCOL_NAME;

@JS("signalR.JsonHubProtocol")
class JsonHubProtocol implements IHubProtocol {
  // @Ignore
  JsonHubProtocol.fakeConstructor$();
  external String get name;
  external set name(String v);
  external num get version;
  external set version(num v);
  external num /*enum TransferFormat*/ get transferFormat;
  external set transferFormat(num /*enum TransferFormat*/ v);
  external List<
          dynamic /*InvocationMessage|StreamInvocationMessage|StreamItemMessage|CompletionMessage|CancelInvocationMessage|PingMessage|CloseMessage*/ >
      parseMessages(dynamic input, ILogger logger);
  external String writeMessage(
      dynamic /*InvocationMessage|StreamInvocationMessage|StreamItemMessage|CompletionMessage|CancelInvocationMessage|PingMessage|CloseMessage*/ message);
  external isInvocationMessage(message);
  external isStreamItemMessage(message);
  external isCompletionMessage(message);
  external assertNotEmptyString(value, errorMessage);
}
