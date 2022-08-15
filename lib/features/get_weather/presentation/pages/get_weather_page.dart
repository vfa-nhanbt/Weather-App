import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../configs/formats.dart';
import '../../../../core/mobx/base_state.dart';
import '../mobx/state/weather_store.dart';
import '../widgets/text_input_field.dart';

class GetWeatherPage extends StatefulWidget {
  const GetWeatherPage({Key? key}) : super(key: key);

  @override
  State<GetWeatherPage> createState() => _GetWeatherPageState();
}

class _GetWeatherPageState extends State<GetWeatherPage> {
  WeatherStore? weatherStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    weatherStore ??= Provider.of<WeatherStore>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: LayoutBuilder(
        builder: (context, constraint) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.maxHeight),
            child: Padding(
              padding: EdgeInsets.fromLTRB(32.w, 16.h, 32.w, 16.h),
              child: Center(
                child: Observer(
                  builder: (_) {
                    if (weatherStore!.state == BaseStoreState.initial) {
                      return TextInputField(
                        controller: controller,
                        onSubmitted: (value) => onTextSubmitted(context, value),
                      );
                    }
                    if (weatherStore!.state == BaseStoreState.loading) {
                      return const CircularProgressIndicator();
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        (weatherStore!.state == BaseStoreState.error ||
                                weatherStore!.errorMessage != null)
                            ? Text(weatherStore!.errorMessage ?? "Error")
                            : Text(
                                "${AppFormats.instance.formatDay.format(weatherStore!.weather!.dateFromTimezone)}\n${weatherStore!.weather!.name}\n${weatherStore!.weather!.celsiusTemp.toStringAsFixed(2)}°C",
                                textAlign: TextAlign.center,
                              ),
                        TextInputField(
                          controller: controller,
                          onSubmitted: (value) =>
                              onTextSubmitted(context, value),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

onTextSubmitted(BuildContext context, String cityName) {
  return Provider.of<WeatherStore>(context, listen: false)
      .getWeatherByCityName(cityName);
}
