import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import '../helpers/weather.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final Geolocator _geolocator = Geolocator()..forceAndroidLocationManager;
  Position _position;
  String _city;

  @override
  void initState() {
    _city = "Empty";
    super.initState();
    _getCurrent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weathercast"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("$_city"),
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
    print(jsonEncode(place));
    setState(() {
      _city = place.locality;
    });
  }
}
