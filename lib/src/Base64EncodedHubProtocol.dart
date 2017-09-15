@JS()
library Base64EncodedHubProtocol;

import "package:js/js.dart";
import "IHubProtocol.dart" show IHubProtocol, HubMessage;

@JS()
class Base64EncodedHubProtocol implements IHubProtocol {
  // @Ignore
  Base64EncodedHubProtocol.fakeConstructor$();
  external get wrappedProtocol;
  external set wrappedProtocol(v);
  external factory Base64EncodedHubProtocol(IHubProtocol protocol);
  external String get name;
  external set name(String v);
  external num /*enum ProtocolType*/ get type;
  external set type(num /*enum ProtocolType*/ v);
  external List<HubMessage> parseMessages(dynamic input);
  external dynamic writeMessage(HubMessage message);
}
