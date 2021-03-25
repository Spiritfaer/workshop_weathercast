import 'package:flutter/material.dart';

import './small_weather_card.dart';

class WeatherBar extends StatelessWidget {
  final List<Map<String, dynamic>> weatherMap;
  final List<Map<String, dynamic>> demoWeatherMap = [
    {'day': 'SAT', 'icon': '04n', 'tempDay': '0', 'tempNight': '0'},
    {'day': 'SUN', 'icon': '04n', 'tempDay': '1', 'tempNight': '0'},
    {'day': 'MON', 'icon': '04n', 'tempDay': '2', 'tempNight': '0'},
    {'day': 'TUE', 'icon': '04n', 'tempDay': '4', 'tempNight': '0'},
    {'day': 'WED', 'icon': '04n', 'tempDay': '8', 'tempNight': '0'},
  ];

  WeatherBar({this.weatherMap});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: (weatherMap ?? demoWeatherMap)
            .map((e) => SmallWeatherCard(
                day: e['day'],
                iconCode: e['icon'],
                temperatureDay: e['tempDay'],
                temperatureNight: (e['tempNight'])))
            .toList());
  }
}
