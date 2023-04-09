import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration inputDecoration(
          {required String hinText, required String label, IconData? icon}) =>
      InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.deepPurple,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple, width: 2),
        ),
        hintText: hinText,
        labelText: label,
        labelStyle: const TextStyle(color: Colors.grey),
        prefixIcon: icon != null
            ? Icon(
                icon,
                color: Colors.deepPurple,
              )
            : null,
      );
}