import 'package:data/service/retrofit_api_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/model/registration_response.dart';
import 'package:domain/repository/network_repository.dart';

import 'api_base_repository.dart';

class NetworkRepository extends ApiBaseRepositoryImpl
    implements INetworkRepository {
  final RetrofitApiService _retrofitApiService;
  final CancelToken _cancelToken;

  NetworkRepository(
    this._retrofitApiService,
    this._cancelToken,
  ) : super(cancelToken: _cancelToken);

  @override
  Future<RegistrationResponse> getRegistration() =>
      _retrofitApiService.getRegistration(
        _cancelToken,
      );

  @override
  Future<RegistrationResponse> sendRegistration(
    Map<String, dynamic> request,
  ) =>
      _retrofitApiService.sendRegistration(
        _cancelToken,
        request,
      );
}
