@JS()
library HubConnection;

import 'dart:async';
import "package:js/js.dart";
import "JsonHubProtocol.dart" show JsonHubProtocol;
import "HttpConnection.dart" show IHttpConnectionOptions;
import "IHubProtocol.dart" show IHubProtocol;
import "HttpClient.dart" show HttpClient;
import "Transports.dart" show ITransport;
import "ILogger.dart" show ILogger;
import "package:func/func.dart";
import "IConnection.dart" show IConnection;
import "Observable.dart" show Observable;
import "Common.dart" show ConnectionClosed;
export "JsonHubProtocol.dart" show JsonHubProtocol;

@anonymous
@JS("signalR.IHubConnectionOptions")
abstract class IHubConnectionOptions implements IHttpConnectionOptions {
  external IHubProtocol get protocol;
  external set protocol(IHubProtocol v);
  external num get timeoutInMilliseconds;
  external set timeoutInMilliseconds(num v);
  external factory IHubConnectionOptions(
      {IHubProtocol protocol,
      num timeoutInMilliseconds,
      HttpClient httpClient,
      dynamic /*enum TransportType|ITransport*/ transport,
      dynamic /*ILogger|enum LogLevel*/ logger,
      Func0<String> accessTokenFactory});
}

@JS("signalR.HubConnection")
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
  external get closedCallbacks;
  external set closedCallbacks(v);
  external get timeoutHandle;
  external set timeoutHandle(v);
  external get timeoutInMilliseconds;
  external set timeoutInMilliseconds(v);
  external get receivedHandshakeResponse;
  external set receivedHandshakeResponse(v);
  /*external factory HubConnection(String url, [IHubConnectionOptions options]);*/
  /*external factory HubConnection(IConnection connection, [IHubConnectionOptions options]);*/
  external factory HubConnection(dynamic /*String|IConnection*/ url_connection,
      [IHubConnectionOptions options]);
  external processIncomingData(data);
  external processHandshakeResponse(data);
  external configureTimeout();
  external serverTimeout();
  external invokeClientMethod(invocationMessage);
  external connectionClosed([error]);
  external Future<Null> start();
  external Future<Null> stop();
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
      String methodName, Function /*(...args: any[]) => void*/ newMethod);
  external void off(String methodName,
      [Function /*(...args: any[]) => void*/ method]);
  external void onclose(ConnectionClosed callback);
  external cleanupTimeout();
  external createInvocation(methodName, args, nonblocking);
  external createStreamInvocation(methodName, args);
  external createCancelInvocation(id);
}
