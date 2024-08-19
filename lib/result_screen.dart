import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:advance_quize/data/questions.dart';
import 'package:advance_quize/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswers, required this.restartQuiz});

  final List<String> chosenAnswers;
  final Function() restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for(var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_id': i,
        'question': questions[i].text,
        'currect_ans': questions[i].answers[0],
        'users_ans': chosenAnswers[i],
        'is_correct': questions[i].answers[0] == chosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(context) {
    final summeries = getSummaryData();
    final totalNumberOfQuestions = questions.length;
    final numberOfCurrectAnswers = summeries.where((data) {
      return data['currect_ans'] == data['users_ans'];
    }).length;

    return (SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'You answered $numberOfCurrectAnswers out of $totalNumberOfQuestions questions correctly!',
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
            QuestionsSummary(summeries),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: restartQuiz,
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              label: const Text('Restart quiz!'),
              icon: const Icon(Icons.restart_alt_rounded),
            ),
          ],
        ),
      ),
    ));
  }
}
