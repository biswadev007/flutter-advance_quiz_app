import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:advance_quize/answers_button.dart';
import 'package:advance_quize/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestion = 0;

  void handlePress(String answer) {
    setState(() {
      currentQuestion++;
    });
    widget.onSelectAnswer(answer);
  }

  @override
  Widget build(context) {
    final quizList = questions[currentQuestion];

    return (SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              quizList.text,
              style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...quizList.suffeledList().map((el) {
              return AnswersButton(
                handlePress: () => handlePress(el),
                text: el,
              );
            }),
          ],
        ),
      ),
    ));
  }
}
