import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:weather_app/models/today_weather.dart';
//import 'package:weather_app/models/weather_service.dart';
//import 'package:dio/dio.dart';

class Weather extends StatelessWidget {
  const Weather({
    super.key,
    required this.weatherdata,
  });
  final TodayWeather weatherdata;
  @override
  Widget build(BuildContext context) {
    //BlocProvider.of<GetWeatherCubit>(context).weatherdata;   you access the data like this
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          getColorForData(weatherdata.statue),
          //getColorForData(weatherdata.statue),
          Colors.white,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weatherdata.city,
            style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Spacer(
                  flex: 1,
                ),
                ImageSelector(statue: weatherdata.statue),
                const Spacer(
                  flex: 2,
                ),
                Text(
                  '${weatherdata.avgtemp.round()}',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
                Column(
                  children: [
                    Text(
                      'max temp ${weatherdata.maxtemp.round()}',
                      style: const TextStyle(fontSize: 15),
                    ),
                    Text(
                      'min temp ${weatherdata.mintemp.round()}',
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Text(
            weatherdata.statue,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class ImageSelector extends StatelessWidget {
  const ImageSelector({super.key, required this.statue});
  final String statue;
  @override
  Widget build(BuildContext context) {
    if (statue.contains("Snow")) {
      return Image.asset('assets/images/snow.png');
    } else if (statue.contains("Sunny") || statue.contains("Clear")) {
      return Image.asset('assets/images/clear.png');
    } else if (statue.contains("Rain")) {
      return Image.asset('assets/images/rainy.png');
    } else if (statue.contains("cloudy")) {
      return Image.asset('assets/images/cloudy.png');
    } else if (statue.contains("Thunder") || statue.contains("Storm")) {
      return Image.asset('assets/images/thunderstorm.png');
    } else {
      return Image.asset('assets/images/cloudy.png');
    }
  }
}

MaterialColor getColorForData(String? data) {
  // Remove leading and trailing whitespaces
  if (data == null) {
    return Colors.blue;
  }
  if (data.contains('Snow')) {
    return Colors.lightBlue;
  } else if (data.contains('Rain')) {
    return Colors.blueGrey;
  } else if (data == 'Clear') {
    return Colors.orange;
  } else if (data.contains('cloudy')) {
    return Colors.grey;
  } else {
    return Colors.blue;
  }
}
