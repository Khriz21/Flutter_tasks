import 'package:flutter/material.dart';
import 'package:my_tasks/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Tasks',
      initialRoute: LoginScreen.routerName,
      routes: {
        HomeScreen.routerName:(_) => const HomeScreen(),
        LoginScreen.routerName:(_) => const LoginScreen(),
      },
    );
  }
}