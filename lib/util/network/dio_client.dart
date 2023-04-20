import 'dart:convert';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_template/util/config/environment.dart';
import 'package:flutter_template/util/network/auth_interceptor.dart';

class DioClient {
  static DioClient? _instance;
  static DioClient get instance => _instance ??= DioClient._();
  late final Dio _dio;
  final _cookieJar = PersistCookieJar();

  DioClient._() {
    var options = BaseOptions(
      baseUrl: Environment.instance.baseUrl,
      persistentConnection: true,
    );
    _dio = Dio(options);
    _dio.interceptors.addAll(
      [
        LogInterceptor(
          requestBody: true,
          responseBody: true,
        ),
        AuthInterceptor(),
        CookieManager(_cookieJar),
      ],
    );
  }

  Future<dynamic> get(
    String endPoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response = await _dio.get(endPoint, queryParameters: queryParameters);
      return response.data;
    } on DioError catch (e) {
      throw HttpException(e.message);
    }
  }

  Future<dynamic> post(
    String endPoint, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool encodeJson = true,
  }) async {
    try {
      var response = await _dio.post(
        endPoint,
        options: Options(headers: headers),
        data: encodeJson ? jsonEncode(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioError catch (e) {
      throw HttpException(e.message);
    }
  }

  Future<dynamic> delete(
    String endPoint, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool encodeJson = true,
  }) async {
    try {
      var response = await _dio.delete(
        endPoint,
        options: Options(headers: headers),
        data: encodeJson ? jsonEncode(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioError catch (e) {
      throw HttpException(e.message);
    }
  }
}

class HttpException implements Exception {
  String? cause;

  HttpException(this.cause);
}
