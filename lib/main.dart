import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
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
        ChangeNotifierProvider(create: (_)=>LoginProvider()),
        ChangeNotifierProvider(create: (_)=>SigupProvider()),
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate
        ],
        supportedLocales: const [
           Locale('en'),
           Locale('fr'),
           Locale('es'),
         ],
        debugShowCheckedModeBanner: false,
        title: 'My Tasks',
        initialRoute: SigupScreen.routerName,
        routes: {
          HomeScreen.routerName:(_) => const HomeScreen(),
          LoginScreen.routerName:(_) => const LoginScreen(),
          SigupScreen.routerName: (_)=> const SigupScreen(),
        },
      ),
    );
  }
}