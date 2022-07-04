import 'package:flutter/material.dart';

class ScoreWidget extends StatelessWidget {
  final int score;

  const ScoreWidget({Key? key, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: score >= 1
              ? const Text("you did it",
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.green))
              : const Text("letstry again")),
    );
  }
}
