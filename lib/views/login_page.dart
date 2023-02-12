import 'dart:ui';

import '../constants/text_constant.dart';
import '../gen/colors.gen.dart';
import '../widgets/login/login_form.dart';
import '../widgets/rounded_hollow.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatelessWidget {
  static const routeName = 'login_page';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final startTextTop = kToolbarHeight + 2.h;

    return Scaffold(
      backgroundColor: ColorName.blueBase,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  top: kToolbarHeight / 2,
                  left: 20.w,
                  child: const RoundedHollow(),
                ),
                Positioned(
                  right: 10.w,
                  top: -8.h,
                  child: Stack(
                    children: [
                      Container(
                        height: 15.h,
                        width: 15.h,
                        decoration: const BoxDecoration(
                          color: ColorName.pinkish,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Positioned(
                        bottom: 0.0,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: ColorName.blueBase,
                            boxShadow: [
                              BoxShadow(
                                color: ColorName.blueBase,
                                blurRadius: 15.0,
                                spreadRadius: 15.0,
                              )
                            ],
                          ),
                          height: 2.h,
                          width: 15.h,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: startTextTop,
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: Text(
                      TextConstants.welcomeBack,
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                    ),
                  ),
                ),
                Positioned(
                  top: startTextTop + 15.h,
                  right: 10.w,
                  child: const RoundedHollow(
                    height: 4,
                    width: 4,
                  ),
                )
              ],
            ),
          ),
          const Expanded(flex: 2, child: LoginForm()),
        ],
      ),
    );
  }
}
