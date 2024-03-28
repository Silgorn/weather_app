import 'package:flutter/material.dart';
import 'package:weather_app_2/core/utils/utils.dart';
import 'package:weather_app_2/repositories/models/weather_forecast_daily.dart';

class WeatherCityAndDate extends StatelessWidget {
  const WeatherCityAndDate({
    super.key,
    required this.weather,
    required this.index,
  });

  final WeatherForecast weather;
  final int index;

  @override
  Widget build(BuildContext context) {
    final cityName = weather.city.name;
    final country = weather.city.country;
    final dateTime =
        DateTime.fromMillisecondsSinceEpoch(weather.list![index].dt * 1000);
    final formattedDateTime = Utils.getFormattedDate(dateTime);
    return Column(
      children: [
        Text(
          "$cityName, $country",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 34,
          ),
        ),
        Text(
          formattedDateTime,
          style: const TextStyle(
            color: Colors.white60,
          ),
        ),
      ],
    );
  }
}
