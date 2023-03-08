import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget iconWidget;
  final EdgeInsets? padding;

  const CustomIconButton({
    super.key,
    required this.onPressed,
    required this.iconWidget,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.only(left: 2.w),
      child: Material(
        type: MaterialType.transparency,
        shape: const CircleBorder(),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: iconWidget,
          ),
        ),
      ),
    );
  }
}

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) => CustomIconButton(
        onPressed: () => Navigator.pop(context),
        iconWidget: const Icon(Icons.west, color: Colors.black),
      );
}
