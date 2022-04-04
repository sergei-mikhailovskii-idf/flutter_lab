import 'package:domain/usecase/get_registration_use_case.dart';
import 'package:domain/usecase/send_registration_use_case.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:presentation/screen/home/home_bloc.dart';
import 'package:presentation/screen/home/home_page.dart';
import 'package:presentation/screen/home/home_view_mapper.dart';

import 'home_test.mocks.dart';

@GenerateMocks([
  GetRegistrationStepUseCase,
  SendRegistrationStepUseCase,
  HomeViewMapper,
])
void main() {
  final mockGetRegistrationStepUseCase = MockGetRegistrationStepUseCase();
  final mockSendRegistrationStepUseCase = MockSendRegistrationStepUseCase();
  final mockHomeViewMapper = MockHomeViewMapper();

  setUpAll(
    () {
      GetIt.I.registerFactory<HomeBloc>(
        () => HomeBloc(
          mockGetRegistrationStepUseCase,
          mockSendRegistrationStepUseCase,
          mockHomeViewMapper,
        ),
      );
    },
  );

  testWidgets('Home Page: find get registration', (tester) async {
    await tester.pumpWidget(MyApp());
    await tester.pumpAndSettle();

    final btnSendRegistrationFinder = find.byKey(Key('btn-get-registration'));

    expect(btnSendRegistrationFinder, findsNWidgets(1));
  });

  testWidgets('Home Page: tap get registration', (tester) async {
    await tester.pumpWidget(MyApp());
    await tester.pumpAndSettle();

    final btnSendRegistrationFinder = find.byKey(Key('btn-get-registration'));

    when(mockGetRegistrationStepUseCase.call()).thenAnswer(
      (realInvocation) => Future.value('abc'),
    );

    await tester.tap(btnSendRegistrationFinder);
    await tester.pumpAndSettle();

    expect(find.text('abc'), findsOneWidget);

    expect(btnSendRegistrationFinder, findsNWidgets(1));
  });
}
