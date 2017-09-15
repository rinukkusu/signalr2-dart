@JS()
library MessagePackHubProtocol;

import "package:js/js.dart";
import "IHubProtocol.dart" show IHubProtocol, HubMessage;
import "dart:typed_data" show ByteBuffer;

@JS()
class MessagePackHubProtocol implements IHubProtocol {
  // @Ignore
  MessagePackHubProtocol.fakeConstructor$();
  external String get name;
  external set name(String v);
  external num /*enum ProtocolType*/ get type;
  external set type(num /*enum ProtocolType*/ v);
  external List<HubMessage> parseMessages(ByteBuffer input);
  external parseMessage(input);
  external createInvocationMessage(properties);
  external createStreamItemMessage(properties);
  external createCompletionMessage(properties);
  external ByteBuffer writeMessage(HubMessage message);
  external writeInvocation(invocationMessage);
}
