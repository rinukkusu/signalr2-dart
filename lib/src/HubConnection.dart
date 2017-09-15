@JS()
library HubConnection;

import 'dart:async';
import "package:js/js.dart";
import "HttpConnection.dart" show HttpConnection;
import "JsonHubProtocol.dart" show JsonHubProtocol;
import "ILogger.dart" show ILogger;
import "Loggers.dart" show ConsoleLogger, NullLogger;
import "IConnection.dart" show IConnection;
import "IHubConnectionOptions.dart" show IHubConnectionOptions;
import "Observable.dart" show Observable;
import "Common.dart" show ConnectionClosed;
export "Transports.dart" /*enum TransportType*/;
export "HttpConnection.dart" show HttpConnection;
export "JsonHubProtocol.dart" show JsonHubProtocol;
export "ILogger.dart" show /*enum LogLevel*/ ILogger;
export "Loggers.dart" show ConsoleLogger, NullLogger;

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
  external get callbacks;
  external set callbacks(v);
  external get methods;
  external set methods(v);
  external get id;
  external set id(v);
  external get connectionClosedCallback;
  external set connectionClosedCallback(v);
  external factory HubConnection(dynamic /*String|IConnection*/ urlOrConnection,
      [IHubConnectionOptions options]);
  external onDataReceived(data);
  external invokeClientMethod(invocationMessage);
  external onConnectionClosed(error);
  external Future<Null> start();
  external void stop();
  external Observable<dynamic/*=T*/ > stream/*<T>*/(String methodName,
      [dynamic args1,
      dynamic args2,
      dynamic args3,
      dynamic args4,
      dynamic args5]);
  external Future<Null> send(String methodName,
      [dynamic args1,
      dynamic args2,
      dynamic args3,
      dynamic args4,
      dynamic args5]);
  external Future<dynamic> invoke(String methodName,
      [dynamic args1,
      dynamic args2,
      dynamic args3,
      dynamic args4,
      dynamic args5]);
  external void on(
      String methodName, Function /*(...args: any[]) => void*/ method);
  external ConnectionClosed get onClosed;
  external set onClosed(ConnectionClosed v);
  external createInvocation(methodName, args, nonblocking);
}
