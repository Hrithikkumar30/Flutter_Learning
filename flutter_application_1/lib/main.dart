import 'package:flutter/material.dart';
import './question.dart';
import 'answer.dart';

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
      {
        'questionText': 'What\'s your favorite color?',
        'answers': ['black', 'green', 'white', 'yellow']
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': ['Dog', 'Cat', 'Horse', 'Cow']
      },
      {
        'questionText': 'What\'s your favorite actor?',
        'answers': ['Hrithik', 'kartik', 'ranveer', 'Ranbir']
      },
    ];
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('My first app'),
            ),
            body: Column(children: [
              Question(
                questions[questionIndex]['questionText'] as String,
              ),
              ...(questions[questionIndex]['answers'] as List<String>)
                  .map((answer) {
                return Answer(answerQuestion, answer);
              }).toList()
              // Answer(answerQuestion),
              // Answer(answerQuestion),
              // Answer(answerQuestion),
            ])));
  }
}
