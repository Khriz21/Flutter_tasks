import 'package:flutter/material.dart';
import 'package:my_tasks/providers/auth_provider.dart';
import 'package:provider/provider.dart';

import 'package:my_tasks/providers/providers.dart';
import 'package:my_tasks/screens/screens.dart';
import 'package:my_tasks/screens/sigup_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_)=> AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Tasks',
        initialRoute: LoginScreen.routerName,
        routes: {
          HomeScreen.routerName: (_) => const HomeScreen(),
          LoginScreen.routerName: (_) => const LoginScreen(),
          SigupScreen.routerName: (_) => const SigupScreen(),
        },
      ),
    );
  }
}
