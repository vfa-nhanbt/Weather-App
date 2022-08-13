package com.example.flutter_weather_app.Services.Api

import com.example.flutter_weather_app.Const.AppConstValues
import com.example.flutter_weather_app.Models.Weather
import retrofit2.Response
import retrofit2.http.GET
import retrofit2.http.Query

interface WeatherApi {
    @GET("weather?appid=${AppConstValues.API_KEY}")
    suspend fun getWeatherByCityName(@Query("q") cityName: String): Response<Weather>
}