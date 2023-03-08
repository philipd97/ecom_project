import 'package:ecom_project/constants/styling.dart';
import 'package:ecom_project/constants/text_constant.dart';
import 'package:flutter/material.dart';

class TotalPriceRow extends StatelessWidget {
  const TotalPriceRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          TextConstants.total,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18.0,
          ),
        ),
        Text(
          '\$ 954',
          style: blueTextStyle.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ],
    );
  }
}
