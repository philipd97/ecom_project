import '../../constants/styling.dart';
import '../../views/home_page.dart';
import '../blue_tappable_text.dart';
import '../custom_rounded_button.dart';
import 'package:go_router/go_router.dart';

import '../../constants/text_constant.dart';
import '../../gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iconly/iconly.dart';

class LoginForm extends HookWidget {
  const LoginForm({super.key});

  void _login({
    required BuildContext context,
    required String email,
    required String password,
  }) {
    context.go('/${HomePage.routeName}');
  }

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return LayoutBuilder(
      builder: (context, constraint) {
        final height = constraint.maxHeight;
        final width = constraint.maxWidth;
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.5),
              topRight: Radius.circular(12.5),
            ),
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.125),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.05),
                  const Text(
                    TextConstants.login,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  _CustomTextField(
                    controller: emailController,
                    iconData: IconlyLight.message,
                    label: TextConstants.email,
                    textInputType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: height * 0.03),
                  _CustomTextField(
                    controller: passwordController,
                    iconData: IconlyLight.lock,
                    label: TextConstants.password,
                    textInputType: TextInputType.visiblePassword,
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                  ),
                  SizedBox(height: height * 0.015),
                  BlueTappableText(
                    label: TextConstants.forgotPasscode,
                    onPressed: () {},
                  ),
                  SizedBox(height: height * 0.04),
                  CustomRoundedButton(
                    onPressed: () => _login(
                      context: context,
                      email: emailController.text,
                      password: passwordController.text,
                    ),
                    label: TextConstants.login,
                  ),
                  SizedBox(height: height * 0.01),
                  Align(
                    alignment: Alignment.center,
                    child: BlueTappableText(
                      label: TextConstants.createAccount,
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final IconData iconData;
  final String label;
  final bool obscureText;
  final TextInputType textInputType;
  final TextInputAction textInputAction;

  const _CustomTextField({
    super.key,
    required this.controller,
    required this.iconData,
    required this.label,
    required this.textInputType,
    required this.textInputAction,
    this.obscureText = false,
  });

  @override
  State<_CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<_CustomTextField> {
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
