// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  IconData icon;
  Function()? changeValue;
  RoundIconButton({required this.icon, required this.changeValue});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: changeValue,
      fillColor: const Color(0x15F0E5FD),
      child: Icon(icon),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      constraints: BoxConstraints(minWidth: 40, maxWidth: 80),
    );
  }
}
