import '../constants/styling.dart';
import 'package:flutter/material.dart';

class BlueTappableText extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const BlueTappableText({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(label, style: blueTextStyle),
    );
  }
}
