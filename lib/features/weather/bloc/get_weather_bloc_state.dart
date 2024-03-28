part of 'get_weather_bloc.dart';

abstract class GetWeatherBlocState extends Equatable {
  const GetWeatherBlocState();

  @override
  List<Object> get props => [];
}

class GetWeatherBlocInitial extends GetWeatherBlocState {}

class GetWeatherBlocLoading extends GetWeatherBlocState {}

class GetWeatherBlocLoaded extends GetWeatherBlocState {
  final WeatherForecast currentWeather;

  const GetWeatherBlocLoaded({required this.currentWeather});

  @override
  List<Object> get props => [currentWeather];
}

class GetWeatherBlocError extends GetWeatherBlocState {
  final String errorMessage;

  const GetWeatherBlocError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
