package com.example.flutter_weather_app.Services.Repository

import com.example.flutter_weather_app.Models.Weather

interface WeatherRepository {
    suspend fun getWeatherByCityName(cityName: String): Weather
}