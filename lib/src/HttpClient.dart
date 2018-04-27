@JS()
library HttpClient;

import 'dart:async';
import "package:js/js.dart";
import "dart:typed_data" show ByteBuffer;
import "AbortController.dart" show AbortSignal;
import "ILogger.dart" show ILogger;

abstract class XMLHttpRequestResponseType {
  static const String default_ = "";
  static const String text = "text";
  static const String arrayBuffer = "arraybuffer";
  static const String blob = "blob";
  static const String document = "document";
  static const String json = "json";
}

@anonymous
@JS("signalR.HttpRequest")
abstract class HttpRequest {
  external String get method;
  external set method(String v);
  external String get url;
  external set url(String v);
  external dynamic /*String|ByteBuffer*/ get content;
  external set content(dynamic /*String|ByteBuffer*/ v);
  external dynamic /*JSMap of <String,String>*/ get headers;
  external set headers(dynamic /*JSMap of <String,String>*/ v);
  external String get responseType;
  external set responseType(String v);
  external AbortSignal get abortSignal;
  external set abortSignal(AbortSignal v);
  external num get timeout;
  external set timeout(num v);
  external factory HttpRequest(
      {String method,
      String url,
      dynamic /*String|ByteBuffer*/ content,
      dynamic /*JSMap of <String,String>*/ headers,
      String responseType,
      AbortSignal abortSignal,
      num timeout});
}

@JS("signalR.HttpResponse")
class HttpResponse {
  // @Ignore
  HttpResponse.fakeConstructor$();
  external num get statusCode;
  external set statusCode(num v);
  external String get statusText;
  external set statusText(String v);
  external dynamic /*String|ByteBuffer*/ get content;
  external set content(dynamic /*String|ByteBuffer*/ v);
  /*external factory HttpResponse(num statusCode, String statusText, String content);*/
  /*external factory HttpResponse(num statusCode, String statusText, ByteBuffer content);*/
  external factory HttpResponse(
      num statusCode, String statusText, dynamic /*String|ByteBuffer*/ content);
}

@JS("signalR.HttpClient")
abstract class HttpClient {
  // @Ignore
  HttpClient.fakeConstructor$();
  /*external Promise<HttpResponse> JS$get(String url);*/
  /*external Promise<HttpResponse> JS$get(String url, HttpRequest options);*/
  external Future<HttpResponse> JS$get(String url, [HttpRequest options]);
  /*external Promise<HttpResponse> post(String url);*/
  /*external Promise<HttpResponse> post(String url, HttpRequest options);*/
  external Future<HttpResponse> post(String url, [HttpRequest options]);
  external Future<HttpResponse> send(HttpRequest request);
}

@JS("signalR.DefaultHttpClient")
class DefaultHttpClient extends HttpClient {
  // @Ignore
  DefaultHttpClient.fakeConstructor$() : super.fakeConstructor$();
  external get logger;
  external set logger(v);
  external factory DefaultHttpClient(ILogger logger);
  external Future<HttpResponse> send(HttpRequest request);
}
