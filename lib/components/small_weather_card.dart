import 'package:flutter/material.dart';
import '../helpers/weather_api_helper.dart';

class SmallWeatherCard extends StatelessWidget {
  final iconCode;
  final String day;
  final temperatureDay;
  final temperatureNight;

  SmallWeatherCard(
      {this.iconCode, this.day, this.temperatureDay, this.temperatureNight});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      width: 65,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              top: 0,
              child: Container(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  day,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              )),
          Align(
              alignment: Alignment(0.0, -0.5),
              child: Image.network(getWeatherIconSmallRequest(iconCode))),
          Positioned(
              bottom: 0,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      "$temperatureDay °C",
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize:
                              Theme.of(context).textTheme.bodyText2.fontSize),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      "$temperatureNight °C",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
