import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen(this.handleScreenChange, {super.key});

  final void Function() handleScreenChange;

  @override
  Widget build(context) {
    return (Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            'assets/images/quiz-logo.png',
            width: 250,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
        ),
        const SizedBox(
          height: 70,
        ),
        const Text(
          'Learn flutter the fun way!',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        const SizedBox(
          height: 20,
        ),
        OutlinedButton.icon(
          onPressed: handleScreenChange,
          style: OutlinedButton.styleFrom(
              foregroundColor: Colors.deepPurpleAccent,
              backgroundColor: Colors.white),
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text(
            'Start Quiz',
          ),
        ),
      ],
    ));
  }
}
