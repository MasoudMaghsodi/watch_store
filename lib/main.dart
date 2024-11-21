import 'package:flutter/material.dart';
import 'package:watch_store/components/themes.dart';
import 'package:watch_store/screens/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Watch Store",
      theme: lightTheme(),
      home: RegisterScreen(),
    );
  }
}
