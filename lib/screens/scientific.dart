import 'package:flutter/material.dart';
import '../ui_elements/button.dart';
import 'dart:math';

class ScientificCalculator extends StatefulWidget {
  const ScientificCalculator({Key? key}) : super(key: key);

  @override
  State<ScientificCalculator> createState() => _ScientificCalculatorState();
}

class _ScientificCalculatorState extends State<ScientificCalculator> {
  String display = '0';
  double num1 = 0.0;
  double num2 = 0.0;
  String operation = '';
  double answer = 0.0;
  bool isSinOperation = false;
  bool isCosOperation = false;
  bool isTanOperation = false;
  bool isArcSin = false;
  bool isArcCos = false;
  bool isArcTan = false;
  bool isFactorial = false;
  String value = '';
  String currentOperation = '';

  void calculateSin() {
    if (isSinOperation){
      final number = double.parse(display.substring(4));
      final result = sin(number);
      setState(() {
        display = result.toString();
        num1 = result;
        num2 = 0.0;
        operation = '';
        answer = result;
        isSinOperation = false;
      });
    }
  }

  void calculateCos() {
    if (isCosOperation){
      final number = double.parse(display.substring(4));
      final result = cos(number);
      setState(() {
        display = result.toString();
        num1 = result;
        num2 = 0.0;
        operation = '';
        answer = result;
        isCosOperation = false;
      });
    }
  }

  void calculateTan() {
    if (isCosOperation){
      final number = double.parse(display.substring(4));
      final result = tan(number);
      setState(() {
        display = result.toString();
        num1 = result;
        num2 = 0.0;
        operation = '';
        answer = result;
        isTanOperation = false;
      });
    }
  }

  double calculateArcSin(double value){
    return asin(value);
  }

  double calculateArcCos(double value){
    return acos(value);
  }

  double calculateArcTan(double value){
    return atan(value);
  }

  double calculateFactorial(double value){
    if (value is int){
      if (value == 0 || value == 1){
        return 1;
      } else {
        return value * calculateFactorial(value - 1);
      }
    } else {
      return 0;
    }
  }

  void clear() {
    setState(() {
      display = '0';
      num1 = 0.0;
      num2 = 0.0;
      operation = '';
      answer = 0.0;
    });
  }

  void handleClick(String input) {
    if (input == 'sin') {
      isSinOperation = true;
      display ='sin(';
    } else if (input == 'cos') {
      isCosOperation = true;
      display = 'cos(';
    } else if (input =='tan'){
      isTanOperation = true;
      display = 'tan(';
    } else if (input == 'asin'){
      currentOperation = 'asin';
    } else if (input == 'acos'){
      currentOperation = 'acos';
    } else if (input == 'atan'){
      currentOperation = 'atan';
    } else if (input == '!'){
      currentOperation = 'factorial';
    } else if (RegExp(r'[+\-*/0]').hasMatch(input)) {
      handleOperation(input);
    } else if (input == 'C') {
      clear();
    } else if (input == '=') {
      if (isSinOperation) {
        calculateSin();
      } else if (isCosOperation) {
        calculateCos();
      } else if (isTanOperation) {
        calculateTan();
      } else if (currentOperation == 'asin' && display.isNotEmpty) {
        double value = double.parse(display);
        double asinValue = calculateArcSin(value);
        setState(() {
          display = asinValue.toString();
          currentOperation = '';
        });
      } else if (currentOperation == 'acos' && display.isNotEmpty) {
        double value = double.parse(display);
        double acosValue = calculateArcCos(value);
        setState(() {
          display = acosValue.toString();
          currentOperation = '';
        });
      } else if (currentOperation == 'atan' && display.isNotEmpty) {
        double value = double.parse(display);
        double atanValue = calculateArcTan(value);
        setState(() {
          display = atanValue.toString();
          currentOperation = '';
        });
      } else if (currentOperation == 'factorial' && display.isNotEmpty) {
        double value = double.parse(display);
        double factorialValue = calculateFactorial(value);
        setState(() {
          display = factorialValue.toString();
          currentOperation = '';
        });
      } else {
        calculate();
      }
    } else {
      handleInput(input);
    }
  }




  void handleInput(String input) {
    setState(() {
      if (answer != 0 || RegExp(r'[+\-*/0]').hasMatch(display)) {
        if (isSinOperation || isCosOperation || isTanOperation || isArcSin || isArcCos || isArcTan || isFactorial) {
          value = input;
          display += input;
        } else {
          display = input;
        }
        answer = 0;
      } else {
        display += input;
      }

      if (operation.isNotEmpty) {
        num2 = double.parse(display);
      }
    });
  }


  void handleOperation(String op) {
    setState(() {
      if (num1 == 0.0) {
        num1 = double.parse(display);
      }
      operation = op;
      display = op.toString();
    });
  }

  void calculate() {
    double result = 0.0;

    if (num1 != 0.0 && num2 != 0.0 && operation.isNotEmpty) {
      switch (operation) {
        case '+':
          result = num1 + num2;
          break;
        case '-':
          result = num1 - num2;
          break;
        case '*':
          result = num1 * num2;
          break;
        case '/':
          if (num2 != 0) {
            result = num1 / num2;
          } else {
            result = double.infinity;
          }
          break;
      }
      setState(() {
        display = result.toString();
        num1 = result;
        num2 = 0.0;
        operation = '';
        answer = result;
      });
    }
  }

  final List buttons = [
    'C', '/','sin', 'cos', 'tan', '7', '8', '9', 'asin', 'acos', '4', '5', '6', 'atan', '*', ' 1', '2', '3', '/', '+','0','!', '.', '-', '=', '','','','',''
  ];

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        Container(
          height: height / 4,
          alignment: Alignment.bottomRight,
          padding: EdgeInsets.all(16.0),
          child: Text(
            display,
            style: TextStyle(fontSize: 36),
          ),
        ),
        Expanded(
          child: GridView.builder(
            itemCount: buttons.length,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              childAspectRatio:
                  (width / height * 2),
            ),
            itemBuilder: (context, index) {
              return MyButton(
                text: buttons[index],
                buttonColor: Colors.deepPurple[100],
                textColor: Colors.black,
                function: () {
                  handleClick(buttons[index]);
                },
              );
            }
          )
        )
      ],
    );
  }
}