@JS()
library JsonHubProtocol;

import "package:js/js.dart";
import "IHubProtocol.dart" show IHubProtocol, HubMessage;

@JS()
class JsonHubProtocol implements IHubProtocol {
  // @Ignore
  JsonHubProtocol.fakeConstructor$();
  external String get name;
  external set name(String v);
  external num /*enum ProtocolType*/ get type;
  external set type(num /*enum ProtocolType*/ v);
  external List<HubMessage> parseMessages(String input);
  external String writeMessage(HubMessage message);
}
