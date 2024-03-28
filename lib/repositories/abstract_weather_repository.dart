import 'package:weather_app_2/repositories/models/weather_forecast_daily.dart';

abstract class AbstractWeatherRepository {
  Future<WeatherForecast> getWeatherByCity(String cityName);
  Future<WeatherForecast> getWeatherByCoord(double lon, double lat);
}
