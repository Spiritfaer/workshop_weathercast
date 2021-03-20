import 'package:flutter/material.dart';

class BigWeatherCard extends StatelessWidget {
  final iconCode;
  final String weatherDes;
  final temperature;

  BigWeatherCard({this.iconCode, this.weatherDes, this.temperature});

  @override
  Widget build(BuildContext context) {
    final String image =
        "http://openweathermap.org/img/wn/${this.iconCode}@4x.png";
    TextStyle _styleDesc = TextStyle(
      fontSize: 24,
      color: Colors.white,
      fontWeight: FontWeight.w200,
    );
    TextStyle _styleTemp = TextStyle(
      fontSize: 36,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );

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
            child: Image.network(image),
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
                    style: _styleDesc,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: Text(
                    "$temperature °C",
                    style: _styleTemp,
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
