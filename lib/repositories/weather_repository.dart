import 'package:dio/dio.dart';
import 'package:weather_app_2/core/constants/constants.dart';
import 'package:weather_app_2/core/error/exception.dart';
import 'package:weather_app_2/repositories/abstract_weather_repository.dart';
import 'package:weather_app_2/repositories/models/weather_forecast_daily.dart';

class WeatherRepository implements AbstractWeatherRepository {
  final Dio dio;

  WeatherRepository({required this.dio});

  @override
  Future<WeatherForecast> getWeatherByCity(String cityName) {
    String url =
        '${Constants.weatherBaseScheme}${Constants.weatherBaseUrlDomain}${Constants.weatherForecastPath}?q=$cityName&appid=${Constants.weatherAppId}&units=metric';
    return _getWeatherFromUrl(url);
  }

  @override
  Future<WeatherForecast> getWeatherByCoord(double lon, double lat) {
    String lonStr = lon.toString();
    String latStr = lat.toString();
    String url =
        '${Constants.weatherBaseScheme}${Constants.weatherBaseUrlDomain}${Constants.weatherForecastPath}?lat=$latStr&lon=$lonStr&appid=${Constants.weatherAppId}&units=metric';
    return _getWeatherFromUrl(url);
  }

  Future<WeatherForecast> _getWeatherFromUrl(String url) async {
    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        final weather = response.data;
        print(url);
        return WeatherForecast.fromJson(weather);
      } else {
        return Future.error('Error response');
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
