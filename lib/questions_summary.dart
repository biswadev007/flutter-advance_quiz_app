import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:advance_quize/question_marker.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.questionsSummaryData, {super.key});

  final List<Map<String, Object>> questionsSummaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: questionsSummaryData.map(
            (data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  QuestionMarker(
                      marker: ((data['question_id'] as int) + 1).toString(),
                      isCorrect: data['is_correct'] as bool),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data['question'].toString(),
                            style: GoogleFonts.lato(
                                color: Colors.white, fontSize: 18)),
                        Text(data['currect_ans'].toString(),
                            style: GoogleFonts.lato(
                                color: Colors.lightGreen, fontSize: 14)),
                        Text(data['users_ans'].toString(),
                            style: GoogleFonts.lato(
                                color: Colors.orange, fontSize: 14)),
                        const SizedBox(
                          height: 12,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
