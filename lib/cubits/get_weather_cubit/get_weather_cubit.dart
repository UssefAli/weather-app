import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/today_weather.dart';
import '../../models/weather_service.dart';
import 'get_weather_state.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());
  TodayWeather? weatherdata;
  getCurrentWeather({required String cityName}) async {
    try {
      weatherdata = await WeatherService(Dio()).getWeather(city: cityName);
      emit(WeatherLoadedState(weatherdata: weatherdata!));
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
