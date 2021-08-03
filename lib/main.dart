import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

//void main() {
//  runApp(MyApp());
//}
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favourite colour?',
      'answers': [
        {'text': 'Red', 'score': 7},
        {'text': 'Black', 'score': 10},
        {'text': 'Pink', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Lion', 'score': 9},
        {'text': 'Panda', 'score': 2},
        {'text': 'Penguin', 'score': 2},
        {'text': 'Polar Bear', 'score': 4},
      ],
    },
    {
      'questionText': 'What\'s your favourite subject?',
      'answers': [
        {'text': 'English', 'score': 5},
        {'text': 'Mathematics', 'score': 3},
        {'text': 'Computer Science', 'score': 3},
        {'text': 'History', 'score': 11},
      ],
    },
  ];

  var _questionIndex = 0;
  int _totalScore = 0;
  void _restartQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(_totalScore, _restartQuiz),
      ),
    );
  }
}
