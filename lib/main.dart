import 'package:covid_19_tracking_app/view/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covoid -19 Tracking App',
      theme:
          ThemeData(primarySwatch: Colors.blue, brightness: Brightness.light),
      home: const SplashScreen(),
    );
  }
}
