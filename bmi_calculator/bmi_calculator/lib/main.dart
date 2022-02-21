// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'input_screen.dart';

void main() => runApp(BmiCalculator());

class BmiCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        primaryColor: Color(0xFF0A0E21),
        backgroundColor: Color(0xFF0A0E21),
      ),
      home: InputScreen(),
    );
  }
}
