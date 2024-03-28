import 'package:flutter/material.dart';
import 'package:weather_app_2/core/constants/constants.dart';

import 'package:weather_app_2/repositories/models/weather_forecast_daily.dart';

class WeatherMeteoData extends StatelessWidget {
  const WeatherMeteoData({
    super.key,
    required this.weather,
    required this.index,
  });

  final WeatherForecast weather;
  final int index;

  @override
  Widget build(BuildContext context) {
    final pressure = weather.list![index].pressure * 0.750062;
    final humidity = weather.list![index].humidity;
    final windSpeed = weather.list![index].speed;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            getDetailForecast(
                Constants.windIcon, windSpeed.toInt(), 'm/s', 'Wind speed'),
            getDetailForecast(Constants.thermometerIcon, pressure.round(),
                'mm Hg', "Pressure"),
            getDetailForecast(
                Constants.humidityIcon, humidity.toInt(), '%', "Humidity"),
          ],
        ),
      ],
    );
  }
}

Widget getDetailForecast(
    String iconData, int value, String units, String title) {
  return Column(
    children: [
      Text(
        title,
        style: const TextStyle(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10.0),
      Image(image: AssetImage(iconData), color: Colors.white),
      const SizedBox(height: 10.0),
      Text(
        '$value',
        style: const TextStyle(
            fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 5.0),
      Text(
        units,
        style: const TextStyle(fontSize: 15.0, color: Colors.white),
      )
    ],
  );
}
