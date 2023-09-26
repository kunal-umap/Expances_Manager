import 'package:flutter/material.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
          titleSmall: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        useMaterial3: true,
      ),
    );
  }
}



/*
----------------------------
* Main Size
* App Title 32
* hedings 22
* Sub Text 16
* lowest 12
*---------------------------
* font : normal : Alegreya
*font : Heading : Rubik
*--------------------------
App Bar theam
colour : Black
Font Size : 32
* */