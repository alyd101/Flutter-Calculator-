import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_calculator_app/provider/provider.dart';

class DisplayCard extends StatelessWidget {
  DisplayCard({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    final provider = Provider.of<CalculatorProvider>(context);

    return Row(
      children: [
        Expanded(
            child: SizedBox(
          height: screenHeight * 0.2,
          child: Card(
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      provider.currentVal,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ))
      ],
    );
  }
}
