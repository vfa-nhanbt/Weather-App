import 'package:flutter_weather_app/core/app/values.dart';
import 'package:flutter_weather_app/core/error/exceptions.dart';

import '../../domain/entities/weather.dart';

abstract class WeatherRemoteDataSource {
  Future<Weather> getWeatherByCityName(String cityName);
}

class WeatherRemoteDataSourceImp implements WeatherRemoteDataSource {
  @override
  Future<Weather> getWeatherByCityName(String cityName) async {
    try {
      String? source = await AppValues.instance.jsonMethodChannel
          .invokeMethod<String>('getWeatherByCityName', cityName);

      if (source == null) {
        throw ServerException("Cannot receive response from native");
      }

      return Weather.fromJson(source);
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
    /*
      return Future.delayed(const Duration(seconds: 1), () {
        final random = Random();

        if (random.nextBool()) {
          throw ServerException("Server has crashed");
        }

        final double randomTemp = random.nextInt(24) + random.nextDouble();

        return Weather(
          id: "1",
          name: cityName,
          timezone: 0,
          main: WeatherMain(temp: randomTemp),
        );
      });
     */
  }
}
