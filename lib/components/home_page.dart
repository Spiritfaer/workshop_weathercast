import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../helpers/weather.dart';
import 'search_form.dart';
import 'weather_card.dart';
import 'big_weather_card.dart';
import 'additional_weather_info.dart';
import 'weather_bar.dart';
import 'my_bg_widget.dart';

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

  @override
  void initState() {
    _city;
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
          _city ?? "Weathercast",
          style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          MyBgWidget(),
          Column(
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
              SizedBox(
                height: 20,
              ),
              WeatherBar(weatherMap: _weatherList),
            ],
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: FloatingActionButton(
                onPressed: () {
                  _city = 'Refresh';
                  _getCurrent();
                },
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                shape: CircleBorder(
                    side: BorderSide(width: 2, color: Colors.white)),
                child: Icon(
                  Icons.location_city,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: FloatingActionButton(
                onPressed: () {
                  _city = 'Refresh';
                  _getCurrent();
                },
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                shape: CircleBorder(
                    side: BorderSide(width: 2, color: Colors.white)),
                child: Icon(
                  Icons.location_city,
                  color: Colors.white,
                ),
              ),
            ),
          ),
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
            'day': DateFormat.E().format(DateTime.fromMillisecondsSinceEpoch(
                weatherData['daily'][i + 1]['dt'].toInt() * 1000)),
            'icon':
                weatherData['daily'][i + 1]['weather'][0]['icon'].toString(),
            // 'temp': weatherData['daily'][i]['temp']['day'].toString(),
            'tempDay': double.parse(
                    weatherData['daily'][i + 1]['temp']['day'].toString())
                .round(),
            'tempNight': double.parse(
                    weatherData['daily'][i + 1]['temp']['night'].toString())
                .round()
          };
        },
      );
    });
  }
}
