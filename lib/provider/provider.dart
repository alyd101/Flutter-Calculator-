import 'package:flutter/material.dart';
import 'package:flutter_calculator_app/components/custom_button.dart';

class CalculatorProvider extends ChangeNotifier {
  String? previousVal;
  String currentVal = "0";
  String operator = "";
  bool wipeVal = true;
  double total = 0;

  List<List<String>> buttonTexts = [
    ["AC", "+/-", "%", "/"],
    ["7", "8", "9", "x"],
    ["4", "5", "6", "-"],
    ["1", "2", "3", "+"],
    ["0", ".", "="]
  ];

  List<Widget> getWidgets(List<String> list) {
    List<Widget> widgets = [];

    for (int i = 0; i < list.length; i++) {
      widgets.add(
        Expanded(
          child: CustomButton(
            text: list[i],
            onTap: () {
              updateText(list[i]);
            },
          ),
        ),
      );
    }
    return widgets;
  }

  updateText(String btnText) {
    switch (btnText) {
      case "AC":
        reset();
        break;
      case '+/-':
        currentVal = double.parse(currentVal) < 0
            ? double.parse(currentVal).abs().toString()
            : (-double.parse(currentVal)).toString();
        break;
      case "/":
      case "x":
      case "-":
      case "+":
      case "%":
        if (previousVal != null && operator.isNotEmpty) {
          calculate(operator);
        }
        operator = btnText;
        previousVal = currentVal;
        wipeVal = true;
        break;
      case "=":
        previousVal ??= currentVal;
        calculate(operator);
        break;
      case ".":
        currentVal = currentVal.contains('.') ? currentVal : '$currentVal.';
        wipeVal = false;
        break;
      default:
        addVal(btnText);
    }
    notifyListeners();
  }

  addVal(String num) {
    if (wipeVal || (currentVal == '0')) {
      currentVal = num;
      wipeVal = false;
    } else {
      currentVal += num;
    }
  }

  calculate(String operation) {
    var num2 = double.parse(currentVal);
    var num1 = double.parse(previousVal!);

    switch (operation) {
      case '+':
        total = num1 + num2;
        break;
      case '-':
        total = num1 - num2;
        break;
      case 'x':
        total = num1 * num2;
        break;
      case '/':
        total = num1 / num2;
        break;
      case '%':
        total = num1 % num2;
        break;
    }
    currentVal = total.toString();
  }

  reset() {
    currentVal = "0";
    previousVal = null;
    operator = "";
    wipeVal = true;
    total = 0;
  }
}
