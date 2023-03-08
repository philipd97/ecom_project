import 'package:flutter/material.dart';

class ScaledTransformWidget extends StatelessWidget {
  final AnimationController controller;
  final double animationValue;
  final Widget child;

  const ScaledTransformWidget({
    super.key,
    required this.controller,
    required this.animationValue,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Transform.scale(
        scale: animationValue,
        alignment: Alignment.centerRight,
        child: child!,
      ),
      child: child,
    );
  }
}
