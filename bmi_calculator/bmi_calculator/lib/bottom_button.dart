import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final Function()? onPress;
  final String buttonText;
  const BottomButton({this.onPress, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        color: Colors.pink,
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
