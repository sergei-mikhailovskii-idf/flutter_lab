import 'package:json_annotation/json_annotation.dart';

enum StatusCode {
  @JsonValue(200)
  success,
  @JsonValue('500')
  weird,
}
