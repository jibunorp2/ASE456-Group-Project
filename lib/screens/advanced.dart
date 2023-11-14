import 'package:flutter/material.dart';
import '../ui_elements/button.dart';
import 'dart:math';

class AdvancedCalculator extends StatefulWidget {
  const AdvancedCalculator({Key? key}) : super(key: key);

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

  void handleClick(String input) {
      if (input == 'log'){
        isLogOperation = true;
        display = 'log(';
      } else if (RegExp(r'[+\-*/]').hasMatch(input)) {
        handleOperation(input);
      } else if (input == 'C') {
        clear();
      } else if (input == '=') {
        if (isLogOperation){
          calculateLog();
        } else {
          calculate();
        }
      } else{
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
          } else if (isLogOperation){
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
    'C', 'e', 'pi', '', '', '', '', '', '', '/', '', '7', '8', '9', '*', '', '4', '5', '6','+', 'log', '1', '2', '3','-', '', '', '0', '.', '='
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