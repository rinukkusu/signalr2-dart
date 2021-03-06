@JS("signalR")
library HubConnection;

import 'dart:async';
import "package:js/js.dart";
import "Stream.dart" show IStreamResult;

/// Represents a connection to a SignalR Hub.
@JS()
class HubConnection {
  // @Ignore
  HubConnection.fakeConstructor$();
  external get connection;
  external set connection(v);
  external get logger;
  external set logger(v);
  external get protocol;
  external set protocol(v);
  external get handshakeProtocol;
  external set handshakeProtocol(v);
  external get callbacks;
  external set callbacks(v);
  external get methods;
  external set methods(v);
  external get id;
  external set id(v);
  external get closedCallbacks;
  external set closedCallbacks(v);
  external get timeoutHandle;
  external set timeoutHandle(v);
  external get receivedHandshakeResponse;
  external set receivedHandshakeResponse(v);

  /// The server timeout in milliseconds.
  /// If this timeout elapses without receiving any messages from the server, the connection will be terminated with an error.
  /// The default timeout value is 30,000 milliseconds (30 seconds).
  external num get serverTimeoutInMilliseconds;
  external set serverTimeoutInMilliseconds(num v);
  external factory HubConnection();

  /// Starts the connection.
  external Future<Null> start();

  /// Stops the connection.
  external Future<Null> stop();

  /// Invokes a streaming hub method on the server using the specified name and arguments.
  /// @typeparam T The type of the items returned by the server.
  external IStreamResult<dynamic> stream(String methodName,
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
  external Future<dynamic> invoke(String methodName,
      [dynamic args1,
      dynamic args2,
      dynamic args3,
      dynamic args4,
      dynamic args5]);

  /// Registers a handler that will be invoked when the hub method with the specified method name is invoked.
  external void on(
      String methodName, Function /*(...args: any[]) => void*/ newMethod);

  /// Removes all handlers for the specified hub method.
  /*external void off(String methodName);*/
  /// Removes the specified handler for the specified hub method.
  /// You must pass the exact same Function instance as was previously passed to [@aspnet/signalr.HubConnection.on]. Passing a different instance (even if the function
  /// body is the same) will not remove the handler.
  /*external void off(String methodName, (...args: any[]) => void method);*/
  external void off(String methodName,
      [Function /*(...args: any[]) => void*/ method]);

  /// Registers a handler that will be invoked when the connection is closed.
  external void onclose(void callback([Error error]));
  external get processIncomingData;
  external set processIncomingData(v);
  external get processHandshakeResponse;
  external set processHandshakeResponse(v);
  external get configureTimeout;
  external set configureTimeout(v);
  external get serverTimeout;
  external set serverTimeout(v);
  external get invokeClientMethod;
  external set invokeClientMethod(v);
  external get connectionClosed;
  external set connectionClosed(v);
  external get cleanupTimeout;
  external set cleanupTimeout(v);
  external get createInvocation;
  external set createInvocation(v);
  external get createStreamInvocation;
  external set createStreamInvocation(v);
  external get createCancelInvocation;
  external set createCancelInvocation(v);
}
