import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton(
      {Key? key,
      required this.text,
      required this.buttonColor,
      required this.textColor,
      required this.function})
      : super(key: key);

  final String text;
  final buttonColor, textColor, function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
              height: 10,
              width: 10,
              color: buttonColor,
              child: Center(
                child: Text(text,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: textColor,
                        fontSize: 20)),
              )),
        ),
      ),
    );
  }
}