import 'dart:math';
import 'package:flutter/material.dart';

class CalculatorBrain {
  int height;
  int weight;
  CalculatorBrain({required this.height, required this.weight});

  late double _bmi;

  double bmiCalculator() {
    return _bmi = weight / pow(height / 100, 2);
  }

  List bmiResult() {
    if (_bmi >= 26.0) {
      return ['OVERWEIGHT', Colors.red];
    } else if (_bmi >= 18.5) {
      return ['HEALTHY', Colors.green];
    } else {
      return ['UNDERWEIGHT', Colors.red];
    }
  }

  String? bmiInterpretation() {
    if (bmiResult()[0] == 'HEALTHY') {
      return 'You are fit and fine';
    } else if (bmiResult()[0] == 'OVERWEIGHT') {
      return 'You need to eat less and workout more!';
    } else if (bmiResult()[0] == 'UNDERWEIGHT') {
      return 'You need to eat more and lift weights!';
    }
  }
}
