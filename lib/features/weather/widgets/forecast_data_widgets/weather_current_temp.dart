import 'package:flutter/material.dart';

import 'package:weather_app_2/repositories/models/weather_forecast_daily.dart';

class WeatherCurrentTemp extends StatelessWidget {
  const WeatherCurrentTemp({
    super.key,
    required this.weather,
    required this.index,
  });

  final WeatherForecast weather;
  final int index;

  @override
  Widget build(BuildContext context) {
    final weatherIcon = weather.list![index].getIconUrl();
    final weatherTemp = weather.list![index].temp.day.toInt().toString();
    final weatherDescription = weather.list![index].weather[0].description;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(weatherIcon, scale: 0.5),
        Column(
          children: [
            Text(
              "$weatherTemp ℃",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              weatherDescription,
              style: const TextStyle(
                color: Colors.white60,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
