import 'package:flutter/material.dart';
import 'package:dicoding_flutter_basic_submission_1/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travello - a traveling app',
      theme: ThemeData(useMaterial3: true, fontFamily: 'Poppins'),
      home: const HomeScreen(),
    );
  }
}
