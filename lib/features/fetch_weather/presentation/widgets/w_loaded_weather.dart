import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/weather.dart';
import '../pages/get_weather_page.dart';
import 'text_input_field.dart';

class LoadedWeather extends StatelessWidget {
  final Weather weather;
  final TextEditingController controller;

  const LoadedWeather({
    Key? key,
    required this.weather,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text("Thursday"),
        SizedBox(height: 12.h),
        Text(weather.cityName),
        SizedBox(height: 12.h),
        Text(weather.temp.toString()),
        SizedBox(height: 48.h),
        TextInputField(
          controller: controller,
          onSubmitted: (value) => onTextSubmitted(context, value),
        ),
      ],
    );
  }
}
