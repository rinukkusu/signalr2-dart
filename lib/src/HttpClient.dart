@JS("signalR")
library HttpClient;

import 'dart:async';
import "package:js/js.dart";
import "dart:typed_data" show ByteBuffer;
import "AbortController.dart" show AbortSignal;
import "ILogger.dart" show ILogger;

/// Represents an HTTP request.
@anonymous
@JS()
abstract class HttpRequest {
  /// The HTTP method to use for the request.
  external String get method;
  external set method(String v);

  /// The URL for the request.
  external String get url;
  external set url(String v);

  /// The body content for the request. May be a string or an ArrayBuffer (for binary data).
  external dynamic /*String|ByteBuffer*/ get content;
  external set content(dynamic /*String|ByteBuffer*/ v);

  /// An object describing headers to apply to the request.
  external dynamic /*JSMap of <String,String>*/ get headers;
  external set headers(dynamic /*JSMap of <String,String>*/ v);

  /// The XMLHttpRequestResponseType to apply to the request.
  external String get responseType;
  external set responseType(String v);

  /// An AbortSignal that can be monitored for cancellation.
  external AbortSignal get abortSignal;
  external set abortSignal(AbortSignal v);

  /// The time to wait for the request to complete before throwing a TimeoutError. Measured in milliseconds.
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

/// Represents an HTTP response.
@JS()
class HttpResponse {
  // @Ignore
  HttpResponse.fakeConstructor$();
  external num get statusCode;
  external set statusCode(num v);
  external String get statusText;
  external set statusText(String v);
  external dynamic /*String|ByteBuffer*/ get content;
  external set content(dynamic /*String|ByteBuffer*/ v);

  /// Constructs a new instance of [HttpResponse] with the specified status code.
  /*external factory HttpResponse(num statusCode);*/
  /// Constructs a new instance of [HttpResponse] with the specified status code and message.
  /*external factory HttpResponse(num statusCode, String statusText);*/
  /// Constructs a new instance of [HttpResponse] with the specified status code, message and string content.
  /*external factory HttpResponse(num statusCode, String statusText, String content);*/
  /// Constructs a new instance of [HttpResponse] with the specified status code, message and binary content.
  /*external factory HttpResponse(num statusCode, String statusText, ByteBuffer content);*/
  external factory HttpResponse(num statusCode,
      [String statusText, dynamic /*String|ByteBuffer*/ content]);
}

/// Abstraction over an HTTP client.
/// This class provides an abstraction over an HTTP client so that a different implementation can be provided on different platforms.
@JS()
abstract class HttpClient {
  // @Ignore
  HttpClient.fakeConstructor$();

  /// Issues an HTTP GET request to the specified URL, returning a Promise that resolves with an [HttpResponse] representing the result.
  /*external Promise<HttpResponse> JS$get(String url);*/
  /// Issues an HTTP GET request to the specified URL, returning a Promise that resolves with an [HttpResponse] representing the result.
  /*external Promise<HttpResponse> JS$get(String url, HttpRequest options);*/
  external Future<HttpResponse> JS$get(String url, [HttpRequest options]);

  /// Issues an HTTP POST request to the specified URL, returning a Promise that resolves with an [HttpResponse] representing the result.
  /*external Promise<HttpResponse> post(String url);*/
  /// Issues an HTTP POST request to the specified URL, returning a Promise that resolves with an [HttpResponse] representing the result.
  /*external Promise<HttpResponse> post(String url, HttpRequest options);*/
  external Future<HttpResponse> post(String url, [HttpRequest options]);

  /// Issues an HTTP DELETE request to the specified URL, returning a Promise that resolves with an [HttpResponse] representing the result.
  /*external Promise<HttpResponse> delete(String url);*/
  /// Issues an HTTP DELETE request to the specified URL, returning a Promise that resolves with an [HttpResponse] representing the result.
  /*external Promise<HttpResponse> delete(String url, HttpRequest options);*/
  external Future<HttpResponse> delete(String url, [HttpRequest options]);

  /// Issues an HTTP request to the specified URL, returning a [Promise] that resolves with an [HttpResponse] representing the result.
  external Future<HttpResponse> send(HttpRequest request);
}

/// Default implementation of [HttpClient].
@JS()
class DefaultHttpClient extends HttpClient {
  // @Ignore
  DefaultHttpClient.fakeConstructor$() : super.fakeConstructor$();
  external get logger;
  external set logger(v);

  /// Creates a new instance of the [DefaultHttpClient], using the provided [ILogger] to log messages.
  external factory DefaultHttpClient(ILogger logger);

  /// @inheritDoc
  external Future<HttpResponse> send(HttpRequest request);
}
