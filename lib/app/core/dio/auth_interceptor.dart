import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    return handler.next(options);
  }

  @override
  Future<void> onResponse( Response response, ResponseInterceptorHandler handler) async {
    return handler.next(response);
  }

  @override
  Future onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) async {
    // ignore: avoid_print
    print('error: ${err.response} ');
    //return throw(err);
    return handler.next(err);
  }
}
