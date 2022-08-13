// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:flutter_weather_app/core/error/exceptions.dart';

import 'package:flutter_weather_app/core/error/failures.dart';
import 'package:flutter_weather_app/features/get_weather/data/datasources/weather_remote_data_source.dart';

import '../../domain/entities/weather.dart';
import '../../domain/repositories/weather_repository.dart';

class WeatherRepositoryImp implements WeatherRepository {
  final WeatherRemoteDataSource dataSource;

  WeatherRepositoryImp(this.dataSource);

  @override
  Future<Either<Failure, Weather>> getWeatherByCityName(String cityName) async {
    try {
      return Right(await dataSource.getWeatherByCityName(cityName));
    } on Exception catch (e) {
      return Left(
        ServerFailure(e is ServerException ? e.message : e.toString()),
      );
    }
  }
}
