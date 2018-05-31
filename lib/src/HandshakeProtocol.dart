@JS()
library HandshakeProtocol;

import "package:js/js.dart";

@anonymous
@JS()
abstract class HandshakeRequestMessage {
  external String get protocol;
  external set protocol(String v);
  external num get version;
  external set version(num v);
  external factory HandshakeRequestMessage({String protocol, num version});
}

@anonymous
@JS()
abstract class HandshakeResponseMessage {
  external String get error;
  external set error(String v);
  external factory HandshakeResponseMessage({String error});
}

@JS()
class HandshakeProtocol {
  // @Ignore
  HandshakeProtocol.fakeConstructor$();
  external String writeHandshakeRequest(
      HandshakeRequestMessage handshakeRequest);
  external List<dynamic /*dynamic|HandshakeResponseMessage*/ > /*Tuple of <dynamic,HandshakeResponseMessage>*/ parseHandshakeResponse(
      dynamic data);
}
