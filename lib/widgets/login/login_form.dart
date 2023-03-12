import 'package:ecom_project/views/create_account_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

import '../../constants/text_constant.dart';
import '../../views/home_page.dart';
import '../blue_tappable_text.dart';
import '../custom_rounded_button.dart';
import '../custom_text_field.dart';

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
                  CustomTextField(
                    controller: emailController,
                    iconData: IconlyLight.message,
                    label: TextConstants.email,
                    textInputType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: height * 0.03),
                  CustomTextField(
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
                      onPressed: () =>
                          context.go('/${CreateAccountPage.routeName}'),
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
