import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

showAlert(BuildContext context, String title, String subtitle) {
  return Platform.isAndroid
      ? showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text(title),
            content: Text(subtitle),
            actions: [
              MaterialButton(
                onPressed: () => Navigator.pop(context),
                elevation: 5,
                textColor: Colors.blue,
                child: const Text('Ok'),
              ),
            ],
          ),
        )
      : showCupertinoDialog(
          context: context,
          builder: (_) => CupertinoAlertDialog(
            title: Text(title),
            content: Text(subtitle),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () => Navigator.pop(context),
                child: const Text('Ok'),
              )
            ],
          ),
        );
}
