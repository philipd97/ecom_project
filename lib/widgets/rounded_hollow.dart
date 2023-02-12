import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RoundedHollow extends StatelessWidget {
  final double height;
  final double width;
  final double borderWidth;

  const RoundedHollow({
    super.key,
    this.height = 3.5,
    this.width = 3.5,
    this.borderWidth = 1.5,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: width.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: borderWidth.w,
          color: Colors.white.withOpacity(0.20),
        ),
      ),
    );
  }
}
