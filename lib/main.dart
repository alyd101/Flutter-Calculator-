import 'package:flutter/material.dart';
import 'package:flutter_calculator_app/body.dart';
import 'package:flutter_calculator_app/provider/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => CalculatorProvider(),
        builder: (context, child) => const Body(),
      ),
    );
  }
}
