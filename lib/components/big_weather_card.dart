import 'package:flutter/material.dart';

import '../helpers/weather_api_helper.dart';

class BigWeatherCard extends StatelessWidget {
  final iconCode;
  final String weatherDes;
  final temperature;

  BigWeatherCard({this.iconCode, this.weatherDes, this.temperature});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      constraints: BoxConstraints(
        maxWidth: double.infinity,
        maxHeight: MediaQuery.of(context).size.height / 3,
      ),
      decoration: BoxDecoration(color: Colors.blue),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            top: -25,
            child: Image.network(getWeatherIconBigRequest(iconCode)),
          ),
          Positioned(
            bottom: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(3),
                  child: Text(
                    "${weatherDes[0].toUpperCase()}${weatherDes.substring(1)}",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: Text(
                    "$temperature °C",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
