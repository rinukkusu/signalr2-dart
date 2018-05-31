@JS()
library HandshakeProtocol;

import "package:js/js.dart";

/// Copyright (c) .NET Foundation. All rights reserved.
/// Licensed under the Apache License, Version 2.0. See License.txt in the project root for license information.
@anonymous
@JS("signalR.HandshakeRequestMessage")
abstract class HandshakeRequestMessage {
  external String get protocol;
  external set protocol(String v);
  external num get version;
  external set version(num v);
  external factory HandshakeRequestMessage({String protocol, num version});
}

@anonymous
@JS("signalR.HandshakeResponseMessage")
abstract class HandshakeResponseMessage {
  external String get error;
  external set error(String v);
  external factory HandshakeResponseMessage({String error});
}

@JS("signalR.HandshakeProtocol")
class HandshakeProtocol {
  // @Ignore
  HandshakeProtocol.fakeConstructor$();

  /// Handshake request is always JSON
  external String writeHandshakeRequest(
      HandshakeRequestMessage handshakeRequest);
  external List<dynamic /*dynamic|HandshakeResponseMessage*/ > /*Tuple of <dynamic,HandshakeResponseMessage>*/ parseHandshakeResponse(
      dynamic data);
}
