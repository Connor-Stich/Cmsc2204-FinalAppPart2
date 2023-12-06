import 'package:flutter/material.dart';

class aboutPage extends StatelessWidget{


@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Padding(padding: EdgeInsets.all(16.0),
          child: Text("Welcome to BallDontLie, where the thrill of the NBA comes to life right at your fingertips. " +
          "Our application is a great companion for diving into the world of basketball, providing an experience that " +
          "makes it feel you are closer to the action around the league. Explore information about the teams, players, and also games from around the league. " +
          "Never miss a beat in the landscape of the NBA, and elevate your experience with BallDontLie.", style: TextStyle(fontSize: 20.0),),
        ),
      ),
    );
  }
}