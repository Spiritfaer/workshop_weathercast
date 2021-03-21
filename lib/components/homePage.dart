import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../helpers/weather.dart';
import '../components/searchForm.dart';
import '../components/weatherCard.dart';
import '../components/big_weather_card.dart';
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
  List<Map<String, dynamic>> _weatherList;

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
                WeatherBar(weatherMap: _weatherList),
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
      _getFutureWeather();
    });
  }

  _getCityAndWeather() async {
    List<Placemark> p = await _geolocator.placemarkFromCoordinates(
        _position.latitude, _position.longitude);
    Placemark place = p[0];

    var data = await _weatherFetch.getWeatherByCoord(
        _position.latitude, _position.longitude);
    updateCurrentWeatherData(data);

    setState(() {
      _city = place.locality;
    });
  }

  _getFutureWeather() async {
    var data = await _weatherFetch.getWeatherByCoordAllInOne(
        _position.latitude, _position.longitude);
    updateFutureWeatherData(data);
    setState(() {});
  }

  _changeCity(city) async {
    try {
      var data = await _weatherFetch.getWeatherByName(city);
      updateCurrentWeatherData(data);
      setState(() {
        _city = city;
      });
    } catch (ex) {
      print(ex);
    }
  }

  void updateCurrentWeatherData(weatherData) {
    setState(() {
      if (weatherData != null) {
        _temp = weatherData['main']['temp'].toInt();
        _icon = weatherData['weather'][0]['icon'];
        _desc = weatherData['main']['feels_like'].toString();

        _description = weatherData['weather'][0]['description'].toString();
        _pressure = weatherData['main']['pressure'].toInt();
        _humidity = weatherData['main']['humidity'].toInt();
      } else {
        _temp = 0;
        _city = "In the middle of nowhere";
        _icon = "04n";
      }
    });
  }

  void updateFutureWeatherData(weatherData) {
    if (weatherData == null) {
      print('weatherData == null');
      return;
    }

    setState(() {
      _weatherList = List.generate(
        5,
        (i) {
          return {
            'day': DateFormat.E()
                .format(DateTime(weatherData['daily'][i]['dt'].toInt())),
            'icon': weatherData['daily'][i]['weather'][0]['icon'].toString(),
            'temp': weatherData['daily'][i]['temp']['day'].toString(),
          };
        },
      );
    });
  }
}
