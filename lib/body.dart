import 'package:flutter/material.dart';
import 'package:flutter_calculator_app/components/display_card.dart';
import 'package:flutter_calculator_app/provider/provider.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CalculatorProvider>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            DisplayCard(),
            Expanded(
              child: Row(
                children: provider.getWidgets(provider.buttonTexts[0]),
              ),
            ),
            Expanded(
              child: Row(
                children: provider.getWidgets(provider.buttonTexts[1]),
              ),
            ),
            Expanded(
              child: Row(
                children: provider.getWidgets(provider.buttonTexts[2]),
              ),
            ),
            Expanded(
              child: Row(
                children: provider.getWidgets(provider.buttonTexts[3]),
              ),
            ),
            Expanded(
              child: Row(
                children: provider.getWidgets(provider.buttonTexts[4]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
