import 'package:flutter/material.dart';

class FloatingButtons extends StatelessWidget {
  const FloatingButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return  FloatingActionButton(
      onPressed: () {},
      tooltip: 'Add expense',
      child: Icon(Icons.add_circle),

    );
  }
}
