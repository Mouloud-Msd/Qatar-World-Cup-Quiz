import 'package:flutter/material.dart';
import 'dart:math';

import '../GameFiles/Game.dart';
import '../vues/Leaderboards.dart';
import '../vues/Settings.dart';

class Home extends StatelessWidget {
  int _initialValue;
  void _startGame() {
    var random = Random();
    print("Game started");
    _initialValue = random.nextInt(64);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Color.fromARGB(249, 215, 215, 17),
        appBar: AppBar(
          title: Text('Qatar World Cup Quiz !'),
          backgroundColor: Color.fromARGB(255, 82, 8, 2),
        ),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('Assets/img/bg.jpg'), fit: BoxFit.cover)),
            //padding: EdgeInsets.all(16),
            //padding: EdgeInsets.all(38),
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Container(
                      margin: EdgeInsets.all(20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(217, 138, 32, 18),
                            fixedSize: const Size(180, 50)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.games),
                            SizedBox(width: 8),
                            Text('Start Game'),
                          ],
                        ),
                        onPressed: () {
                          _startGame();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MyGame(currentQuestion: _initialValue)));
                          // Do something when the button is pressed
                        },
                      )),
                  Container(
                      margin: EdgeInsets.all(20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(217, 138, 32, 18),
                            fixedSize: const Size(180, 50)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.leaderboard),
                            SizedBox(width: 8),
                            Text('Leaderboards'),
                          ],
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LeaderB()));
                          // Do something when the button is pressed
                        },
                      )),
                  Container(
                      margin: EdgeInsets.all(20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(217, 138, 32, 18),
                            fixedSize: const Size(180, 50)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.settings),
                            SizedBox(width: 8),
                            Text('Settings'),
                          ],
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Settings()));
                          // Do something when the button is pressed
                        },
                      )),
                ]))));
  }
}
