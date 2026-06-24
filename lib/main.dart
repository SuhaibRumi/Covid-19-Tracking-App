import 'package:covid_19_tracking_app/utils/assests.dart';
import 'package:covid_19_tracking_app/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'utils/color.dart';

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
      title: appTitle,
        theme: ThemeData(primaryColor: primaryColor, brightness: Brightness.light),
      home: const SplashScreen(),
    );
  }
}
