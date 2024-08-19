import 'package:flutter/material.dart';

import 'package:advance_quize/splash_screen.dart';
import 'package:advance_quize/result_screen.dart';
import 'package:advance_quize/questions_screen.dart';
import 'package:advance_quize/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizeState();
  }
}

class _QuizeState extends State<Quiz> {
  List<String> chosenAnswers = [];
  var activeScreen = 'quize-screen';

  void handleScreenChange() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void addAnswers(String answer) {
    chosenAnswers.add(answer);

    if (chosenAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      activeScreen = 'quize-screen';
    });
    chosenAnswers = [];
  }

  @override
  Widget build(context) {
    return (MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.deepPurpleAccent, Colors.deepPurple],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          child: activeScreen == 'quize-screen'
              ? SplashScreen(handleScreenChange)
              : activeScreen == 'question-screen'
                  ? QuestionsScreen(
                      onSelectAnswer: addAnswers,
                    )
                  : ResultScreen(
                      chosenAnswers: chosenAnswers,
                      restartQuiz: restartQuiz,
                    ),
        ),
      ),
    ));
  }
}
