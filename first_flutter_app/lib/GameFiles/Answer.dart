import "package:flutter/material.dart";

class Answer extends StatelessWidget {
  final Function questionAnswer;
  final String answerText;
  final bool answerFlag;

  Answer({this.questionAnswer, this.answerText, this.answerFlag});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: ElevatedButton(
          child: Text(answerText,
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontFamily: 'Roboto',
                fontSize: 32,
              )),
          style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(137, 183, 136, 34),
              fixedSize: const Size(180, 60)),
          onPressed: () => questionAnswer(answerFlag)),
    );
  }
}
