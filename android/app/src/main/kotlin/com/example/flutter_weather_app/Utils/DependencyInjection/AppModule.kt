package com.example.flutter_weather_app.Utils.DependencyInjection

import com.example.flutter_weather_app.Services.Api.WeatherApi
import com.example.flutter_weather_app.Services.Repository.WeatherRepository
import com.example.flutter_weather_app.Services.Repository.WeatherRepositoryImp
import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import org.koin.dsl.module
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

private val logger = HttpLoggingInterceptor().setLevel(HttpLoggingInterceptor.Level.BODY)

private val okHttp = OkHttpClient.Builder().addInterceptor(logger)

val appModule = module {
    single {
        Retrofit.Builder()
            .baseUrl("https://api.openweathermap.org/data/2.5/")
            .client(okHttp.build())
            .addConverterFactory(GsonConverterFactory.create())
            .build()
            .create(WeatherApi::class.java)
    }

    single<WeatherRepository> {
        WeatherRepositoryImp(get())
    }
}