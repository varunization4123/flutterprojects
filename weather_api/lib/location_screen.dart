// var name = jsonDecode(data)["name"];
// var temprature = jsonDecode(data)["main"]["temp"];
// var description = jsonDecode(data)["weather"][0]["description"];

// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names, avoid_print, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:weather_api/location_selector.dart';
import 'package:weather_api/network.dart';

const apiKey = '5e2bbcad8f0b25f29e809a0a311f244c';

class LocationScreen extends StatefulWidget {
  final weatherData;
  const LocationScreen({this.weatherData});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int? temprature;
  String? name;
  String? typedName;

  @override
  void initState() {
    super.initState();
    UpdateUI(widget.weatherData);
  }

  void UpdateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temprature = 0;
        name = '';
      }
      double temp = weatherData["main"]["temp"];
      temprature = temp.toInt();
      name = weatherData["name"];
    });
  }

  Future<dynamic> getCityWeather(String typedName) async {
    print('input: $typedName');
    NetworkHelper networkHelper = NetworkHelper(
        url:
            'http://api.openweathermap.org/data/2.5/weather?q=$typedName&appid=$apiKey&units=metric');
    dynamic weatherData = await networkHelper.getData();
    return weatherData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                TextButton.icon(
                  onPressed: () async {
                    var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LocationSelector()));
                    print(typedName);
                    if (typedName != null) {
                      var weatherData = await getCityWeather(typedName);
                      print(weatherData);
                      UpdateUI(weatherData);
                    }
                  },
                  icon: const Icon(
                    Icons.location_city,
                    color: Colors.grey,
                  ),
                  label: const Text(
                    'Choose Location',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                )
              ],
            ),
            Text(
              'It is $tempratureº celcius right now in $name',
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
