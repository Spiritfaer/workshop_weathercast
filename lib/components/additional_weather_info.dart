import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class AdditionalWeatherInfo extends StatelessWidget {
  final int pressure;
  final int humidity;

  AdditionalWeatherInfo({this.pressure, this.humidity});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
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
                    WeatherIcons.raindrops,
                    color: Colors.white,
                    size: 40,
                  ),
                  Text(
                    "$humidity %",
                    style: Theme.of(context).textTheme.bodyText2,
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
                Text("$pressure hpa",
                    style: Theme.of(context).textTheme.bodyText2),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
