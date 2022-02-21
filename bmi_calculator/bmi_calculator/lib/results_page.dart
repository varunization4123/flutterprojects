import 'package:bmi_calculator/bottom_button.dart';
import 'package:bmi_calculator/input_screen.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final String bmi;
  final String? bmiResult;
  final String? bmiInterpretation;
  Color bmiColor;

  ResultsPage({
    required this.bmi,
    required this.bmiResult,
    required this.bmiInterpretation,
    required this.bmiColor,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Center(
        //     child: Text(
        //       'BMI Calculator',
        //       style: TextStyle(
        //         fontSize: 23.0,
        //       ),
        //     ),
        //   ),
        //   backgroundColor: const Color(0xFF0A0E21),
        // ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'YOUR RESULT',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: ReusableCard(
                childCard: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        bmiResult!,
                        style: TextStyle(fontSize: 36, color: bmiColor),
                      ),
                      Text(
                        bmi,
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        bmiInterpretation!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
                colour: activeColor,
                onPress: () {},
              ),
            ),
            Expanded(
              child: BottomButton(
                buttonText: 'RE-CALCULATE',
                onPress: () {
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
