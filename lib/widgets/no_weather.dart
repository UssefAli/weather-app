import 'package:flutter/material.dart';

class NoWeather extends StatelessWidget {
  const NoWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'there is no weather 😔',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        Text(
          'Start searching now ',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ],
    );
  }
}
