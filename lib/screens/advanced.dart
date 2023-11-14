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
  static const double phi = 1.618033988749895; //golden ratio


  void clear() {
    setState(() {
      display = '0';
      num1 = 0.0;
      num2 = 0.0;
      operation = '';
      answer = 0.0;
    });
  }

  /*void handleDelete(){
    final numberString = double.parse(display).toString();
    List<String> n = numberString.split("");
    var stringWithLastValueRemoved = n.removeLast();
    var number1 = n.join();
    //final numberToDelete = double.parse(display).toString();
    //var output = '';
    //if (numberToDelete.isNotEmpty){
    //  output = numberToDelete[numberToDelete.length - 1]; //is the last number of the string
    //}
    setState(() {
        display = stringWithLastValueRemoved;
        num1 = double.parse(number1);
        //num2 = 0.0;
      });
  }

  void handleDelete() {
    final numberString = double.parse(display).toString();
    List<String> n = numberString.split("");
    n.removeLast(); 
    
    if (n.isEmpty) {
      setState(() {
        display = '0';
        num1 = 0.0;
      });
    } else {
      var number1 = n.join();
      //possibly something with the way it joined
      setState(() {
        display = number1;
        num1 = double.parse(number1);
      });
    }
  }*/

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

  void calculateExp() { // calculate exponential calculations
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
  
  
  void calculateCubed(){
    double number = double.parse(display);
    final result = pow(number, 3);
    setState(() {
      display = '$number³ = $result';
      //display = result.toString();
      num1 = result.toDouble();
      num2 = 0.0;
      answer = result.toDouble();
    });
  }
  
  
  
  void calculateSquareRoot1_2(){
    const result = sqrt1_2;
    setState(() {
      display = result.toString();
      num1 = result;
      num2 = 0.0;
      operation = '';
      answer = result;
    });    
  }
  


  void handleClick(String input) {
      if (input == 'log'){
        isLogOperation = true;
        display = 'log(';
      } else if (input == '±'){
        handleNegation();
      } else if (input == 'ln'){
        calculateLn();
      } else if (input == 'exp'){
        calculateExp();
      } else if (input == '|x|'){
        handleAbsoluteValue();
      } else if (input == 'x³'){
        calculateCubed();
      } else if (input == 'ln2'){
        calculateLn2();
      } else if (input == 'sqrt(1/2)'){
        calculateSquareRoot1_2();
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
          } else if (input == '\u03C6') {
            display = phi.toString();
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
    'C', 'e', 'pi', '±', '', 'sqrt(1/2)', 'log', '|x|', 'x³', '/', 'exp', '7', '8', '9', '*', '\u03C6', '4', '5', '6','+', '\u221B', '1', '2', '3','-', 'ln2', 'ln', '0', '.', '='
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