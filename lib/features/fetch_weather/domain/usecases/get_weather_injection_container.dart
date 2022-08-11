import '../../../../core/injection/injection_container.dart';
import '../../data/datasources/weather_remote_data_source.dart';
import '../../data/repositories/weather_repository_imp.dart';
import '../../presentation/mobx/state/weather_store.dart';
import '../repositories/weather_repository.dart';
import 'get_weather_use_case.dart';

class GetWeatherInjectionContainer extends InjectionContainer {
  GetWeatherInjectionContainer._internal();

  static final GetWeatherInjectionContainer instance =
      GetWeatherInjectionContainer._internal();

  factory GetWeatherInjectionContainer() {
    return instance;
  }

  @override
  Future<void> init() async {
    getIt.registerFactory<WeatherStore>(() => WeatherStore(getIt()));

    getIt.registerLazySingleton<GetWeatherUseCase>(
      () => GetWeatherUseCase(getIt()),
    );

    getIt.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImp(getIt()),
    );

    getIt.registerLazySingleton<WeatherRemoteDataSource>(
      () => WeatherRemoteDataSourceImp(),
    );
  }
}
