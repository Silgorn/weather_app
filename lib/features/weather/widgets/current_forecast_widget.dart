import 'package:flutter/material.dart';
import 'package:weather_app_2/features/weather/view/detail_day_forecast_view.dart';
import 'package:weather_app_2/features/weather/widgets/forecast_data_widgets/weather_city_and_date.dart';
import 'package:weather_app_2/features/weather/widgets/forecast_data_widgets/weather_current_temp.dart';
import 'package:weather_app_2/features/weather/widgets/forecast_data_widgets/weather_min_max_temp.dart';
import 'package:weather_app_2/repositories/models/weather_forecast_daily.dart';

class CurrentForecastWidget extends StatelessWidget {
  final WeatherForecast weather;

  const CurrentForecastWidget({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Route route = MaterialPageRoute(
            builder: (context) => DetailDayForecastView(
                  weather: weather,
                  index: 0,
                ));
        Navigator.push(context, route);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        // height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.black.withOpacity(0.5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              WeatherCityAndDate(weather: weather, index: 0),
              WeatherCurrentTemp(weather: weather, index: 0),
              WeatherMinMaxTemp(weather: weather, index: 0),
            ],
          ),
        ),
      ),
    );
  }
}
