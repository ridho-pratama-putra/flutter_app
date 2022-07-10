import 'package:flutter/material.dart';

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
          key: const Key('correctButton'),
          onPressed: () => isAnswerCorrect(true),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
          child: const Text('Correct'),
        ),
        ElevatedButton(
          key: const Key('wrongButton'),
          onPressed: () => isAnswerCorrect(false),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
          child: const Text('Wrong'),
        ),
      ],
    );
  }
}
