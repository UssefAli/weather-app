import 'package:dio/dio.dart';
import 'package:weather_app/models/today_weather.dart';

class WeatherService {
  final Dio dio;
  WeatherService(this.dio);

  final String baseUrl =
      'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline';
  final String apiKey = 'NWGY7YC2WN2R3PKKPJMX2XV7V';
  Future<TodayWeather> getWeather({required String city}) async {
    try {
      Response response = await dio.get(
          'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/$city?unitGroup=metric&key=NWGY7YC2WN2R3PKKPJMX2XV7V&contentType=json');
      Map<String, dynamic> weatherData = response.data;
      TodayWeather todayWeather = TodayWeather.fromJson(weatherData);
      return todayWeather;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'oops there was an error ,try later'; //'response of e' belongs to DioExeption
      throw Exception(errorMessage);
      //return TodayWeather(statue: '', maxtemp: 0, mintemp: 0, avgtemp: 0);
    } catch (e) {
      throw Exception('there was an error');
    }
  }
}
