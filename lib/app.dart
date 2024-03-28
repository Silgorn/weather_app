import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_2/core/constants/constants.dart';
import 'package:weather_app_2/features/weather/bloc/get_weather_bloc.dart';
import 'package:weather_app_2/features/weather/view/main_forecast_view.dart';
import 'package:weather_app_2/repositories/weather_repository.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    return BlocProvider(
      create: (context) => GetWeatherBloc(WeatherRepository(dio: dio)),
      child: MaterialApp(
        title: Constants.appName,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MainForecastView(),
      ),
    );
  }
}
