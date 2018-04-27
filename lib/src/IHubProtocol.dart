@JS()
library IHubProtocol;

import "package:js/js.dart";
import "ILogger.dart" show ILogger;

@JS("signalR.MessageType")
class MessageType {
  external static num get Invocation;
  external static num get StreamItem;
  external static num get Completion;
  external static num get StreamInvocation;
  external static num get CancelInvocation;
  external static num get Ping;
  external static num get Close;
}

@anonymous
@JS("signalR.MessageHeaders")
abstract class MessageHeaders {
  /* Index signature is not yet supported by JavaScript interop. */
}

/*export declare type HubMessage = InvocationMessage | StreamInvocationMessage | StreamItemMessage | CompletionMessage | CancelInvocationMessage | PingMessage | CloseMessage;*/
@anonymous
@JS("signalR.HubMessageBase")
abstract class HubMessageBase {
  external num /*enum MessageType*/ get type;
  external set type(num /*enum MessageType*/ v);
  external factory HubMessageBase({num /*enum MessageType*/ type});
}

@anonymous
@JS("signalR.HubInvocationMessage")
abstract class HubInvocationMessage implements HubMessageBase {
  external MessageHeaders get headers;
  external set headers(MessageHeaders v);
  external String get invocationId;
  external set invocationId(String v);
  external factory HubInvocationMessage(
      {MessageHeaders headers,
      String invocationId,
      num /*enum MessageType*/ type});
}

@anonymous
@JS("signalR.InvocationMessage")
abstract class InvocationMessage implements HubInvocationMessage {
  external num get type;
  external set type(num v);
  external String get target;
  external set target(String v);
  external List<dynamic> get arguments;
  external set arguments(List<dynamic> v);
  external factory InvocationMessage(
      {num type,
      String target,
      List<dynamic> arguments,
      MessageHeaders headers,
      String invocationId});
}

@anonymous
@JS("signalR.StreamInvocationMessage")
abstract class StreamInvocationMessage implements HubInvocationMessage {
  external num get type;
  external set type(num v);
  external String get target;
  external set target(String v);
  external List<dynamic> get arguments;
  external set arguments(List<dynamic> v);
  external factory StreamInvocationMessage(
      {num type,
      String target,
      List<dynamic> arguments,
      MessageHeaders headers,
      String invocationId});
}

@anonymous
@JS("signalR.StreamItemMessage")
abstract class StreamItemMessage implements HubInvocationMessage {
  external num get type;
  external set type(num v);
  external dynamic get item;
  external set item(dynamic v);
  external factory StreamItemMessage(
      {num type,
      dynamic item,
      MessageHeaders headers,
      String invocationId});
}

@anonymous
@JS("signalR.CompletionMessage")
abstract class CompletionMessage implements HubInvocationMessage {
  external num get type;
  external set type(num v);
  external String get error;
  external set error(String v);
  external dynamic get result;
  external set result(dynamic v);
  external factory CompletionMessage(
      {num type,
      String error,
      dynamic result,
      MessageHeaders headers,
      String invocationId});
}

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

@anonymous
@JS("signalR.PingMessage")
abstract class PingMessage implements HubMessageBase {
  external num get type;
  external set type(num v);
  external factory PingMessage({num type});
}

@anonymous
@JS("signalR.CloseMessage")
abstract class CloseMessage implements HubMessageBase {
  external num get type;
  external set type(num v);
  external String get error;
  external set error(String v);
  external factory CloseMessage({num type, String error});
}

@anonymous
@JS("signalR.CancelInvocationMessage")
abstract class CancelInvocationMessage implements HubInvocationMessage {
  external num get type;
  external set type(num v);
  external factory CancelInvocationMessage(
      {num type,
      MessageHeaders headers,
      String invocationId});
}

@anonymous
@JS("signalR.IHubProtocol")
abstract class IHubProtocol {
  external String get name;
  external set name(String v);
  external num get version;
  external set version(num v);
  external num /*enum TransferFormat*/ get transferFormat;
  external set transferFormat(num /*enum TransferFormat*/ v);
  external List<
          dynamic /*InvocationMessage|StreamInvocationMessage|StreamItemMessage|CompletionMessage|CancelInvocationMessage|PingMessage|CloseMessage*/ >
      parseMessages(dynamic input, ILogger logger);
  external dynamic writeMessage(
      dynamic /*InvocationMessage|StreamInvocationMessage|StreamItemMessage|CompletionMessage|CancelInvocationMessage|PingMessage|CloseMessage*/ message);
}
