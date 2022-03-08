import 'package:dio/dio.dart';
import 'package:domain/model/api_registration_response.dart';
import 'package:retrofit/retrofit.dart';

part 'retrofit_api_service.g.dart';

@RestApi(baseUrl: "http://10.1.1.30/")
abstract class RetrofitApiService {
  factory RetrofitApiService(Dio dio, {String baseUrl}) = _RetrofitApiService;

  @GET("mxcc-registration/gateway/REGISTRATION/")
  Future<ApiRegistrationResponse> getRegistration(
    @CancelRequest() CancelToken cancelToken,
  );

  @POST("mxcc-registration/gateway/REGISTRATION/")
  Future<ApiRegistrationResponse> sendRegistration(
    @CancelRequest() CancelToken cancelToken,
    @Body() Map<String, dynamic> data,
  );
}
