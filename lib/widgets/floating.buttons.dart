import 'package:flutter/material.dart';

class FloatingButtons extends StatelessWidget {
  final VoidCallback onPressed;
  const FloatingButtons({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  FloatingActionButton(
      onPressed: onPressed,
      tooltip: 'Add expense',
      child: Icon(Icons.add_circle),

    );
  }
}
