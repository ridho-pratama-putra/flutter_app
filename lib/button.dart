import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton({Key? key, required this.onPressedCallback, required this.child}) : super(key: key);

  final VoidCallback onPressedCallback;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressedCallback, child: child);
  }
}
