import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(BallChange());

class BallChange extends StatefulWidget {
  @override
  _BallChangeState createState() => _BallChangeState();
}

class _BallChangeState extends State<BallChange> {
  int number = 1;
  changeBall() {
    setState(() {
      number = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          title: Text('Ask me anything'),
        ),
        body: Container(
          color: Colors.blueAccent.shade100,
          child: Center(
            child: TextButton(
              onPressed: () {
                changeBall();
              },
              child: Image.asset('images/ball$number.png'),
            ),
          ),
        ),
      ),
    );
  }
}
