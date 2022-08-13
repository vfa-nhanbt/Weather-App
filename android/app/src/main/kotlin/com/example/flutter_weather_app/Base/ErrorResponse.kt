package com.example.flutter_weather_app.Base

import com.google.gson.annotations.SerializedName

data class ErrorResponse(
    @SerializedName("cod")
    val cod: Int,

    @SerializedName("message")
    val message: String
)