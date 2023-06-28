import 'package:flutter/material.dart';

class startScreen extends StatelessWidget {
  const startScreen({super.key, required this.startquiz});
  final void Function() startquiz;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(175, 255, 255, 255),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
          ),
          const Text(
            'Learn Flutter the fun way',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15),
          ),
          OutlinedButton.icon(
            icon: const Icon(Icons.arrow_right_alt),
            onPressed: startquiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            label: const Text(
              'Start Quiz',
            ),
          ),
        ],
      ),
    );
  }
}
