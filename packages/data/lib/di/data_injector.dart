import 'package:data/repository/network_repository.dart';
import 'package:domain/repository/network_repository.dart';
import 'package:get_it/get_it.dart';

Future<void> initDataModule() async {
  _initRepositoryModule();
}

void _initRepositoryModule() {
  GetIt.I.registerFactory<INetworkRepository>(() => NetworkRepository());
}