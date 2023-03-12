import 'package:ecom_project/constants/text_constant.dart';
import 'package:ecom_project/gen/colors.gen.dart';
import 'package:ecom_project/widgets/blue_tappable_text.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final IconData iconData;
  final String label;
  final bool obscureText;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final int? maxLine;
  final int? minLines;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.iconData,
    required this.label,
    required this.textInputType,
    required this.textInputAction,
    this.maxLine = 1,
    this.minLines =1,
    this.obscureText = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late final hideText = ValueNotifier<bool>(widget.obscureText);

  @override
  void dispose() {
    hideText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: hideText,
      builder: (_, hider, __) {
        return TextField(
          minLines: widget.minLines,
          maxLines: widget.maxLine,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          obscureText: hider,
          keyboardType: widget.textInputType,
          textInputAction: widget.textInputAction,
          decoration: InputDecoration(
            suffixIcon: widget.obscureText
                ? BlueTappableText(
                    label: hider ? TextConstants.show : TextConstants.hide,
                    onPressed: () => hideText.value = !hider,
                  )
                : null,
            label: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  widget.iconData,
                  color: ColorName.greySecondary,
                ),
                const SizedBox(width: 10),
                Text(
                  widget.label,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: ColorName.greySecondary,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
