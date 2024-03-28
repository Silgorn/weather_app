import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app_2/core/location/location.dart';

import 'package:weather_app_2/repositories/models/weather_forecast_daily.dart';

import '../../../repositories/abstract_weather_repository.dart';

part 'get_weather_bloc_event.dart';
part 'get_weather_bloc_state.dart';

class GetWeatherBloc extends Bloc<GetWeatherBlocEvent, GetWeatherBlocState> {
  final AbstractWeatherRepository weatherRepository;

  GetWeatherBloc(
    this.weatherRepository,
  ) : super(GetWeatherBlocInitial()) {
    on<GetWeatherByCityEvent>(_weatherByCityEvent);
    on<GetWeatherByCoordEvent>(_weatherByCoordEvent);
  }

  void _weatherByCityEvent(
      GetWeatherByCityEvent event, Emitter<GetWeatherBlocState> emit) async {
    try {
      emit(GetWeatherBlocLoading());
      final weatherByCity =
          await weatherRepository.getWeatherByCity(event.cityName);
      emit(GetWeatherBlocLoaded(currentWeather: weatherByCity));
    } catch (e) {
      emit(GetWeatherBlocError(errorMessage: e.toString()));
      print(e);
    }
  }

  void _weatherByCoordEvent(
      GetWeatherByCoordEvent event, Emitter<GetWeatherBlocState> emit) async {
    try {
      emit(GetWeatherBlocLoading());
      Location location = Location();
      await location.determinePosition();
      await location.getCurrentLocation();
      final weatherByCoord = await weatherRepository.getWeatherByCoord(
          location.longitude, location.latitude);
      emit(GetWeatherBlocLoaded(currentWeather: weatherByCoord));
    } catch (e) {
      emit(GetWeatherBlocError(errorMessage: e.toString()));
      print(e);
    }
  }
}
