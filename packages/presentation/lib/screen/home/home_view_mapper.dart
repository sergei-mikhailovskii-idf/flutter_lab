import 'package:domain/model/home_step_fields.dart';
import 'package:presentation/screen/home/home_data.dart';

abstract class HomeViewMapper {
  factory HomeViewMapper() => _HomeViewMapper();

  HomeStepFields mapScreenDataToRequest(HomeData screenData);
}

class _HomeViewMapper implements HomeViewMapper {
  @override
  HomeStepFields mapScreenDataToRequest(
    HomeData screenData,
  ) =>
      HomeStepFields(
        screenData.phone,
        screenData.email,
      );
}
