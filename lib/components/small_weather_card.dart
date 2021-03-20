import 'package:flutter/material.dart';

import '../helpers/weather_api_helper.dart';

class SmallWeatherCard extends StatelessWidget {
  final iconCode;
  final String day;
  final temperature;

  SmallWeatherCard({this.iconCode, this.day, this.temperature});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(top: 0, child: Text("SAT")),
        Image.network(getWeatherIconMediumRequest(iconCode)),
        Positioned(bottom: 0, child: Text("30 °C")),
      ],
    );
  }
}
