package com.example.flutter_weather_app.Base

open class BaseException(errorMessage: String?) : Exception(errorMessage)

class ServerException(errorMessage: String?) : BaseException(errorMessage)

class ClientException(errorMessage: String?) : BaseException(errorMessage)