import 'package:flutter/material.dart';
import '../ui_elements/button.dart';
import 'dart:math';

class ScientificCalculator extends StatefulWidget {
  const ScientificCalculator({Key? key}) : super(key: key);

  @override
  State<ScientificCalculator> createState() => _ScientificCalculatorState();
}

enum AngleMode { radians, degrees }

class _ScientificCalculatorState extends State<ScientificCalculator> {
  AngleMode currentMode = AngleMode.radians;
  String display = '0';
  double num1 = 0.0;
  double num2 = 0.0;
  String operation = '';
  double answer = 0.0;
  bool isSinOperation = false;
  bool isCosOperation = false;
  bool isTanOperation = false;
  bool isArcSinOperation = false;
  bool isArcCosOperation = false;
  bool isArcTanOperation = false;
  bool isFactorial = false;
  bool isExponent = false;
  bool isSquareRoot = false;
  bool isReciprocal = false;
  bool isSquared = false;
  bool isMod = false;
  bool isNthRoot = false;
  String value = '';

  void calculateSin() {
    if (isSinOperation) {
      final number = currentMode == AngleMode.radians
          ? double.parse(display.substring(4))
          : (double.parse(display.substring(4)) *
              (pi / 180)); // Convert degrees to radians
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
    if (isCosOperation) {
      final number = currentMode == AngleMode.radians
          ? double.parse(display.substring(4))
          : (double.parse(display.substring(4)) *
              (pi / 180)); // Convert degrees to radians
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
    if (isTanOperation) {
      final number = currentMode == AngleMode.radians
          ? double.parse(display.substring(4))
          : (double.parse(display.substring(4)) *
              (pi / 180)); // Convert degrees to radians
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

  void calculateArcSin() {
    if (isArcSinOperation) {
      final number = currentMode == AngleMode.radians
          ? double.parse(display.substring(5))
          : (double.parse(display.substring(5)) *
              (pi / 180)); // Convert degrees to radians
      final result = asin(number);
      setState(() {
        display = result.toString();
        num1 = result;
        num2 = 0.0;
        operation = '';
        answer = result;
        isArcSinOperation = false;
      });
    }
  }

  void calculateArcCos() {
    if (isArcCosOperation) {
      final number = currentMode == AngleMode.radians
          ? double.parse(display.substring(5))
          : (double.parse(display.substring(5)) *
              (pi / 180)); // Convert degrees to radians
      final result = acos(number);
      setState(() {
        display = result.toString();
        num1 = result;
        num2 = 0.0;
        operation = '';
        answer = result;
        isArcCosOperation = false;
      });
    }
  }

  void calculateArcTan() {
    if (isArcTanOperation) {
      final number = currentMode == AngleMode.radians
          ? double.parse(display.substring(5))
          : (double.parse(display.substring(5)) *
              (pi / 180)); // Convert degrees to radians
      final result = atan(number);
      setState(() {
        display = result.toString();
        num1 = result;
        num2 = 0.0;
        operation = '';
        answer = result;
        isArcTanOperation = false;
      });
    }
  }

  void calculateSquareRoot() {
    if (isSquareRoot) {
      final number = double.parse(display.substring(1));
      final result = sqrt(number);
      setState(() {
        display = result.toString();
        num1 = result;
        num2 = 0.0;
        operation = '';
        answer = result;
        isSquareRoot = false;
      });
    }
  }

  double calculateFactorial(double value) {
    if (value is int) {
      if (value == 0 || value == 1) {
        return 1;
      } else {
        return value * calculateFactorial(value - 1);
      }
    } else {
      return 0;
    }
  }

  double calculateExponent(double value, double exponent) {
    if (value is int && exponent is int) {
      return pow(value, exponent).toDouble();
    } else {
      return 0;
    }
  }

  double calculateMod(double number1, double number2) {
    if (isMod) {
      isMod = false;
      return number1 % number2;
    }
    isMod = false;
    return 0.0;
  }

  void calculateReciprocal() {
    if (num1 == 0.0 && num2 == 0.0 && display.isNotEmpty) {
      final number = double.parse(display.substring(3));
      if (number != 0) {
        final result = 1 / number;
        setState(() {
          display = result.toString();
          num1 = result;
          num2 = 0.0;
          operation = '';
          answer = result;
        });
      } else {
        setState(() {
          display = 'Error';
        });
      }
    }
  }

  double calculateSquared(double number) {
    final result = pow(number, 2);
    setState(() {
      display = result.toString();
      num1 = result.toDouble();
      num2 = 0.0;
      answer = result.toDouble();
    });
    return result.toDouble();
  }

  void calculateNthRoot() {
    final parts = display.split('\u{221A}');
    final number = double.parse(parts[0]);
    final root = double.parse(parts[1]);
    final result = nthRoot(number, root);
    setState(() {
      display = result.toString();
      num1 = result;
      num2 = 0.0;
      answer = result;
    });
  }

  double nthRoot(double number, double root) {
    return pow(number, 1 / root).toDouble();
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
      display = 'sin(';
    } else if (input == 'cos') {
      isCosOperation = true;
      display = 'cos(';
    } else if (input == 'tan') {
      isTanOperation = true;
      display = 'tan(';
    } else if (input == 'asin') {
      isArcSinOperation = true;
      display = 'asin(';
    } else if (input == 'acos') {
      isArcCosOperation = true;
      display = 'acos(';
    } else if (input == 'atan') {
      isArcTanOperation = true;
      display = 'atan(';
    } else if (input == '!') {
      isFactorial = true;
      setState(() {
        display += '!';
      });
    } else if (input == '^') {
      isExponent = true;
      setState(() {
        display += '^';
      });
    } else if (input == '\u{221A}') {
      isSquareRoot = true;
      display = '\u{221A}';
    } else if (input == '%') {
      display += '%';
      isMod = true;
    } else if (input == '1/x') {
      display = '1/(';
      isReciprocal = true;
    } else if (input == '^2') {
      isSquared = true;
      setState(() {
        display += '^2';
      });
    } else if (input == 'x\u{221A}y') {
      isNthRoot = true;
      setState(() {
        display += '\u{221A}';
      });
    } else if (RegExp(r'[+\-*/]').hasMatch(input)) {
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
      } else if (isArcSinOperation) {
        calculateArcSin();
      } else if (isArcCosOperation) {
        calculateArcCos();
      } else if (isArcTanOperation) {
        calculateArcTan();
      } else if (isFactorial) {
        double value = double.parse(display.substring(0, display.length - 1));
        double factorialValue = calculateFactorial(value);
        setState(() {
          display = factorialValue.toString();
          isFactorial = false;
        });
      } else if (isExponent) {
        List<String> parts = display.split('^');
        double base = double.parse(parts[0]);
        double exponent = double.parse(parts[1]);
        double exponentialValue = calculateExponent(base, exponent);
        setState(() {
          display = exponentialValue.toString();
          isExponent = false;
        });
      } else if (isExponent) {
        calculateExponent(num1, num2);
      } else if (isSquareRoot) {
        calculateSquareRoot();
      } else if (isMod) {
        List<String> parts = display.split('%');
        double num1 = double.parse(parts[0]);
        double num2 = double.parse(parts[1]);
        double modValue = calculateMod(num1, num2);
        setState(() {
          display = modValue.toString();
        });
      } else if (isReciprocal) {
        calculateReciprocal();
        isReciprocal = false;
      } else if (isSquared) {
        double value = double.parse(display.substring(0, display.length - 2));
        double squaredValue = calculateSquared(value);
        setState(() {
          display = squaredValue.toString();
          isSquared = false;
        });
      } else if (isNthRoot) {
        calculateNthRoot();
        isNthRoot = false;
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
        if (isSinOperation ||
            isCosOperation ||
            isTanOperation ||
            isArcSinOperation ||
            isArcCosOperation ||
            isArcTanOperation ||
            isFactorial) {
          value = input;
          display += input;
        } else {
          display = input;
        }
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
    'C', //1
    'sin',
    'cos',
    'tan',
    '!', //5
    '^',
    'asin',
    'acos',
    'atan',
    '/', //10
    '\u{221A}',
    '7',
    '8',
    '9',
    '*', //15
    'x\u{221A}y',
    '4',
    '5',
    '6',
    '+', //20
    '%',
    '1',
    '2',
    '3',
    '-', //25
    '1/x',
    '^2',
    '0',
    '.',
    '='
  ];

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    Widget buildAngleModeToggle() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Angle Mode: '),
          DropdownButton<AngleMode>(
            value: currentMode,
            items: [
              DropdownMenuItem(
                value: AngleMode.radians,
                child: Text('Radians'),
              ),
              DropdownMenuItem(
                value: AngleMode.degrees,
                child: Text('Degrees'),
              ),
            ],
            onChanged: (AngleMode? mode) {
              setState(() {
                currentMode = mode!;
              });
            },
          ),
        ],
      );
    }

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
        buildAngleModeToggle(), // Angle mode selection UI
        Expanded(
          child: GridView.builder(
            itemCount: buttons.length,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              childAspectRatio: (width / height * 2),
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
            },
          ),
        ),
      ],
    );
  }
}
