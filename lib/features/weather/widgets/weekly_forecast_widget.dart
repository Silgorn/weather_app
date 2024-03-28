import 'package:flutter/material.dart';
import 'package:weather_app_2/core/utils/utils.dart';
import 'package:weather_app_2/features/weather/view/detail_day_forecast_view.dart';
import 'package:weather_app_2/features/weather/widgets/forecast_data_widgets/weather_current_temp.dart';

import 'package:weather_app_2/repositories/models/weather_forecast_daily.dart';

class WeeklyForecastWidget extends StatelessWidget {
  final WeatherForecast weather;
  const WeeklyForecastWidget({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 4.5,
      child: ListView.separated(
          itemCount: weather.list!.length - 1,
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final indexPlus = index + 1;
            var dayOfWeek = '';
            DateTime date = DateTime.fromMillisecondsSinceEpoch(
                weather.list![indexPlus].dt * 1000);
            final fullDate = Utils.getFullDayOfWeek(date);
            dayOfWeek = fullDate.split(',')[0];
            return GestureDetector(
              onTap: () {
                Route route = MaterialPageRoute(
                    builder: (context) => DetailDayForecastView(
                          weather: weather,
                          index: indexPlus,
                        ));
                Navigator.push(context, route);
              },
              child: Container(
                // height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.black.withOpacity(0.5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        dayOfWeek,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                        ),
                      ),
                      WeatherCurrentTemp(
                        weather: weather,
                        index: indexPlus,
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
