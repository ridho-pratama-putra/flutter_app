import 'package:flutter/material.dart';

class ResetQuestionButton extends StatelessWidget {
  final VoidCallback resetQuestion;

  const ResetQuestionButton({Key? key, required this.resetQuestion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: resetQuestion, child: const Text("Start again"))
          ]),
    );
  }
}
