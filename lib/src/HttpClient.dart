@JS()
library HttpClient;

import 'dart:async';
import "package:js/js.dart";

@anonymous
@JS()
abstract class IHttpClient {
  external Future<String> JS$get(String url, [Map<String, String> headers]);
  external Future<String> options(String url, [Map<String, String> headers]);
  external Future<String> post(String url, String content,
      [Map<String, String> headers]);
}

@JS()
class HttpClient implements IHttpClient {
  // @Ignore
  HttpClient.fakeConstructor$();
  external Future<String> JS$get(String url, [Map<String, String> headers]);
  external Future<String> options(String url, [Map<String, String> headers]);
  external Future<String> post(String url, String content,
      [Map<String, String> headers]);
  external xhr(method, url, [headers, content]);
}
