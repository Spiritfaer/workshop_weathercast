import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './small_weather_card.dart';

class WeatherBar extends StatelessWidget {
  final List<Map<String, dynamic>> weatherMap;
  final List<Map<String, dynamic>> demoWeatherMap = [
    {'day': 'SAT', 'icon': '04n', 'temp': '0'},
    {'day': 'SUN', 'icon': '04n', 'temp': '1'},
    {'day': 'MON', 'icon': '04n', 'temp': '2'},
    {'day': 'TUE', 'icon': '04n', 'temp': '4'},
    {'day': 'WED', 'icon': '04n', 'temp': '8'},
  ];

  WeatherBar({this.weatherMap});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: (weatherMap ?? demoWeatherMap)
            .map((e) => SmallWeatherCard(
                day: e['day'], iconCode: e['icon'], temperature: e['temp']))
            .toList());
  }
}
