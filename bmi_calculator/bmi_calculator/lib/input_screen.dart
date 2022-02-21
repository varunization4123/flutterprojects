// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/icon_content.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:bmi_calculator/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'bottom_button.dart';

enum Gender { male, female }
const activeColor = Color(0xFF1D1E33);
const inactiveColor = Color(0xFF111328);

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  Gender? selectedGender;
  int height = 180;
  int weight = 65;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: const Text(
          'BMI Calculator',
          style: TextStyle(
            fontSize: 23.0,
          ),
        )),
        backgroundColor: Color(0xFF0A0E21),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    childCard: IconContent(
                      icon: Icons.male,
                      gender: 'MALE',
                    ),
                    colour: selectedGender == Gender.male
                        ? activeColor
                        : inactiveColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    childCard: IconContent(
                      icon: Icons.female,
                      gender: 'FEMALE',
                    ),
                    colour: selectedGender == Gender.female
                        ? activeColor
                        : inactiveColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: ReusableCard(
              onPress: () {},
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'HEIGHT',
                    style: TextStyle(
                      fontSize: 23,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'cm',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 100,
                    max: 200,
                    activeColor: Color(0xFFD00A54),
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  )
                ],
              ),
              colour: activeColor,
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                      onPress: () {},
                      childCard: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'WEIGHT',
                            style: TextStyle(
                              fontSize: 23,
                            ),
                          ),
                          Text(
                            weight.toString(),
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RoundIconButton(
                                changeValue: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                icon: Icons.remove,
                              ),
                              RoundIconButton(
                                changeValue: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                icon: Icons.add,
                              ),
                            ],
                          )
                        ],
                      ),
                      colour: activeColor),
                ),
                Expanded(
                  child: ReusableCard(
                      onPress: () {},
                      childCard: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'AGE',
                            style: TextStyle(
                              fontSize: 23,
                            ),
                          ),
                          Text(
                            age.toString(),
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RoundIconButton(
                                changeValue: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                icon: Icons.remove,
                              ),
                              RoundIconButton(
                                changeValue: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                icon: Icons.add,
                              ),
                            ],
                          )
                        ],
                      ),
                      colour: activeColor),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: BottomButton(
              onPress: () {
                var calc = CalculatorBrain(height: height, weight: weight);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultsPage(
                              bmi: calc.bmiCalculator().toStringAsFixed(1),
                              bmiResult: calc.bmiResult()[0],
                              bmiColor: calc.bmiResult()[1],
                              bmiInterpretation: calc.bmiInterpretation(),
                            )));
              },
              buttonText: 'CALCULATE',
            ),
          )
        ],
      ),
    );
  }
}
