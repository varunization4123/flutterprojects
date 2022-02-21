import 'package:flutter/material.dart';

class LocationSelector extends StatefulWidget {
  const LocationSelector({Key? key}) : super(key: key);

  @override
  _LocationSelectorState createState() => _LocationSelectorState();
}

class _LocationSelectorState extends State<LocationSelector> {
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 40.0,
              ),
              label: const Text('',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  )),
            ),
            Container(
              padding: const EdgeInsets.all(30),
              child: TextField(
                cursorWidth: 20,
                showCursor: false,
                cursorColor: null,
                onChanged: (value) {
                  cityName = value;
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  label: const Text('Enter Location Here'),
                  labelStyle: const TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, cityName);
                  },
                  child: const Text(
                    'Get Weather',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
