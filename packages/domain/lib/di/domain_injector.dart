import 'package:domain/repository/network_repository.dart';
import 'package:domain/usecase/palindrome_usecase.dart';
import 'package:get_it/get_it.dart';

Future<void> initDomainModule() async {
  _initUseCaseModule();
}

void _initUseCaseModule() {
  GetIt.I.registerFactory(
    () => PalindromeUseCase(GetIt.I.get<INetworkRepository>()),
  );
}
