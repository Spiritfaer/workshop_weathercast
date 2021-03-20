import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class AdditionalWeatherInfo extends StatelessWidget {
  final int pressure;
  final int humidity;

  AdditionalWeatherInfo({this.pressure, this.humidity});

  @override
  Widget build(BuildContext context) {
    TextStyle _styleDesc = TextStyle(
      fontSize: 24,
      color: Colors.white,
      fontWeight: FontWeight.w200,
    );

    return Container(
      height: 50,
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BoxedIcon(
                    WeatherIcons.humidity,
                    color: Colors.white,
                  ),
                  Text(
                    "$humidity %",
                    style: _styleDesc,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                BoxedIcon(
                  WeatherIcons.thermometer,
                  color: Colors.white,
                ),
                Text(
                  "$pressure hpa",
                  style: _styleDesc,
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
