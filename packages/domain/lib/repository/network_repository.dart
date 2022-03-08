import 'package:domain/model/registration_response.dart';

import 'base_repository.dart';

abstract class INetworkRepository implements BaseRepository {
  Future<RegistrationResponse> getRegistration();

  Future<RegistrationResponse> sendRegistration(Map<String, dynamic> request);
}
