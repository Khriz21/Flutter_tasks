import 'package:flutter/material.dart';
import 'package:my_tasks/widgets/witgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routerName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(
        child: DatePicker(),
      ),
    );
  }
}