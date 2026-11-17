import 'package:flutter/material.dart';
import 'package:fit_track/features/auth/screens/auth_check_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FillTrack',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      ),
      home: const AuthCheckScreen(),
    );
  }
}
