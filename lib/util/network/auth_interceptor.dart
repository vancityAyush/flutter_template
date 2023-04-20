import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response!.statusCode == 401) {}

    return super.onError(err, handler);
  }
}
