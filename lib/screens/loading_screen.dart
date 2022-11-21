// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:cloma/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:cloma/services/location.dart';
import 'package:cloma/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cloma/screens/location_screen.dart';

const appid = '765bf33a473f648b8465eb0635ba3975';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();
    Navigator.pushAndRemoveUntil<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => LocationScreen(weatherData),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpinKitDoubleBounce(
        color: Colors.white,
        size: 100.0,
      ),
    );
  }
}
