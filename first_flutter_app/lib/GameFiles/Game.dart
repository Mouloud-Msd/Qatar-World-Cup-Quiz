import 'package:flutter/material.dart';
import 'dart:math';

import "./Quiz.dart";
import "./Result.dart";
import '../constants.dart';

class MyGame extends StatefulWidget {
  final int currentQuestion; //initialize value in our class
  MyGame({this.currentQuestion});
  @override
  State<StatefulWidget> createState() {
    return _MyGameState(
        currentQuestion:
            currentQuestion); //passing first question to our state class
  }
}

class _MyGameState extends State<MyGame> {
  final int currentQuestion; //initialize value in our class State
  _MyGameState({this.currentQuestion});

  var random = new Random();
  var QuestList = []; //list of all played question
  int _nextQuestion;
  var _score = 0;
  bool _win = false;
  bool _RightAnsw = true;
  bool _FirstMove = true;

  void _handleChoose(flag) {
    //check flag
    if (flag) {
      _score += 10;
      //check if first move
      _checkFirstMove(); //check if it's the fistQuestion aswered
      //check win
      if (_checkWin()) {
        setState(() {
          _win = true;
          return;
        });
      } else {
        _getNextQuest();
      }
    } else {
      setState(() {
        _RightAnsw = false;
        return;
        //endGame
      });
    }
    //if (!_win) _getNextQuest();
  }

  void _checkFirstMove() {
    if (_FirstMove) {
      QuestList.add(
          currentQuestion); //currentQuestion is actually the FirstQuestion of the game
      setState(() {
        _FirstMove = false;
      });
    } else {
      QuestList.add(_nextQuestion);
    }
  }

  void _getNextQuest() {
    int nextValue;
    bool check;
    //check if new value is valid
    do {
      nextValue = random.nextInt(64);
      check = QuestList.contains(nextValue);
    } while (check);
    setState(() {
      _nextQuestion = nextValue;
    });
  }

  bool _checkWin() {
    //var intersection = QuestList.toSet().intersection(questions.toSet());

    if (QuestList.length == questions.length) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    print('currentQuest ${currentQuestion}');
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Choose the right answer'),
              backgroundColor: Color.fromARGB(255, 35, 35, 37),
            ),
            body: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('Assets/img/game_bg.jpg'),
                        fit: BoxFit.cover)),
                child: _RightAnsw && !_win
                    ? Quiz(
                        questions: questions,
                        currentQuestion:
                            _FirstMove ? currentQuestion : _nextQuestion,
                        handleChoose: (flag) => _handleChoose(flag),
                      )
                    : Result(
                        win: _win,
                        score: _score,
                      ))));
  }
}
