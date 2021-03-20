import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import '../helpers/weather.dart';
import '../components/searchForm.dart';
import '../components/weatherCard.dart';

import '../components/big_weather_card.dart';
import '../components/small_weather_card.dart';
import '../components/additional_weather_info.dart';
import '../components/weather_bar.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final Geolocator _geolocator = Geolocator()..forceAndroidLocationManager;
  Position _position;
  String _city;
  String _icon;
  String _desc;
  String _description;
  int _pressure;
  int _humidity;
  int _temp;
  WeatherFetch _weatherFetch = WeatherFetch();

  final bool debug = true;

  @override
  void initState() {
    _city = "Empty";
    _temp = 0;
    _icon = "04n";
    _description = "empty";
    _pressure = 0;
    _humidity = 0;
    super.initState();
    _getCurrent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Weathercast",
          style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: debug
          ? Column(
              children: [
                BigWeatherCard(
                  iconCode: _icon,
                  temperature: _temp,
                  weatherDes: _description,
                ),
                AdditionalWeatherInfo(
                  pressure: _pressure,
                  humidity: _humidity,
                ),
                WeatherBar(),
              ],
            )
          : Column(
              children: [
                Search(_changeCity),
                Center(
                  child: Text(
                    "$_city",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                WeatherCard(title: _desc, temperature: _temp, iconCode: _icon)
              ],
            ),
    );
  }

  _getCurrent() {
    _geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _position = position;
      });
      _getCityAndWeather();
    });
  }

  _getCityAndWeather() async {
    List<Placemark> p = await _geolocator.placemarkFromCoordinates(
        _position.latitude, _position.longitude);
    Placemark place = p[0];
    // print(jsonEncode(place));

    var data = await _weatherFetch.getWeatherByCoord(
        _position.latitude, _position.longitude);
    updateData(data);

    setState(() {
      _city = place.locality;
    });
  }

  _changeCity(city) async {
    try {
      var data = await _weatherFetch.getWeatherByName(city);
      updateData(data);
      // print(data);
      setState(() {
        _city = city;
      });
    } catch (ex) {
      print(ex);
    }
  }

  /* Render data */
  void updateData(weatherData) {
    setState(() {
      if (weatherData != null) {
        // debugPrint(jsonEncode(weatherData));
        //{"temp":10.49,"feels_like":5.54,"temp_min":10,"temp_max":11,"pressure":1009,"humidity":61}
        _temp = weatherData['main']['temp'].toInt();
        _icon = weatherData['weather'][0]['icon'];
        _desc = weatherData['main']['feels_like'].toString();
        // _color = _getBackgroudColor(_temp);

        _description = weatherData['weather'][0]['description'].toString();
        _pressure = weatherData['main']['pressure'].toInt();
        _humidity = weatherData['main']['humidity'].toInt();
      } else {
        //TODO add wait animation
        _temp = 0;
        _city = "In the middle of nowhere";
        _icon = "04n";
      }
    });
  }
}
