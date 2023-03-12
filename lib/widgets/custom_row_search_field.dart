import 'package:ecom_project/constants/styling.dart';
import 'package:ecom_project/widgets/search_field.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

class CustomRowSearchField extends StatelessWidget {
  final Widget leadingWidget;
  final void Function(String? value) onSubmitted;

  const CustomRowSearchField({
    super.key,
    required this.leadingWidget,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        leadingWidget,
        SizedBox(width: 1.5.w),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: sidePadding),
            child: SearchField(onSubmitted: onSubmitted),
          ),
        ),
      ],
    );
  }
}
