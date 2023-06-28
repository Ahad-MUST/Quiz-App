import 'package:quiz_app/answers_button.dart';

import 'package:flutter/material.dart';

import 'package:quiz_app/data/questions.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/quiz.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(
      {super.key,
      required this.onChooseanswer,
      required this.checkchangescreen});
  final void Function(String answer) onChooseanswer;
  final void Function() checkchangescreen;
  @override
  State<QuestionScreen> createState() {
    return _QuestioScreenState();
  }
}

class _QuestioScreenState extends State<QuestionScreen> {
  int index = 0;

  void changequestion(String answer) {
    widget.checkchangescreen();
    widget.onChooseanswer(answer);
    if (selectedanswers.length != questions.length) {
      setState(() {
        index++;
      });
    }
  }

  @override
  Widget build(contaxt) {
    final currentquestion = questions[index];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentquestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 244, 225, 250),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const Padding(padding: EdgeInsets.all(15)),
            ...currentquestion.shuffledanswers.map((x) {
              return Answerbutton(
                  answertext: x,
                  onTap: () {
                    changequestion(x);
                  });
            }),
          ],
        ),
      ),
    );
  }
}
