import 'package:ecom_project/constants/styling.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class WhiteCardLayout extends StatelessWidget {
  final Widget child;
  final double circularRadius;
  final EdgeInsets? padding;

  const WhiteCardLayout({
    super.key,
    required this.child,
    this.circularRadius = 10.0,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(circularRadius),
      ),
      padding: padding ??
          EdgeInsets.symmetric(
            horizontal: sidePadding,
            vertical: 3.h,
          ),
      child: child,
    );
  }
}
