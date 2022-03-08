import 'dart:convert';

import 'registration_response.dart';

class ApiRegistrationResponse implements RegistrationResponse {
  @override
  final Map<String, dynamic>? data;
  @override
  final String? step;

  ApiRegistrationResponse(this.data, this.step);

  static ApiRegistrationResponse? fromJson(dynamic data) {
    if (data == null || data.isEmpty) {
      return null;
    }

    var jsonData = data;
    if (data is String) {
      jsonData = json.decode(data);
    }

    return ApiRegistrationResponse(jsonData['data'], jsonData['step']);
  }
}
