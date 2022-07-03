import 'package:flutter/material.dart';

import 'button.dart';

class RightOrWrongButton extends StatelessWidget {
  final Function isAnswerCorrect;

  const RightOrWrongButton({Key? key, required this.isAnswerCorrect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyButton(
              onPressedCallback: () => isAnswerCorrect(true),
              child: const Text('Correct')),
          MyButton(
              onPressedCallback: () => isAnswerCorrect(false),
              child: const Text('Wrong')),
        ],
      )
    );
  }
}
