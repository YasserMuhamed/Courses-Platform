import 'package:courses_platform/core/api/api_manager.dart';
import 'package:courses_platform/core/api/dio_factory.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void getItSetup() {
  getIt.registerSingleton<ApiManager>(ApiManager(dio: DioFactory.getDio()));
}
