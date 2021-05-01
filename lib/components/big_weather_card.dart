import 'package:flutter/material.dart';

import '../helpers/weather_api_helper.dart';

class BigWeatherCard extends StatelessWidget {
  final iconCode;
  final String weatherDes;
  final temperature;

  BigWeatherCard({this.iconCode, this.weatherDes, this.temperature});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.25),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 3,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ]),
        alignment: Alignment.bottomCenter,
        constraints: BoxConstraints(
          maxWidth: double.infinity,
          maxHeight: MediaQuery.of(context).size.height / 3,
        ),
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
      ),
    );
  }
}
