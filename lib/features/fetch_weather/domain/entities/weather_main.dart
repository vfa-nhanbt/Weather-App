// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class WeatherMain extends Equatable {
  final double temp;

  const WeatherMain({
    required this.temp,
  });

  WeatherMain copyWith({
    double? temp,
  }) {
    return WeatherMain(
      temp: temp ?? this.temp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'temp': temp,
    };
  }

  factory WeatherMain.fromMap(Map<String, dynamic> map) {
    return WeatherMain(
      temp: (map['temp'] ?? 0.0) as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherMain.fromJson(String source) =>
      WeatherMain.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [temp];
}
