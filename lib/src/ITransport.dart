@JS()
library ITransport;

import 'dart:async';
import "package:js/js.dart";
import "package:func/func.dart";
import "dart:typed_data" show ByteBuffer;

/// Copyright (c) .NET Foundation. All rights reserved.
/// Licensed under the Apache License, Version 2.0. See License.txt in the project root for license information.

/// This will be treated as a bit flag in the future, so we keep it using power-of-two values.
/// Specifies a specific HTTP transport type.
@JS("signalR.HttpTransportType")
class HttpTransportType {
  external static num get

      /// Specifies no transport preference.
      None;
  external static num get

      /// Specifies the WebSockets transport.
      WebSockets;
  external static num get

      /// Specifies the Server-Sent Events transport.
      ServerSentEvents;
  external static num get

      /// Specifies the Long Polling transport.
      LongPolling;
}

/// Specifies the transfer format for a connection.
@JS("signalR.TransferFormat")
class TransferFormat {
  external static num get

      /// Specifies that only text data will be transmitted over the connection.
      Text;
  external static num get

      /// Specifies that binary data will be transmitted over the connection.
      Binary;
}

/// An abstraction over the behavior of transports. This is designed to support the framework and not intended for use by applications.
@anonymous
@JS("signalR.ITransport")
abstract class ITransport {
  external Future<Null> connect(
      String url, num /*enum TransferFormat*/ transferFormat);
  external Future<Null> send(dynamic data);
  external Future<Null> stop();
  external VoidFunc1<dynamic /*String|ByteBuffer*/ > get onreceive;
  external set onreceive(VoidFunc1<dynamic /*String|ByteBuffer*/ > v);
  external VoidFunc1Opt1<Error> get onclose;
  external set onclose(VoidFunc1Opt1<Error> v);
}
