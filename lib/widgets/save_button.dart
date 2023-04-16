import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key, required this.submit, required this.text});

  final VoidCallback? submit;
  final String text;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      disabledColor: Colors.grey,
      elevation: 0,
      color: Colors.deepPurple,
      onPressed: submit,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 80,
          vertical: 15,
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
