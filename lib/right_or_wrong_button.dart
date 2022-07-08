import 'package:flutter/material.dart';

import 'button.dart';

class RightOrWrongButton extends StatelessWidget {
  final Function isAnswerCorrect;

  const RightOrWrongButton({Key? key, required this.isAnswerCorrect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: () => isAnswerCorrect(true),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green)),
          child: const Text('Correct'),
        ),
        ElevatedButton(
          onPressed: () => isAnswerCorrect(false),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red)),
          child: const Text('Wrong'),
        ),
      ],
    );
  }
}
