import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  final String question;

  const QuestionWidget({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(question),
        ],
      ),
    );
  }
}
