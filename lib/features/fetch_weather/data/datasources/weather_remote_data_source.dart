import 'dart:math';

import 'package:flutter_weather_app/core/error/exceptions.dart';

import '../../domain/entities/weather.dart';

abstract class WeatherRemoteDataSource {
  Future<Weather> getWeatherByCityName(String cityName);
}

class WeatherRemoteDataSourceImp implements WeatherRemoteDataSource {
  @override
  Future<Weather> getWeatherByCityName(String cityName) {
    return Future.delayed(const Duration(seconds: 1), () {
      final random = Random();

      if (random.nextBool()) {
        throw ServerException("Server has crashed");
      }

      final double randomTemp = random.nextInt(24) + random.nextDouble();

      return Weather(
        id: "1",
        cityName: cityName,
        temp: randomTemp,
      );
    });
  }
}
