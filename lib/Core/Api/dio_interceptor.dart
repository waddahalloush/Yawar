import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class AppInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrintStack(
        label: 'REQUEST[${options.method}] => PATH: ${options.path}');
    options.headers['Accept'] = 'application/json';
    // options.headers['Authorization'] = EndPoints.token;
    options.headers['Authorization'] =
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vYXBpLm1lZGlhLW5hcy5uZXQvYXBpL3VzZXJzL3YxL2xvZ2luIiwiaWF0IjoxNjk1MTAzMjc1LCJleHAiOjE2OTc1MTUyNzUsIm5iZiI6MTY5NTEwMzI3NSwianRpIjoiMEFlUHJYbHdhYzVldFRucCIsInN1YiI6Ijg2MCIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.3MArC7a18eeOQ0IRXjpXjD8DvCiYTtI7CmRa0CzmM08';
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrintStack(
        label:
            'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path} => response:${response.data}');

    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    debugPrintStack(
        label:
            'ERROR[${err.response?.statusCode}] => PATH: ${err.response!.data}');
    super.onError(err, handler);
  }
}
