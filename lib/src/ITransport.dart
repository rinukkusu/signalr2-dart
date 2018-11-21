@JS("signalR")
library ITransport;

import 'dart:async';
import "package:js/js.dart";
import "package:func/func.dart";

/// Specifies a specific HTTP transport type.
@JS()
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
@JS()
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
@JS()
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
