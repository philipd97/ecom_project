import 'package:ecom_project/gen/colors.gen.dart';
import 'package:flutter/material.dart';

class ClearButton extends StatelessWidget {
  final VoidCallback onTap;

  const ClearButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      shape: const CircleBorder(),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        child: const Icon(
          Icons.cancel_outlined,
          color: ColorName.greySecondary,
        ),
      ),
    );
  }
}
