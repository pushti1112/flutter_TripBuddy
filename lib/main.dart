import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/add_place_screen.dart';
import 'package:flutter_application_1/screens/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: AddPlaceScreen(),
        ),
      ),
    );
  }
}
