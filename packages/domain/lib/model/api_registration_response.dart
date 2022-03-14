import 'package:domain/enum/status_code.dart';
import 'package:json_annotation/json_annotation.dart';

import 'registration_response.dart';

part 'api_registration_response.g.dart';

@JsonSerializable()
class ApiRegistrationResponse implements RegistrationResponse {
  @override
  final Map<String, dynamic>? data;
  @override
  final String? step;
  @override
  final StatusCode? statusCode;

  ApiRegistrationResponse(this.data, this.step, this.statusCode);

  factory ApiRegistrationResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ApiRegistrationResponseFromJson(json);
}
