import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_weather_app/features/fetch_weather/presentation/mobx/state/weather_store.dart';
import 'package:flutter_weather_app/features/fetch_weather/presentation/pages/get_weather_page.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (_, __) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Provider(
          create: (context) => GetIt.I<WeatherStore>(),
          child: const GetWeatherPage(),
        ),
      ),
    );
  }
}
