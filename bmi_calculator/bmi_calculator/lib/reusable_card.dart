// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Widget childCard;
  final Color colour;
  final Function()? onPress;

  ReusableCard(
      {required this.childCard, required this.colour, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
        child: childCard,
      ),
    );
  }
}
