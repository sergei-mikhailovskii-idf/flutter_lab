import 'package:domain/model/api_base_json_request.dart';

class HomeStepFields implements ApiBaseJsonRequest {
  final String? phone;
  final String? email;

  HomeStepFields(this.phone, this.email);

  @override
  Map<String, dynamic> toJson() => {
        'contact': {
          'phone': phone,
          'email': email,
        },
      };
}
