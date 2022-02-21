// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  final IconData? icon;
  final String gender;

  IconContent({this.icon, required this.gender});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 58.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          gender,
          style: TextStyle(fontSize: 18.0),
        ),
      ],
    );
  }
}
