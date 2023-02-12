import '../gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomRoundedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final EdgeInsets? padding;
  final Color textColor;
  final Color backgroundColor;

  const CustomRoundedButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.textColor = Colors.white,
    this.backgroundColor = ColorName.blueBase,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: EdgeInsets.symmetric(vertical: 2.5.h),
          backgroundColor: backgroundColor,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
