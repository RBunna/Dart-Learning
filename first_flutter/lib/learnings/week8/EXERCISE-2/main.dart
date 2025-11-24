import 'package:first_flutter/learnings/week8/EXERCISE-2/ui/screens/temperature_screen.dart';
import 'package:flutter/material.dart';

import 'ui/screens/welcome_screen.dart';

enum DisplayScreen { home, temperature }

class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() {
    return _TemperatureAppState();
  }
}

class _TemperatureAppState extends State<TemperatureApp> {
  DisplayScreen displayScreen = DisplayScreen.home;

  Widget get display => switch (displayScreen) {
    DisplayScreen.home => WelcomeScreen(nextScreen: changeDisplay,),
    DisplayScreen.temperature => TemperatureScreen(),
  };

  void changeDisplay() => setState(() {
    displayScreen = DisplayScreen.temperature;
  });
  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff16C062), Color(0xff00BCDC)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: display,
        ),
      ),
    );
  }
}

class Week8Ex2 {
  void main() {
    runApp(const TemperatureApp());
  }
}
