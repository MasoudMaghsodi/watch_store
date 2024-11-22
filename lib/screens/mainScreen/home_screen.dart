import 'package:flutter/material.dart';
import 'package:watch_store/widgets/app_slider.dart';
import 'package:watch_store/widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SearchBarBtn(
                onTap: () {},
              ),
              const AppSlider(),
            ],
          ),
        ),
      ),
    );
  }
}
