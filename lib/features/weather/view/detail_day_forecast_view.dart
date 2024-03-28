import 'package:flutter/material.dart';

import 'package:weather_app_2/features/weather/widgets/background_widget.dart';
import 'package:weather_app_2/features/weather/widgets/common_widgets/app_bar_detail_view.dart';
import 'package:weather_app_2/features/weather/widgets/common_widgets/weather_detail_back_btn.dart';
import 'package:weather_app_2/features/weather/widgets/forecast_data_widgets/weather_city_and_date.dart';
import 'package:weather_app_2/features/weather/widgets/forecast_data_widgets/weather_current_temp.dart';
import 'package:weather_app_2/features/weather/widgets/forecast_data_widgets/weather_meteo_data.dart';
import 'package:weather_app_2/features/weather/widgets/forecast_data_widgets/weather_min_max_temp.dart';
import 'package:weather_app_2/repositories/models/weather_forecast_daily.dart';

class DetailDayForecastView extends StatelessWidget {
  final WeatherForecast weather;
  final int index;

  const DetailDayForecastView({
    super.key,
    required this.weather,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDetailView(
        weather: weather,
        index: index,
      ),
      body: Container(
        decoration: backgroundWidget(),
        child: Stack(
          children: [
            Positioned(
              top: 40,
              left: 10,
              right: 10,
              bottom: 40,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.black.withOpacity(0.5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      WeatherCityAndDate(weather: weather, index: index),
                      const SizedBox(height: 20),
                      WeatherCurrentTemp(weather: weather, index: index),
                      const SizedBox(height: 20),
                      WeatherMinMaxTemp(weather: weather, index: index),
                      const SizedBox(height: 20),
                      WeatherMeteoData(weather: weather, index: index),
                      const SizedBox(height: 60),
                      const WeatherDetailBackBtn(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
