import "package:flutter/material.dart";
import '../vues/Home.dart';

class Result extends StatelessWidget {
  final int score;
  final bool win;
  Result({this.score, this.win});

  @override
  Widget build(BuildContext context) {
    print("win ${win}");
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('Assets/img/${win ? 'win_bg' : 'lost_bg'}.jpg'),
              fit: BoxFit.cover)),
      child: Center(
          child: Column(children: [
        Container(
            margin: EdgeInsets.all(20),
            child: Text(
              win
                  ? 'Wow You Won !!!'
                  : 'Oups You Lost\n Score :${score} points',
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 38,
                  color: Color.fromARGB(255, 255, 255, 255)),
              textAlign: TextAlign.center,
            )),
        Container(
            margin: EdgeInsets.all(20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(180, 50),
                  backgroundColor: Color.fromARGB(217, 135, 32, 4)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.home),
                  SizedBox(width: 8),
                  Text(
                    'Go to Home',
                  ),
                ],
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
                // Do something when the button is pressed
              },
            ))
      ])),
    );
  }
}
