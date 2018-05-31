@JS("signalR")
library IHubProtocol;

import "package:js/js.dart";
import "dart:typed_data" show ByteBuffer;
import "ILogger.dart" show ILogger;

/// Defines the type of a Hub Message.
@JS()
class MessageType {
  external static num get

      /// Indicates the message is an Invocation message and implements the [InvocationMessage] interface.
      Invocation;
  external static num get

      /// Indicates the message is a StreamItem message and implements the [StreamItemMessage] interface.
      StreamItem;
  external static num get

      /// Indicates the message is a Completion message and implements the [CompletionMessage] interface.
      Completion;
  external static num get

      /// Indicates the message is a Stream Invocation message and implements the [StreamInvocationMessage] interface.
      StreamInvocation;
  external static num get

      /// Indicates the message is a Cancel Invocation message and implements the [CancelInvocationMessage] interface.
      CancelInvocation;
  external static num get

      /// Indicates the message is a Ping message and implements the [PingMessage] interface.
      Ping;
  external static num get

      /// Indicates the message is a Close message and implements the [CloseMessage] interface.
      Close;
}

/// Defines a dictionary of string keys and string values representing headers attached to a Hub message.
@anonymous
@JS()
abstract class MessageHeaders {
  /// Gets or sets the header with the specified key.
  /* Index signature is not yet supported by JavaScript interop. */
}

/// Union type of all known Hub messages.
/*export declare type HubMessage = InvocationMessage | StreamInvocationMessage | StreamItemMessage | CompletionMessage | CancelInvocationMessage | PingMessage | CloseMessage;*/
/// Defines properties common to all Hub messages.
@anonymous
@JS()
abstract class HubMessageBase {
  /// A [MessageType] value indicating the type of this message.
  external num /*enum MessageType*/ get type;
  external set type(num /*enum MessageType*/ v);
  external factory HubMessageBase({num /*enum MessageType*/ type});
}

/// Defines properties common to all Hub messages relating to a specific invocation.
@anonymous
@JS()
abstract class HubInvocationMessage implements HubMessageBase {
  /// A [MessageHeaders] dictionary containing headers attached to the message.
  external MessageHeaders get headers;
  external set headers(MessageHeaders v);

  /// The ID of the invocation relating to this message.
  /// This is expected to be present for [StreamInvocationMessage] and [CompletionMessage]. It may
  /// be 'undefined' for an [InvocationMessage] if the sender does not expect a response.
  external String get invocationId;
  external set invocationId(String v);
  external factory HubInvocationMessage(
      {MessageHeaders headers,
      String invocationId,
      num /*enum MessageType*/ type});
}

/// A hub message representing a non-streaming invocation.
@anonymous
@JS()
abstract class InvocationMessage implements HubInvocationMessage {
  external get type;
  external set type(v);

  /// The target method name.
  external String get target;
  external set target(String v);

  /// The target method arguments.
  external List<dynamic> get arguments;
  external set arguments(List<dynamic> v);
  external factory InvocationMessage(
      {type,
      String target,
      List<dynamic> arguments,
      MessageHeaders headers,
      String invocationId});
}

/// A hub message representing a streaming invocation.
@anonymous
@JS()
abstract class StreamInvocationMessage implements HubInvocationMessage {
  /// @inheritDoc
  external get type;
  external set type(v);

  /// The invocation ID.
  external String get invocationId;
  external set invocationId(String v);

  /// The target method name.
  external String get target;
  external set target(String v);

  /// The target method arguments.
  external List<dynamic> get arguments;
  external set arguments(List<dynamic> v);
  external factory StreamInvocationMessage(
      {type,
      String invocationId,
      String target,
      List<dynamic> arguments,
      MessageHeaders headers});
}

/// A hub message representing a single item produced as part of a result stream.
@anonymous
@JS()
abstract class StreamItemMessage implements HubInvocationMessage {
  /// @inheritDoc
  external get type;
  external set type(v);

  /// The invocation ID.
  external String get invocationId;
  external set invocationId(String v);

  /// The item produced by the server.
  external dynamic get item;
  external set item(dynamic v);
  external factory StreamItemMessage(
      {type,
      String invocationId,
      dynamic item,
      MessageHeaders headers});
}

/// A hub message representing the result of an invocation.
@anonymous
@JS()
abstract class CompletionMessage implements HubInvocationMessage {
  /// @inheritDoc
  external get type;
  external set type(v);

  /// The invocation ID.
  external String get invocationId;
  external set invocationId(String v);

  /// The error produced by the invocation, if any.
  /// Either [error] or [result] must be defined, but not both.
  external String get error;
  external set error(String v);

  /// The result produced by the invocation, if any.
  /// Either [error] or [result] must be defined, but not both.
  external dynamic get result;
  external set result(dynamic v);
  external factory CompletionMessage(
      {type,
      String invocationId,
      String error,
      dynamic result,
      MessageHeaders headers});
}

/// A hub message indicating that the sender is still active.
@anonymous
@JS()
abstract class PingMessage implements HubMessageBase {
  /// @inheritDoc
  external get type;
  external set type(v);
  external factory PingMessage({type});
}

/// A hub message indicating that the sender is closing the connection.
/// If [error] is defined, the sender is closing the connection due to an error.
@anonymous
@JS()
abstract class CloseMessage implements HubMessageBase {
  /// @inheritDoc
  external get type;
  external set type(v);

  /// The error that triggered the close, if any.
  /// If this property is undefined, the connection was closed normally and without error.
  external String get error;
  external set error(String v);
  external factory CloseMessage({type, String error});
}

/// A hub message sent to request that a streaming invocation be canceled.
@anonymous
@JS()
abstract class CancelInvocationMessage implements HubInvocationMessage {
  /// @inheritDoc
  external get type;
  external set type(v);

  /// The invocation ID.
  external String get invocationId;
  external set invocationId(String v);
  external factory CancelInvocationMessage(
      {type,
      String invocationId,
      MessageHeaders headers});
}

/// A protocol abstraction for communicating with SignalR Hubs.
@anonymous
@JS()
abstract class IHubProtocol {
  /// The name of the protocol. This is used by SignalR to resolve the protocol between the client and server.
  external String get name;
  external set name(String v);

  /// The version of the protocol.
  external num get version;
  external set version(num v);

  /// The [TransferFormat] of the protocol.
  external num /*enum TransferFormat*/ get transferFormat;
  external set transferFormat(num /*enum TransferFormat*/ v);

  /// Creates an array of [HubMessage] objects from the specified serialized representation.
  /// If [transferFormat] is 'Text', the [input] parameter must be a string, otherwise it must be an ArrayBuffer.
  external List<
          dynamic /*InvocationMessage|StreamInvocationMessage|StreamItemMessage|CompletionMessage|CancelInvocationMessage|PingMessage|CloseMessage*/ >
      parseMessages(dynamic /*String|ByteBuffer*/ input, ILogger logger);

  /// Writes the specified [HubMessage] to a string or ArrayBuffer and returns it.
  /// If [transferFormat] is 'Text', the result of this method will be a string, otherwise it will be an ArrayBuffer.
  external dynamic /*String|ByteBuffer*/ writeMessage(
      dynamic /*InvocationMessage|StreamInvocationMessage|StreamItemMessage|CompletionMessage|CancelInvocationMessage|PingMessage|CloseMessage*/ message);
}
