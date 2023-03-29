import "package:flutter/material.dart";
import "./Answer.dart";
import "./Question.dart";
import 'dart:math';

class Quiz extends StatelessWidget {
  //final List<Map<String, List<Map>>> questions;
  final List<Map<String, Object>> questions;
  final int currentQuestion;
  final Function handleChoose;
  Quiz({this.questions, this.currentQuestion, this.handleChoose});
  @override
  Widget build(BuildContext context) {
    //shuffle answer list before mapping
    var _AnswersList = (questions[currentQuestion]['answers'] as List<Map>);
    _AnswersList.shuffle(Random());

    //create var to shuffle the answers before diplaying answer choices
    return Column(children: <Widget>[
      Question(questions[currentQuestion]['questionText']),
      //spread opertaot indicates that we add all the elements (4 answer widgets)
      // along with other widgets (in this case Question widget)
      ...(_AnswersList).map((answer) {
        var _answerTxtMap = answer['AnswerTxt'];
        var _answerFlag = answer['flag'];
        return Answer(
            questionAnswer: (flag) => handleChoose(flag),
            answerText: _answerTxtMap,
            answerFlag: _answerFlag);
      }).toList(),
    ]);
  }
}
