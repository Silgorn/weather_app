part of 'get_weather_bloc.dart';

abstract class GetWeatherBlocEvent extends Equatable {
  const GetWeatherBlocEvent();

  @override
  List<Object> get props => [];
}

class GetWeatherByCityEvent extends GetWeatherBlocEvent {
  final String cityName;

  const GetWeatherByCityEvent(this.cityName);

  @override
  List<Object> get props => [cityName];
}

class GetWeatherByCoordEvent extends GetWeatherBlocEvent {
  const GetWeatherByCoordEvent();

  @override
  List<Object> get props => [];
}
