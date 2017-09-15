@JS()
library IHubProtocol;

import "package:js/js.dart";

@JS()
class MessageType {
  external static num get Invocation;
  external static num get Result;
  external static num get Completion;
}

@anonymous
@JS()
abstract class HubMessage {
  external num /*enum MessageType*/ get type;
  external set type(num /*enum MessageType*/ v);
  external String get invocationId;
  external set invocationId(String v);
  external factory HubMessage(
      {num /*enum MessageType*/ type, String invocationId});
}

@anonymous
@JS()
abstract class InvocationMessage implements HubMessage {
  external String get target;
  external set target(String v);
  external List<dynamic> get arguments;
  external set arguments(List<dynamic> v);
  external bool get nonblocking;
  external set nonblocking(bool v);
  external factory InvocationMessage(
      {String target,
      List<dynamic> arguments,
      bool nonblocking,
      num /*enum MessageType*/ type,
      String invocationId});
}

@anonymous
@JS()
abstract class ResultMessage implements HubMessage {
  external dynamic get item;
  external set item(dynamic v);
  external factory ResultMessage(
      {dynamic item, num /*enum MessageType*/ type, String invocationId});
}

@anonymous
@JS()
abstract class CompletionMessage implements HubMessage {
  external String get error;
  external set error(String v);
  external dynamic get result;
  external set result(dynamic v);
  external factory CompletionMessage(
      {String error,
      dynamic result,
      num /*enum MessageType*/ type,
      String invocationId});
}

@anonymous
@JS()
abstract class NegotiationMessage {
  external String get protocol;
  external set protocol(String v);
  external factory NegotiationMessage({String protocol});
}

@JS()
class ProtocolType {
  external static num get Text;
  external static num get Binary;
}

@anonymous
@JS()
abstract class IHubProtocol {
  external String get name;
  external set name(String v);
  external num /*enum ProtocolType*/ get type;
  external set type(num /*enum ProtocolType*/ v);
  external List<HubMessage> parseMessages(dynamic input);
  external dynamic writeMessage(HubMessage message);
}
