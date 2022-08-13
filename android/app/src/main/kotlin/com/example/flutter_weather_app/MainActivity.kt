package com.example.flutter_weather_app

import androidx.annotation.NonNull
import androidx.lifecycle.lifecycleScope
import com.example.flutter_weather_app.Base.ClientException
import com.example.flutter_weather_app.Services.Api.WeatherApi
import com.example.flutter_weather_app.Services.Repository.WeatherRepository
import com.google.gson.Gson
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.JSONMethodCodec
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.launch
import org.koin.android.ext.android.inject

class MainActivity : FlutterActivity() {

    private val weatherApi by inject<WeatherApi>()
    private val weatherRepositoryImp by inject<WeatherRepository>()

    private val jsonMethodChannelName = "com.example.flutter_weather_app/method-channel/json"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        val gson = Gson()

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            jsonMethodChannelName,
            JSONMethodCodec.INSTANCE
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                "getWeatherByCityName" -> {
                    val cityName: String = call.arguments as String
                    lifecycleScope.launch {
                        try {
                            val weatherToJson: String? =
                                gson.toJson(weatherRepositoryImp.getWeatherByCityName(cityName))
                            if (weatherToJson == null || weatherToJson.isEmpty()) {
                                result.error("NullPointerException", "Type cannot be empty", null)
                                return@launch
                            } else {
                                return@launch result.success(weatherToJson)
                            }
                        } catch (e: ClientException) {
                            result.error("Exception", e.message, null)
                        }
                    }
                }
                else -> result.notImplemented()
            }
        }

    }
}
