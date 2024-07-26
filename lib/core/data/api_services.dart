import 'dart:convert';

import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:randomuserflutter/core/data/exception.dart';

class HttpApiClient {
  HttpApiClient({
    required Dio dioClient,
  }) : _dioClient = dioClient {
    _initDioClient();
  }

  final Dio _dioClient;
  final String urlPath = "https://randomuser.me/api/";

  void _initDioClient() {
    final options = BaseOptions(
      baseUrl: urlPath,
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 5000),
    );

    _dioClient.options = options;

    _dioClient.options.headers = <String, String>{
      'Accept': 'application/json',
      'content-type': 'application/json; charset=utf-8'
    };

    _dioClient.interceptors
      ..clear()
      // custom interceptor to add Authorization header
      ..add(
        InterceptorsWrapper(onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          final Map<String, dynamic> headers = <String, String>{};

          options.headers.addAll(headers);

          handler.next(options);
        }, onResponse: (response, handler) {
          // Do something with response data
          return handler.next(response); // continue
          // If you want to reject the request with a error message,
          // you can reject a `DioError` object eg: `handler.reject(dioError)`
        }, onError: (DioException e, handler) {
          // Do something with response error
          return handler.next(e); //continue
          // If you want to resolve the request with some custom data，
          // you can resolve a `Response` object eg: `handler.resolve(response)`.
        }),
      );
    if (kDebugMode) {
      _dioClient.interceptors.add(CurlLoggerDioInterceptor(printOnSuccess: true));
    }
  }

  /// Handy method to make HTTP 'GET' request.
  Future<Response<T>> get<T>({
    ResponseType responseType = ResponseType.json,
  }) {
    return _dioClient
        .get<T>(
          urlPath,
          options: Options().copyWith(responseType: responseType),
        )
        .onError((DioException error, _) => throw _catchErrors(error));
  }

  /// Handy method to make HTTP 'POST' request.
  Future<Response<T>> post<T>({
    required String path,
    dynamic data,
  }) {
    return _dioClient
        .post<T>(
          path,
          data: jsonDecode(jsonEncode(data)),
        )
        .onError((DioException error, _) => throw _catchErrors(error));
  }

  /// Handy method to make HTTP 'PUT' request.
  Future<Response<T>> put<T>({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) {
    return _dioClient
        .put<T>(
          path,
          data: jsonDecode(jsonEncode(data)),
          queryParameters: queryParameters,
        )
        .onError((DioException error, _) => throw _catchErrors(error));
  }

  /// Handy method to make HTTP 'DELETE' request.
  Future<Response<T>> delete<T>({
    required String path,
    dynamic data,
  }) {
    return _dioClient
        .delete<T>(
          path,
          data: jsonDecode(jsonEncode(data)),
        )
        .onError((DioException error, _) => throw _catchErrors(error));
  }

  Future<Response<T>> _catchErrors<T>(DioException dioError) {
    debugPrint(
      // ignore: lines_longer_than_80_chars
      '${dioError.requestOptions.method.toUpperCase()} -> path:${dioError.requestOptions.path}, status code: ${dioError.response?.statusCode ?? "no status code"}, data = ${dioError.response?.data}',
    );

    throw ApiException(
      method: dioError.requestOptions.method,
      path: dioError.requestOptions.path,
      data: dioError.requestOptions.data,
      statusCode: dioError.response?.statusCode ?? 500,
      error: dioError.response?.data,
    );
  }
}
