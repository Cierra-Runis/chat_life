import 'package:flutter/material.dart';

class BaseSplitViewPlaceholderWidget extends StatelessWidget {
  const BaseSplitViewPlaceholderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Text(
      'BaseSplitView',
      style: TextStyle(
        fontSize: 64,
        fontWeight: FontWeight.bold,
        color: colorScheme.outline,
      ),
    );
  }
}
