// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:flutter_weather_app/core/mobx/base_state.dart';
import 'package:flutter_weather_app/features/get_weather/domain/usecases/get_weather_use_case.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/error/failures.dart';
import '../../../domain/entities/weather.dart';
import '../../../domain/entities/weather_main.dart';

part 'weather_store.g.dart';

class WeatherStore extends _WeatherStore with _$WeatherStore {
  WeatherStore(GetWeatherUseCase getWeatherUseCase) : super(getWeatherUseCase);
}

abstract class _WeatherStore with Store {
  // final WeatherRepository repository;
  final GetWeatherUseCase getWeatherUseCase;

  _WeatherStore(this.getWeatherUseCase);

  @observable
  ObservableFuture<Either<Failure, Weather>>? _weatherFuture;

  @observable
  Weather? weather;

  @observable
  String? errorMessage;

  @computed
  BaseStoreState get state {
    if (_weatherFuture == null) {
      return BaseStoreState.initial;
    }
    if (_weatherFuture!.status == FutureStatus.rejected) {
      return BaseStoreState.error;
    }
    return _weatherFuture!.status == FutureStatus.pending
        ? BaseStoreState.loading
        : BaseStoreState.loaded;
  }

  @action
  Future getWeatherByCityName(String cityName) async {
    errorMessage = null;

    /// Call get weather use case and return either failure or weather
    /// Use [_weatherFuture] instead of [weather] to automatically update `state`
    _weatherFuture =
        ObservableFuture(getWeatherUseCase(GetWeatherParams(cityName)));
    final Either<Failure, Weather>? weatherOrFail = await _weatherFuture;

    if (weatherOrFail == null) {
      return weather = const Weather(
        id: "id",
        name: "weather",
        timezone: 0,
        main: WeatherMain(temp: 0),
      );
    }

    /// Handle the return value of repository and update error message via Dartz, Equatable package
    return weatherOrFail.fold(
      (l) => l is ServerFailure
          ? errorMessage = l.message
          : errorMessage = "Unexpected Error",
      (r) => weather = r,
    );
  }
}
