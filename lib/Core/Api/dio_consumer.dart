// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import '../error/exceptions.dart';
import 'api_consumer.dart';
import 'dio_interceptor.dart';
import 'end_points.dart';
import 'status_code.dart';

class DioConsumer implements ApiConsumer {
  final Dio client;
  DioConsumer({
    required this.client,
  }) {
    (client.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    client.options
      ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..validateStatus = (status) {
        return status! < StatusCode.internalServerError;
      };
    client.interceptors.add(AppInterceptors());
  }
  @override
  Future? get(String path, {Map<String, dynamic>? queryParameter}) async {
    try {
      Response response =
          await client.get(path, queryParameters: queryParameter);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.data.toString());
      } else if (response.statusCode == 401 || response.statusCode == 404) {
        throw UnauthorizedException();
      } else if (response.statusCode == 400) {
        var res = jsonDecode(response.data.toString());
        UnprocessableException.msg = res['message'];
        throw UnprocessableException();
      }
    } on DioError catch (error) {
      _hundleDioError(error);
    }
  }

  @override
  Future? post(String path,
      {Map<String, dynamic>? body,
      bool isFormDataEnabled = false,
      Map<String, dynamic>? queryParameter}) async {
    try {
      Response response = await client.post(path,
          data: isFormDataEnabled ? FormData.fromMap(body!) : body,
          queryParameters: queryParameter);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.data.toString());
      } else if (response.statusCode == 401 || response.statusCode == 404) {
        throw UnauthorizedException();
      } else if (response.statusCode == 422) {
        var res = jsonDecode(response.data.toString());
        var msgg = List<String>.from(res['data']);
       
        InvalidParametersException.msg = msgg[0];
        throw InvalidParametersException();
      } else if (response.statusCode == 400) {
        var res = jsonDecode(response.data.toString());
        UnprocessableException.msg = res['message'];
        throw UnprocessableException();
      }
      else if (response.statusCode == 403) {
        var res = jsonDecode(response.data.toString());
        ForbiddenException.msg = res['message'];
        throw ForbiddenException();
      }
    } on DioError catch (e) {
      _hundleDioError(e);
    }
  }

  dynamic _hundleDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw FetchDataException();
      case DioErrorType.response:
        switch (error.response!.statusCode) {
          case StatusCode.badRequest:
            throw BadrequestException();
          case StatusCode.unAuthorized:
          case StatusCode.forbidden:
            throw UnauthorizedException();
          case StatusCode.notFound:
            throw NotFoundException();
          case StatusCode.confilect:
            throw ConflictException();
          case StatusCode.internalServerError:
            throw InternalServerErrorException();
        }
        break;

      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        throw NoInternetConnectionException();
    }
  }
}
