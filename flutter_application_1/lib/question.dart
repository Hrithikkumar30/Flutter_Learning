import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  // const Questi on({Key? key}) : super(key: key);
  String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Text(questionText

    );
  }
}
