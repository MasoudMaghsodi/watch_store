import 'package:flutter/material.dart';
import 'package:watch_store/components/themes.dart';
import 'package:watch_store/route/names.dart';
import 'package:watch_store/route/routes.dart';

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
      initialRoute: ScreenNames.root,
      routes: routes,
      theme: lightTheme(),
      // home: const CartScreen(),
    );
  }
}
