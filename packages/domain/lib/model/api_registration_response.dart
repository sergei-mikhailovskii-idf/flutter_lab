import 'package:json_annotation/json_annotation.dart';

import 'registration_response.dart';

part 'api_registration_response.g.dart';

@JsonSerializable()
class ApiRegistrationResponse implements RegistrationResponse {
  @override
  final Map<String, dynamic>? data;
  @override
  final String? step;

  ApiRegistrationResponse(this.data, this.step);

  factory ApiRegistrationResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ApiRegistrationResponseFromJson(json);
}
