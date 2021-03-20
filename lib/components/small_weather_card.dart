import 'package:flutter/material.dart';

import '../helpers/weather_api_helper.dart';

class SmallWeatherCard extends StatelessWidget {
  final iconCode;
  final String day;
  final temperature;

  SmallWeatherCard({this.iconCode, this.day, this.temperature});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 65,
      color: Colors.green,
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
          Image.network(getWeatherIconSmallRequest(iconCode)),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(bottom: 5),
              child: Text(
                "$temperature °C",
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: Theme.of(context).textTheme.bodyText2.fontSize),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
