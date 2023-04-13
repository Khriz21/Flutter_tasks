import 'package:flutter/material.dart';

class SigupProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String name ='';
  String lastName = '';
  DateTime birthdate = DateTime.now();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    if (formKey.currentState?.validate() ?? false) {}

    return formKey.currentState?.validate() ?? false;
  }
}