import 'package:dio/dio.dart';

class CancelInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.reject(
      DioError(
        requestOptions: options,
        type: DioErrorType.cancel,
        error: "cancel request by myself",
      ),
    );
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {}
}
