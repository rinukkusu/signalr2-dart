@JS()
library Utils;

import 'dart:async';
import "package:js/js.dart";
import "dart:typed_data" show ByteBuffer;
import "ILogger.dart" show ILogger;
import "HttpClient.dart" show HttpClient;
import "Stream.dart" show IStreamResult, IStreamSubscriber, ISubscription;
import "package:func2/func.dart";

@JS()
class Arg {
  // @Ignore
  Arg.fakeConstructor$();
  external static void isRequired(dynamic val, String name);
  external static void isIn(dynamic val, dynamic values, String name);
}

@JS()
external String getDataDetail(dynamic data, bool includeContent);
@JS()
external String formatArrayBuffer(ByteBuffer data);
@JS()
external Future<Null> sendMessage(
    ILogger logger,
    String transportName,
    HttpClient httpClient,
    String url,
    dynamic /*String|Promise<String>*/ accessTokenFactory(),
    dynamic /*String|ByteBuffer*/ content,
    bool logMessageContent);
@JS()
external ILogger createLogger([dynamic /*ILogger|enum LogLevel*/ logger]);

@JS()
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

@JS()
class SubjectSubscription<T> implements ISubscription<T> {
  // @Ignore
  SubjectSubscription.fakeConstructor$();
  external get subject;
  external set subject(v);
  external get observer;
  external set observer(v);
  external factory SubjectSubscription(
      Subject<T> subject, IStreamSubscriber<T> observer);
  external void dispose();
}

@JS()
class ConsoleLogger implements ILogger {
  // @Ignore
  ConsoleLogger.fakeConstructor$();
  external get minimumLogLevel;
  external set minimumLogLevel(v);
  external factory ConsoleLogger(num /*enum LogLevel*/ minimumLogLevel);
  external void log(num /*enum LogLevel*/ logLevel, String message);
}
