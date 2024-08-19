import 'package:flutter/material.dart';

class AnswersButton extends StatelessWidget {
  const AnswersButton({
    super.key,
    required this.handlePress,
    required this.text,
  });

  final String text;
  final Function() handlePress;

  @override
  Widget build(context) {
    return (ElevatedButton(
      onPressed: handlePress,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 36, 24, 68),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      child: Text(text, textAlign: TextAlign.center,),
    ));
  }
}
