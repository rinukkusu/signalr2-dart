@JS()
library HubConnection;

import 'dart:async';
import "package:js/js.dart";
import "IConnection.dart" show IConnection;
import "ILogger.dart" show ILogger;
import "IHubProtocol.dart"
    show
        IHubProtocol,
        StreamItemMessage,
        CompletionMessage,
        InvocationMessage,
        StreamInvocationMessage,
        CancelInvocationMessage;
import "HandshakeProtocol.dart" show HandshakeProtocol;
import "package:func/func.dart";
import "Stream.dart" show IStreamResult;

/// Copyright (c) .NET Foundation. All rights reserved.
/// Licensed under the Apache License, Version 2.0. See License.txt in the project root for license information.
@JS("signalR.DEFAULT_TIMEOUT_IN_MS")
external num get DEFAULT_TIMEOUT_IN_MS;

/// Represents a connection to a SignalR Hub.
@JS("signalR.HubConnection")
class HubConnection {
  // @Ignore
  HubConnection.fakeConstructor$();
  external IConnection get connection;
  external set connection(IConnection v);
  external ILogger get logger;
  external set logger(ILogger v);
  external IHubProtocol get protocol;
  external set protocol(IHubProtocol v);
  external HandshakeProtocol get handshakeProtocol;
  external set handshakeProtocol(HandshakeProtocol v);
  external dynamic /*JSMap of <String,VoidFunc2Opt1<StreamItemMessage|CompletionMessage, Error>>*/ get callbacks;
  external set callbacks(
      dynamic /*JSMap of <String,VoidFunc2Opt1<StreamItemMessage|CompletionMessage, Error>>*/ v);
  external dynamic /*JSMap of <String,List<(...args: any[]) => void>>*/ get methods;
  external set methods(
      dynamic /*JSMap of <String,List<(...args: any[]) => void>>*/ v);
  external num get id;
  external set id(num v);
  external List<VoidFunc1Opt1<Error>> get closedCallbacks;
  external set closedCallbacks(List<VoidFunc1Opt1<Error>> v);
  external get timeoutHandle;
  external set timeoutHandle(v);
  external bool get receivedHandshakeResponse;
  external set receivedHandshakeResponse(bool v);

  /// The server timeout in milliseconds.
  /// If this timeout elapses without receiving any messages from the server, the connection will be terminated with an error.
  /// The default timeout value is 30,000 milliseconds (30 seconds).
  external num get serverTimeoutInMilliseconds;
  external set serverTimeoutInMilliseconds(num v);

  /// @internal
  /// Using a public static factory method means we can have a private constructor and an _internal_
  /// create method that can be used by HubConnectionBuilder. An "internal" constructor would just
  /// be stripped away and the '.d.ts' file would have no constructor, which is interpreted as a
  /// public parameter-less constructor.
  external static HubConnection create(
      IConnection connection, ILogger logger, IHubProtocol protocol);
  external factory HubConnection(
      IConnection connection, ILogger logger, IHubProtocol protocol);

  /// Starts the connection.
  external Future<Null> start();

  /// Stops the connection.
  external Future<Null> stop();

  /// Invokes a streaming hub method on the server using the specified name and arguments.
  /// @typeparam T The type of the items returned by the server.
  external IStreamResult<dynamic/*=T*/ > stream/*<T, any>*/(String methodName,
      [dynamic args1,
      dynamic args2,
      dynamic args3,
      dynamic args4,
      dynamic args5]);

  /// Invokes a hub method on the server using the specified name and arguments. Does not wait for a response from the receiver.
  /// The Promise returned by this method resolves when the client has sent the invocation to the server. The server may still
  /// be processing the invocation.
  external Future<Null> send(String methodName,
      [dynamic args1,
      dynamic args2,
      dynamic args3,
      dynamic args4,
      dynamic args5]);

  /// Invokes a hub method on the server using the specified name and arguments.
  /// The Promise returned by this method resolves when the server indicates it has finished invoking the method. When the promise
  /// resolves, the server has finished invoking the method. If the server method returns a result, it is produced as the result of
  /// resolving the Promise.
  /// @typeparam T The expected return type.
  external Future<dynamic/*=T*/ > invoke/*<T, any>*/(String methodName,
      [dynamic args1,
      dynamic args2,
      dynamic args3,
      dynamic args4,
      dynamic args5]);

  /// Registers a handler that will be invoked when the hub method with the specified method name is invoked.
  external on(
      String methodName, Function /*(...args: any[]) => void*/ newMethod);

  /// Removes all handlers for the specified hub method.
  /*external void off(String methodName);*/
  /// Removes the specified handler for the specified hub method.
  /// You must pass the exact same Function instance as was previously passed to [on]. Passing a different instance (even if the function
  /// body is the same) will not remove the handler.
  /*external void off(String methodName, (...args: any[]) => void method);*/
  /*external void off(String methodName, [(...args: any[]) => void method]);*/
  external void off(String methodName,
      [Function /*(...args: any[]) => void*/ method]);

  /// Registers a handler that will be invoked when the connection is closed.
  external onclose(void callback([Error error]));
  external processIncomingData(dynamic data);
  external dynamic processHandshakeResponse(dynamic data);
  external configureTimeout();
  external serverTimeout();
  external invokeClientMethod(InvocationMessage invocationMessage);
  external connectionClosed([Error error]);
  external void cleanupTimeout();
  external InvocationMessage createInvocation(
      String methodName, List<dynamic> args, bool nonblocking);
  external StreamInvocationMessage createStreamInvocation(
      String methodName, List<dynamic> args);
  external CancelInvocationMessage createCancelInvocation(String id);
}
