import 'package:flutter/material.dart';
import 'package:quiz_app/screens/splash_screen/index.dart';
import 'package:quiz_app/widgets/gradiant_view.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: GradiantView(
        childView: SplashScreen(),
      ),
    ),
  ));
}
