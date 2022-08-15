
# Flutter Weather App

A basic demo mobile application calling opensource APIs from native code via Flutter Method Channel, implemented Clean Architecture, using MobX to manage app state.


## API Reference

#### Built-in API request by city name

```http
 https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `city name` | `string` | **Required** Some location you must call country instead of city name(Ex: VietNam)|
| `api_key` | `string` | **Required**  Unique API key (has been hard-coded) |


## API Response                

**JSON - Example of API Response**
```
{
    "main": {
        "temp": 298.13
    },
    "timezone": 25200,
    "id": 1562822,
    "name": "Vietnam"
}
```

**Convert to Model**
```
data class Weather(
    val id: String,
    val main: Main,
    val name: String,
    val timezone: Int
)

data class Main(
    val temp: Double
)
```
## Features

- Get current weather data of the input location (city, states, country)
- Handle error, exception from server (Just built-in, not imp client exception such as connectivity,... yet)
- Imp Clean Architecture with MobX (Haven't imp any unit test yet)
- Using Method Channel (Flutter side: send _city name_ argument - Native side: Call API - send _Json String_ response)


## Author

- 7249790_NhanBT [@vfa-nhanbt](https://github.com/vfa-nhanbt)
