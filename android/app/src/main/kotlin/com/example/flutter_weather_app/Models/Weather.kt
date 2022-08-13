package com.example.flutter_weather_app.Models

data class Weather(
    val id: String,
    val main: Main,
    val name: String,
    val timezone: Int
)