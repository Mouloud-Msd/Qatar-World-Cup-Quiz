import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String question;
  Question(this.question);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      width: double.infinity,
      child: Text(
        question,
        style:
            TextStyle(fontSize: 38, color: Color.fromARGB(255, 255, 255, 255)),
        textAlign: TextAlign.center,
      ),
    );
  }
}
