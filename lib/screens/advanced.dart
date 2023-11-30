import 'package:flutter/material.dart';
import '../ui_elements/button.dart';
import 'dart:math';

class AdvancedCalculator extends StatefulWidget {
  const AdvancedCalculator({Key? key, required this.buttonColor})
      : super(key: key);

  final Color buttonColor;

  @override
  State<AdvancedCalculator> createState() => _AdvancedCalculator();
}

class _AdvancedCalculator extends State<AdvancedCalculator> {
  String display = '0';
  double num1 = 0.0;
  double num2 = 0.0;
  String operation = '';
  double answer = 0.0;
  double logBase = 10.0;
  bool isLogOperation = false;
  bool isCubedRoot = false;
  static const double phi = 1.618033988749895; //golden ratio

  void delete() {
    setState(() {
      if (display.isNotEmpty) {
        // Check if the last character is a digit before deleting
        if (RegExp(r'\d').hasMatch(display[display.length - 1])) {
          display = display.substring(0, display.length - 1);
        }

        if (display.isEmpty) {
          display = '0';
        }
      } else if (operation.isNotEmpty) {
        // If operation is deleted, go back to the previous number (num1 or num2)
        if (num2 != 0.0) {
          // If num2 has a value, restore it when deleting
          display = num2.toString();
          num2 = 0.0; // Reset num2 after restoring it
        } else {
          // If num2 is not set, restore num1
          display = num1.toString();
          num1 = 0.0; // Reset num1 after restoring it
        }
        operation = '';
      }

      // Update num2 based on the updated display value
      if (operation.isNotEmpty && !RegExp(r'^[+\-*/0]+$').hasMatch(display)) {
        num2 = double.parse(display);
      }
    });
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

  void calculateLog() {
    if (isLogOperation) {
      final number = double.parse(display.substring(4));
      final result = log(number) / log(logBase);
      setState(() {
        display = result.toString();
        num1 = result;
        num2 = 0.0;
        operation = '';
        answer = result;
        isLogOperation = false;
      });
    }
  }

  void handleNegation() {
    if (display != '0') {
      setState(() {
        if (display[0] == '-') {
          display = display.substring(1);
        } else {
          display = '-$display';
        }
      });
    }
  }

  void calculateLn() {
    final number = double.parse(display);
    final result = log(number);
    setState(() {
      display = result.toString();
      num1 = result;
      num2 = 0.0;
      operation = '';
      answer = result;
    });
  }

  void calculateExp() {
    // calculate exponential calculations
    final number = double.parse(display);
    final result = exp(number);
    setState(() {
      display = result.toString();
      num1 = result;
      num2 = 0.0;
      operation = '';
      answer = result;
    });
  }

  void handleAbsoluteValue() {
    double number = double.parse(display);
    double result = number.abs();

    setState(() {
      display = '|$number| = $result';
      answer = result;
      num1 = result;
    });
  }

  void calculateLn2() {
    const result = ln2;
    setState(() {
      display = result.toString();
      num1 = result;
      num2 = 0.0;
      operation = '';
      answer = result;
    });
  }

  void calculateCubed() {
    double number = double.parse(display);
    final result = pow(number, 3);
    setState(() {
      display = '$number³ = $result';
      num1 = result.toDouble();
      num2 = 0.0;
      answer = result.toDouble();
    });
  }

  void calculateSquareRoot1_2() {
    const result = sqrt1_2;
    setState(() {
      display = result.toString();
      num1 = result;
      num2 = 0.0;
      operation = '';
      answer = result;
    });
  }

  void calculateCubedRoot() {
    if (isCubedRoot) {
      final numberString = display.substring(1);
      if (numberString.isNotEmpty && !numberString.contains(',')) {
        final number = double.parse(numberString.replaceAll(',', ''));
        final result = pow(number, 1 / 3);
        final formattedResult = result.toStringAsFixed(16);
        setState(() {
          display = '\u221B($numberString) = $formattedResult';
          num1 = result.toDouble();
          num2 = 0.0;
          operation = '';
          answer = result.toDouble();
          isCubedRoot = false;
        });
      }
    }
  }

  void handleClick(String input) {
    if (input == 'log') {
      isLogOperation = true;
      setState(() {
        display = 'log(';
      });
    } else if (input == '±') {
      handleNegation();
    } else if (input == 'ln') {
      calculateLn();
    } else if (input == 'exp') {
      calculateExp();
    } else if (input == '|x|') {
      handleAbsoluteValue();
    } else if (input == 'x³') {
      calculateCubed();
    } else if (input == 'ln2') {
      calculateLn2();
    } else if (input == 'sqrt(1/2)') {
      calculateSquareRoot1_2();
    } else if (input == '\u221B') {
      setState(() {
        isCubedRoot = true;
        display = '\u221B';
      });
      calculateCubedRoot();
    } else if (RegExp(r'[+\-*/]').hasMatch(input)) {
      handleOperation(input);
    } else if (input == 'C') {
      clear();
    } else if (input == 'D') {
      delete();
    } else if (input == '=') {
      if (isLogOperation) {
        calculateLog();
      } else if (isCubedRoot) {
        calculateCubedRoot();
      } else {
        calculate();
      }
    } else {
      handleInput(input);
    }
  }

  void handleInput(String input) {
    setState(() {
      if (answer != 0 || RegExp(r'^[+\-*/0]+$').hasMatch(display)) {
        if (input == 'pi') {
          display = pi.toString();
        } else if (input == 'e') {
          display = e.toString();
        } else if (input == '\u03C6') {
          display = phi.toString();
        } else if (isLogOperation) {
          display += input;
        } else {
          display = input;
        }
        answer = 0;
      } else {
        if (input == 'pi') {
          display += pi.toString();
        } else if (input == 'e') {
          display += e.toString();
        } else {
          display += input;
        }
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
    'C',
    'D',
    'e',
    'pi',
    '±',
    'sqrt(1/2)',
    'log',
    '|x|',
    'x³',
    '/',
    'exp',
    '7',
    '8',
    '9',
    '*',
    '\u03C6',
    '4',
    '5',
    '6',
    '+',
    '\u221B', //cubed root
    '1',
    '2',
    '3',
    '-',
    'ln2',
    'ln',
    '0',
    '.',
    '='
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
          padding: const EdgeInsets.all(16.0),
          child: Text(
            display,
            style: const TextStyle(fontSize: 36),
          ),
        ),
        Expanded(
            child: GridView.builder(
                itemCount: buttons.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  childAspectRatio: (width / height * 2),
                ),
                itemBuilder: (context, index) {
                  return MyButton(
                    text: buttons[index],
                    buttonColor: widget.buttonColor,
                    textColor: Colors.black,
                    function: () {
                      handleClick(buttons[index]);
                    },
                  );
                }))
      ],
    );
  }
}
