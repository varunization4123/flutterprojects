// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables
// ignore_for_file: use_key_in_widget_constructors
//API_key: 5e2bbcad8f0b25f29e809a0a311f244c
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_api/network.dart';
import 'location.dart';
import 'location_screen.dart';

const apiKey = '5e2bbcad8f0b25f29e809a0a311f244c';
// const url = 'http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  double? latitude;
  double? longitude;
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    LocationData location = LocationData();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    getWeatherData();
  }

  void getWeatherData() async {
    NetworkHelper networkHelper = NetworkHelper(
      url:
          'http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric',
    );

    dynamic weatherData = await networkHelper.getData();

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LocationScreen(
                  weatherData: weatherData,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: SpinKitDoubleBounce(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
