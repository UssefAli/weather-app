import 'package:weather_app/models/today_weather.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final TodayWeather weatherdata;

  WeatherLoadedState({required this.weatherdata});
}

class WeatherFailureState extends WeatherState {}
