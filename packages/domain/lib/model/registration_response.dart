import 'package:domain/enum/status_code.dart';

abstract class RegistrationResponse {
  Map<String, dynamic>? get data;
  String? get step;
  StatusCode? get statusCode;
}