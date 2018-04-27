@JS()
library Observable;

import 'dart:async';
import "package:js/js.dart";
import "package:func/func.dart";

@anonymous
@JS("signalR.Observer")
abstract class Observer<T> {
  external bool get closed;
  external set closed(bool v);
  external VoidFunc1<T> get next;
  external set next(VoidFunc1<T> v);
  external VoidFunc1<dynamic> get error;
  external set error(VoidFunc1<dynamic> v);
  external VoidFunc0 get complete;
  external set complete(VoidFunc0 v);
  external factory Observer(
      {bool closed,
      VoidFunc1<T> next,
      VoidFunc1<dynamic> error,
      VoidFunc0 complete});
}

@JS("signalR.Subscription")
class Subscription<T> {
  // @Ignore
  Subscription.fakeConstructor$();
  external get subject;
  external set subject(v);
  external get observer;
  external set observer(v);
  external factory Subscription(Subject<T> subject, Observer<T> observer);
  external void dispose();
}

@anonymous
@JS("signalR.Observable")
abstract class Observable<T> {
  external Subscription<T> subscribe(Observer<T> observer);
}

@JS("signalR.Subject")
class Subject<T> implements Observable<T> {
  // @Ignore
  Subject.fakeConstructor$();
  external List<Observer<T>> get observers;
  external set observers(List<Observer<T>> v);
  external Func0<Future<Null>> get cancelCallback;
  external set cancelCallback(Func0<Future<Null>> v);
  external factory Subject(Future<Null> cancelCallback());
  external void next(T item);
  external void error(dynamic err);
  external void complete();
  external Subscription<T> subscribe(Observer<T> observer);
}
