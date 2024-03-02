import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // foregroundColor: Colors.white,
          // backgroundColor: Colors.blue,
          title: const Text('Search City'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: TextField(
              onSubmitted: (value) async {
                var getWeatherdata = BlocProvider.of<GetWeatherCubit>(context);
                getWeatherdata.getCurrentWeather(cityName: value);
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                hintText: 'Enter the city',
                labelText: 'Search',
                suffixIcon: const Icon(Icons.search),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
