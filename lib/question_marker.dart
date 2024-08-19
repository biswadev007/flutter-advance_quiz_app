import 'package:flutter/material.dart';

class QuestionMarker extends StatelessWidget {
  const QuestionMarker(
      {super.key, required this.marker, required this.isCorrect});

  final String marker;
  final bool isCorrect;

  @override
  Widget build(context) {
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrect ? Colors.green[200] : Colors.red[200],
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        marker,
        style: const TextStyle(color: Colors.black, fontSize: 18),
      ),
    );
  }
}
