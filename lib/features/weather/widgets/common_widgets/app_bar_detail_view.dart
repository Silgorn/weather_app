import 'package:flutter/material.dart';
import 'package:weather_app_2/core/utils/utils.dart';
import 'package:weather_app_2/repositories/models/weather_forecast_daily.dart';

class AppBarDetailView extends StatelessWidget implements PreferredSizeWidget {
  const AppBarDetailView({
    super.key,
    required this.weather,
    required this.index,
  });

  final WeatherForecast weather;
  final int index;

  @override
  Widget build(BuildContext context) {
    var dayOfWeek = '';
    DateTime date =
        DateTime.fromMillisecondsSinceEpoch(weather.list![index].dt * 1000);
    final fullDate = Utils.getFullDayOfWeek(date);
    dayOfWeek = fullDate.split(',')[0];
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      title: Text(
        dayOfWeek,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: const Color.fromARGB(255, 47, 114, 168),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
