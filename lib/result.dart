import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function restartHandler;
  Result(this.resultScore, this.restartHandler);
  String get resultPhrase {
    var resultText = 'You did it!';
    if (resultScore <= 10) {
      resultText = 'You are innocent!';
    } else if (resultScore <= 16) {
      resultText = 'Pretty likeable';
    } else if (resultScore <= 22) {
      resultText = 'You are quite strange';
    } else {
      resultText = 'You are wild!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Restart Quiz!'),
            textColor: Colors.blue,
            onPressed: () => restartHandler(),
          ),
        ],
      ),
    );
  }
}
