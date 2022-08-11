import '../features/fetch_weather/domain/usecases/get_weather_injection_container.dart';

class DependencyInitializer {
  DependencyInitializer._internal();

  static Future<void> init() async {
    await GetWeatherInjectionContainer.instance.init();
  }
}
