import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var questionIndex = 0;

  void answerQuestion() {
    setState(() {
      
    questionIndex = questionIndex + 1;
    });
    // print('Answer Choosen');
    print(questionIndex);   
  } 

  @override
  Widget build(BuildContext context) {
    var questions = [
      'What\'s your favorite color?',
      'What\'s your favorite animal?',
    ];
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('My first app'),
            ),
            body: Column(children: [
              Text(questions[questionIndex]),       
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
