import 'package:flutter/material.dart';

import 'package:quiz_app/summary.dart';

import 'package:quiz_app/data/questions.dart';

class Resultscreen extends StatelessWidget {
  Resultscreen({super.key, required this.chosenanswers, required this.restart});

  final List<String> chosenanswers;
  void Function() restart;

  List<Map<String, Object>> getsummary() {
    final List<Map<String, Object>> summarydata = [];

    for (var i = 0; i < questions.length; i++) {
      summarydata.add({
        'question-index': i,
        'question-text': questions[i].text,
        'correct-answer': questions[i].answers[0],
        'chosen-answer': chosenanswers[i]
      });
    }

    return summarydata;
  }

  @override
  Widget build(context) {
    final summarydata = getsummary();
    final int nototalquestions = questions.length;
    final numcorrectquestions = summarydata.where((data) {
      return data['chosen-answer'] == data['correct-answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numcorrectquestions out of $nototalquestions questions correctly',
              style: const TextStyle(fontSize: 22, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            summary(summarydata: summarydata),
            TextButton(onPressed: restart, child: const Text('Restart Quiz'))
          ],
        ),
      ),
    );
  }
}
