import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int sound) {
    AudioCache().play('note$sound.wav');
  }

  Expanded soundKey({Color color, int sound}) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        onPressed: () {
          playSound(sound);
        },
        child: Container(
          color: color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              soundKey(color: Colors.red, sound: 1),
              soundKey(color: Colors.yellow, sound: 2),
              soundKey(color: Colors.orange, sound: 3),
              soundKey(color: Colors.green, sound: 4),
              soundKey(color: Colors.teal, sound: 5),
              soundKey(color: Colors.blue, sound: 6),
              soundKey(color: Colors.purple, sound: 7),
            ],
          ),
        ),
      ),
    );
  }
}
