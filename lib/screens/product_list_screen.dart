import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          height: double.infinity,
          width: double.infinity,
          child: const Center(
            child: Text(
              "ProductListScreen",
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }
}
