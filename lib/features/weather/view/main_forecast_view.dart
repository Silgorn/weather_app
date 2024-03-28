import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_2/features/weather/bloc/get_weather_bloc.dart';
import 'package:weather_app_2/features/weather/widgets/common_widgets/app_bar_main_view.dart';
import 'package:weather_app_2/features/weather/widgets/background_widget.dart';
import 'package:weather_app_2/features/weather/widgets/common_widgets/circular_progress_indicator.dart';
import 'package:weather_app_2/features/weather/widgets/current_forecast_widget.dart';
import 'package:weather_app_2/features/weather/widgets/common_widgets/error_text.dart';
import 'package:weather_app_2/features/weather/widgets/weekly_forecast_widget.dart';
import 'package:weather_app_2/repositories/models/weather_forecast_daily.dart';

class MainForecastView extends StatelessWidget {
  const MainForecastView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetWeatherBloc>(context, listen: false)
        .add(const GetWeatherByCoordEvent());
    return Scaffold(
      appBar: const AppBarMainView(),
      body: BlocBuilder<GetWeatherBloc, GetWeatherBlocState>(
        builder: (context, state) {
          if (state is GetWeatherBlocLoading) {
            return Container(
              decoration: backgroundWidget(),
              child: Center(
                child: customCircularIndicator(),
              ),
            );
          } else if (state is GetWeatherBlocLoaded) {
            final WeatherForecast weather = state.currentWeather;
            return Container(
              decoration: backgroundWidget(),
              child: Stack(
                children: [
                  Positioned(
                    top: 40,
                    left: 10,
                    right: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CurrentForecastWidget(
                          weather: weather,
                        ),
                        const SizedBox(height: 20),
                        WeeklyForecastWidget(
                          weather: weather,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (state is GetWeatherBlocError) {
            return showErrorText(state.errorMessage);
          }
          return const Center(
            child: Text('No weather data available'),
          );
        },
      ),
    );
  }
}
