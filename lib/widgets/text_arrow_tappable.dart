import 'package:ecom_project/constants/styling.dart';
import 'package:ecom_project/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TextArrowTappable extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final EdgeInsets? padding;

  const TextArrowTappable({
    super.key,
    required this.text,
    required this.onTap,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: padding ?? EdgeInsets.all(1.h),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                style: blueTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(width: 1.w),
              const Icon(
                Icons.east,
                color: ColorName.blueBase,
                size: 14.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
