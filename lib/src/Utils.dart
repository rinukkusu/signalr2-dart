@JS()
library Utils;

import 'dart:async';
import "package:js/js.dart";
import "dart:typed_data" show ByteBuffer;
import "ILogger.dart" show ILogger;
import "HttpClient.dart" show HttpClient;
import "Stream.dart" show IStreamResult, IStreamSubscriber, ISubscription;
import "package:func/func.dart";

/// Copyright (c) .NET Foundation. All rights reserved.
/// Licensed under the Apache License, Version 2.0. See License.txt in the project root for license information.
@JS("signalR.Arg")
class Arg {
  // @Ignore
  Arg.fakeConstructor$();
  external static void isRequired(dynamic val, String name);
  external static void isIn(dynamic val, dynamic values, String name);
}

@JS("signalR.getDataDetail")
external String getDataDetail(dynamic data, bool includeContent);
@JS("signalR.formatArrayBuffer")
external String formatArrayBuffer(ByteBuffer data);
@JS("signalR.sendMessage")
external Future<Null> sendMessage(
    ILogger logger,
    String transportName,
    HttpClient httpClient,
    String url,
    dynamic /*String|Promise<String>*/ accessTokenFactory(),
    dynamic /*String|ByteBuffer*/ content,
    bool logMessageContent);
@JS()
external createLogger([dynamic /*ILogger|enum LogLevel*/ logger]);

@JS("signalR.Subject")
class Subject<T> implements IStreamResult<T> {
  // @Ignore
  Subject.fakeConstructor$();
  external List<IStreamSubscriber<T>> get observers;
  external set observers(List<IStreamSubscriber<T>> v);
  external Func0<Future<Null>> get cancelCallback;
  external set cancelCallback(Func0<Future<Null>> v);
  external factory Subject(Future<Null> cancelCallback());
  external void next(T item);
  external void error(dynamic err);
  external void complete();
  external ISubscription<T> subscribe(IStreamSubscriber<T> observer);
}

@JS("signalR.SubjectSubscription")
class SubjectSubscription<T> implements ISubscription<T> {
  // @Ignore
  SubjectSubscription.fakeConstructor$();
  external Subject<T> get subject;
  external set subject(Subject<T> v);
  external IStreamSubscriber<T> get observer;
  external set observer(IStreamSubscriber<T> v);
  external factory SubjectSubscription(
      Subject<T> subject, IStreamSubscriber<T> observer);
  external void dispose();
}

@JS("signalR.ConsoleLogger")
class ConsoleLogger implements ILogger {
  // @Ignore
  ConsoleLogger.fakeConstructor$();
  external num /*enum LogLevel*/ get minimumLogLevel;
  external set minimumLogLevel(num /*enum LogLevel*/ v);
  external factory ConsoleLogger(num /*enum LogLevel*/ minimumLogLevel);
  external void log(num /*enum LogLevel*/ logLevel, String message);
}
