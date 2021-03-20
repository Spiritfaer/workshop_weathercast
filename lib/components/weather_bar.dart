import 'package:flutter/material.dart';

import './small_weather_card.dart';
import '../helpers/weather_api_helper.dart';

class WeatherBar extends StatelessWidget {
  // final Map<String, dynamic> weatherMap;
  final List<Map<String, dynamic>> demoWeatherMap = [
    {'day': 'SAT', 'icon': '04n', 'temp': '0'},
    {'day': 'SUN', 'icon': '04n', 'temp': '1'},
    {'day': 'MON', 'icon': '04n', 'temp': '2'},
    {'day': 'TUE', 'icon': '04n', 'temp': '4'},
    {'day': 'WED', 'icon': '04n', 'temp': '8'},
  ];

  // WeatherBar({this.weatherMap});
  WeatherBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: demoWeatherMap
          .map((e) => SmallWeatherCard(
              day: e['day'], iconCode: e['icon'], temperature: e['temp']))
          .toList(),
    );
  }
}
