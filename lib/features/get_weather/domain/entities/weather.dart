// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_weather_app/features/get_weather/domain/entities/weather_main.dart';

class Weather extends Equatable {
  final String id;
  final String name;
  final int timezone;
  final WeatherMain main;
  const Weather({
    required this.id,
    required this.name,
    required this.timezone,
    required this.main,
  });

  Weather copyWith({
    String? id,
    String? name,
    int? timezone,
    WeatherMain? main,
  }) {
    return Weather(
      id: id ?? this.id,
      name: name ?? this.name,
      timezone: timezone ?? this.timezone,
      main: main ?? this.main,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'timezone': timezone,
      'main': main.toMap(),
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      id: (map['id'] ?? '') as String,
      name: (map['name'] ?? '') as String,
      timezone: (map['timezone'] ?? 0) as int,
      main: WeatherMain.fromMap(map['main'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(String source) =>
      Weather.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, name, timezone, main];
}
