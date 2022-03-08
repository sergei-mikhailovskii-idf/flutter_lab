import 'dart:io';

import 'package:dio/dio.dart';

Dio dioBuilder(
  String baseUrl, {
  Map<String, dynamic>? headers,
}) {
  final timeout = 60000;
  final headersMap = headers ?? <String, dynamic>{};
  headersMap[HttpHeaders.userAgentHeader] =
      '${Platform.operatingSystem}-APPLICATION'.toUpperCase();

  final options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: timeout,
    receiveTimeout: timeout,
    sendTimeout: timeout,
    headers: headers,
    contentType: 'application/json',
  );

  final dio = Dio(options);
  return dio;
}
