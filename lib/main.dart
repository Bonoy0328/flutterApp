import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var questionIndex = 0;
  void answerQuestion() {
    setState(() {
      if (questionIndex == 1)
        questionIndex = 0;
      else
        questionIndex = 1;
    });
    print('Answer question!');
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questions': 'What\'s your favorite color?',
        'answers': ['bule', 'red', 'green']
      },
      {
        'questions': 'What\'s your favorite animarl?',
        'answers': ['Rabblit', 'Snake', 'Elephant', 'Lion']
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('My First App'),
        ),
        body: Column(
          children: [
            Question(questions[questionIndex]['questions']),
            ...(questions[questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(answerQuestion, answer);
            }).toList(),
          ],
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
