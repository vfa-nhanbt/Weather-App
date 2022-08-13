package com.example.flutter_weather_app.Services.Repository

import android.util.Log
import com.example.flutter_weather_app.Base.ClientException
import com.example.flutter_weather_app.Base.ErrorResponse
import com.example.flutter_weather_app.Base.ServerException
import com.example.flutter_weather_app.Models.Weather
import com.example.flutter_weather_app.Services.Api.WeatherApi
import com.google.gson.Gson
import retrofit2.HttpException
import java.io.IOException

const val API_TAG = "WeatherRepositoryImp"

class WeatherRepositoryImp(
    private val api: WeatherApi
) : WeatherRepository {
    override suspend fun getWeatherByCityName(cityName: String): Weather {
        val response = try {
            api.getWeatherByCityName(cityName)
        } catch (e: IOException) {
            Log.e(API_TAG, "IOException: ${e.message}")
            throw ClientException(if (e.message != null) e.message else "Unexpected Error!")
        } catch (e: HttpException) {
            Log.e(API_TAG, "HttpException: ${e.message}")
            throw ServerException(if (e.message != null) e.message else "Unexpected Error!")
        }
        if (response.isSuccessful && response.body() != null) {
            Log.d(API_TAG, response.body()!!.toString())
            return response.body()!!
        }
        val gson = Gson()
        val errorBody: ErrorResponse =
            gson.fromJson(response.errorBody()!!.string(), ErrorResponse::class.java)
        Log.d(API_TAG, errorBody.toString())
        throw ClientException(errorBody.message)
    }
}

