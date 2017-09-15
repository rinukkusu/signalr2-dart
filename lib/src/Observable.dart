@JS()
library Observable;

import "package:js/js.dart";
import "package:func/func.dart";

@anonymous
@JS()
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

@anonymous
@JS()
abstract class Observable<T> {
  external void subscribe(Observer<T> observer);
}

@JS()
class Subject<T> implements Observable<T> {
  // @Ignore
  Subject.fakeConstructor$();
  external List<Observer<T>> get observers;
  external set observers(List<Observer<T>> v);
  external factory Subject();
  external void next(T item);
  external void error(dynamic err);
  external void complete();
  external void subscribe(Observer<T> observer);
}
