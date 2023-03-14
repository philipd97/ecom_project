import 'package:ecom_project/constants/text_constant.dart';
import 'package:ecom_project/gen/colors.gen.dart';
import 'package:ecom_project/widgets/blue_tappable_text.dart';
import 'package:ecom_project/widgets/buttons/clear_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomTextField extends HookWidget {
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
    this.minLines = 1,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    final hideText = useState<bool>(obscureText);
    final hasText = useState<bool>(false);

    useEffect(() {
      controller.addListener(() {
        hasText.value = controller.text.trim().isNotEmpty;
      });
    }, [controller]);

    return TextField(
      controller: controller,
      minLines: minLines,
      maxLines: maxLine,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      obscureText: hideText.value,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        suffixIcon: obscureText
            ? BlueTappableText(
                label: hideText.value ? TextConstants.show : TextConstants.hide,
                onPressed: () => hideText.value = !hideText.value,
              )
            : hasText.value
                ? ClearButton(onTap: controller.clear)
                : null,
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              iconData,
              color: ColorName.greySecondary,
            ),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: ColorName.greySecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
