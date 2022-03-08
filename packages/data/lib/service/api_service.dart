import 'package:dio/dio.dart';

abstract class ApiService {
  factory ApiService(Dio dio) => _ApiService(dio);

  Future<Response<T>> get<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  });

  Future<Response<T>> post<T>({
    required String path,
    Map<String, dynamic>? data,
    List<int>? certificateBytes,
    List<int>? privateKeyBytes,
    List<int>? clientAuthoritiesBytes,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  });
}

class _ApiService implements ApiService {
  final Dio _dio;

  _ApiService(this._dio);

  @override
  Future<Response<T>> get<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) =>
      _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

  @override
  Future<Response<T>> post<T>({
    required String path,
    Map<String, dynamic>? data,
    List<int>? certificateBytes,
    List<int>? privateKeyBytes,
    List<int>? clientAuthoritiesBytes,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) =>
      _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
}
