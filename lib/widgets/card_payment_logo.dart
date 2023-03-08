import 'package:ecom_project/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CardPaymentLogo extends StatelessWidget {
  final String imagePath;

  const CardPaymentLogo({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      decoration: BoxDecoration(
        color: ColorName.greyLightBackground,
        border: Border.all(
          color: ColorName.greySecondary.withOpacity(0.5),
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Image.asset(imagePath, height: 5.h, width: 10.w),
    );
  }
}
