// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_weather_app/core/error/failures.dart';
import 'package:flutter_weather_app/core/usecases/base_use_case.dart';
import 'package:flutter_weather_app/features/get_weather/domain/repositories/weather_repository.dart';

import '../entities/weather.dart';

class GetWeatherUseCase implements UseCase<Weather, GetWeatherParams> {
  final WeatherRepository repository;

  GetWeatherUseCase(this.repository);

  @override
  Future<Either<Failure, Weather>> call(GetWeatherParams params) async =>
      await repository.getWeatherByCityName(params.cityName);
}

class GetWeatherParams extends Equatable {
  final String cityName;

  const GetWeatherParams(this.cityName);

  @override
  List<Object?> get props => [cityName];
}
