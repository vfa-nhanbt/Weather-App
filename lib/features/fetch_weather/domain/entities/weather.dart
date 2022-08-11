// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final String id;
  final String cityName;
  final double temp;

  const Weather({
    required this.id,
    required this.cityName,
    required this.temp,
  });

  Weather copyWith({
    String? id,
    String? cityName,
    double? temp,
  }) {
    return Weather(
      id: id ?? this.id,
      cityName: cityName ?? this.cityName,
      temp: temp ?? this.temp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'cityName': cityName,
      'temp': temp,
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      id: (map['id'] ?? '') as String,
      cityName: (map['cityName'] ?? '') as String,
      temp: (map['temp'] ?? 0.0) as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(String source) =>
      Weather.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, cityName, temp];
}
