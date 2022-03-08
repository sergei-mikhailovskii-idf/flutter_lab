import 'package:data/service/api_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/model/api_registration_response.dart';
import 'package:domain/model/registration_response.dart';
import 'package:domain/repository/network_repository.dart';

import 'api_base_repository.dart';

class NetworkRepository extends ApiBaseRepositoryImpl
    implements INetworkRepository {
  final ApiService _service;
  final CancelToken _cancelToken;

  NetworkRepository(
    this._service,
    this._cancelToken,
  ) : super(cancelToken: _cancelToken);

  @override
  Future<RegistrationResponse> getRegistration() => _service
      .get(
        path: 'mxcc-registration/gateway/REGISTRATION/',
        cancelToken: _cancelToken,
      )
      .then(
        (value) => Future.value(ApiRegistrationResponse.fromJson(value.data)),
      );
}
