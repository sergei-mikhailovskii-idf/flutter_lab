import 'package:data/di/data_injector.dart';
import 'package:domain/di/domain_injector.dart';
import 'package:presentation/di/presentation_injector.dart';

Future<void> initInjector() async {
  initPresentationModule();
  initDomainModule();
  initDataModule();
}
