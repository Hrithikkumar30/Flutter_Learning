import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  void answerQuestion() {
    print('Answer Choosen');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('My first app'),
            ),
            body: Column(children: [
              Text("the question 1"),
              RaisedButton(
                onPressed: answerQuestion,
                child: Text("Answer 1"),
              ),
              RaisedButton(
                onPressed: answerQuestion,
                child: Text("Answer 2"),
              ),
              RaisedButton(
                onPressed: answerQuestion,
                child: Text("Answer 3"),
              ),
            ])));
  }
}
