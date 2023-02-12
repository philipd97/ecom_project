import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FixedHorizonPadding extends StatelessWidget {
  final Widget child;

  const FixedHorizonPadding({super.key, required this.child});

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: child,
      );
}
