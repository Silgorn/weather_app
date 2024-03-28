import 'package:flutter/material.dart';

import 'package:weather_app_2/repositories/models/weather_forecast_daily.dart';

class WeatherMinMaxTemp extends StatelessWidget {
  final WeatherForecast weather;
  final int index;
  const WeatherMinMaxTemp({
    super.key,
    required this.weather,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final minTemp = weather.list![index].temp.min.toInt();
    final maxTemp = weather.list![index].temp.max.toInt();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text(
              'Min. temp'.toUpperCase(),
              style: const TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              '$minTemp ℃',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              'Max. temp'.toUpperCase(),
              style: const TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              '$maxTemp ℃',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
