import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/questions_scree.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _quiz1();
  }
}

List<String> selectedanswers = [];

class _quiz1 extends State<Quiz> {
  var activescreen = 'start-screen';

  void changescreen() {
    setState(() {
      activescreen = 'quiz-screen';
      if (selectedanswers.length == questions.length) {
        activescreen = 'results-screen';
      }
    });
  }

  void onchooseanswer(String answer) {
    selectedanswers.add(answer);
  }

  void restartquiz() {
    setState(() {
      activescreen = 'quiz-screen';
      selectedanswers = [];
    });
  }

  @override
  Widget build(context) {
    Widget widgetscreen = startScreen(startquiz: changescreen);

    if (activescreen == 'quiz-screen') {
      widgetscreen = QuestionScreen(
        onChooseanswer: onchooseanswer,
        checkchangescreen: changescreen,
      );
    }
    if (activescreen == 'results-screen') {
      widgetscreen = Resultscreen(
        chosenanswers: selectedanswers,
        restart: restartquiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(248, 63, 11, 78),
                Color.fromARGB(255, 70, 24, 77),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: widgetscreen,
          ),
        ),
      ),
    );
  }
}
