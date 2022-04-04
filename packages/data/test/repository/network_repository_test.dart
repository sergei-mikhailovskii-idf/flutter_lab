import 'package:data/repository/network_repository.dart';
import 'package:data/service/api_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/model/registration_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'network_repository_test.mocks.dart';

/// flutter packages pub run build_runner build lib
@GenerateMocks([ApiService, CancelToken])
void main() {
  group(
    'getRegistration',
    () {
      test(
        'returns an ApiRegistrationResponse if the api call completes successfully',
        () async {
          final cancelToken = MockCancelToken();
          final apiService = MockApiService();
          final repository = NetworkRepository(apiService, cancelToken);

          when(apiService.get(
            path: anyNamed('path'),
            cancelToken: anyNamed('cancelToken'),
          )).thenAnswer(
            (realInvocation) async => Response(
              data: """
          {
    "step": "STEP_CONTACT",
    "data": {
        "contact": {
            "phone": null,
            "email": null
        }
    }
}"""
                  .trim(),
              requestOptions: RequestOptions(
                path: '',
              ),
            ),
          );

          expect(
            await repository.getRegistration(),
            isA<RegistrationResponse>(),
          );
        },
      );
    },
  );
}
