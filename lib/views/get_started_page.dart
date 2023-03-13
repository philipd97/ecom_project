import 'package:ecom_project/views/home_page.dart';

import '../widgets/custom_rounded_button.dart';

import 'login_page.dart';
import '../widgets/fixed_horizon_pad.dart';
import 'package:go_router/go_router.dart';

import '../constants/text_constant.dart';
import '../gen/assets.gen.dart';
import '../gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class GetStartedPage extends StatelessWidget {
  static const routeName = '/';

  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.blueBase,
      body: Column(
        children: [
          const SizedBox(height: kToolbarHeight),
          FixedHorizonPadding(
            child: Text(
              TextConstants.findYourProduct,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Assets.images.startingPage.image(
                fit: BoxFit.cover,
                height: 50.h,
              ),
              Positioned(
                bottom: -0.0,
                child: Container(
                  decoration: const BoxDecoration(
                    color: ColorName.blueBase,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.0, -10.0),
                        color: ColorName.blueBase,
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                  height: 3.h,
                  width: 100.w,
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          FixedHorizonPadding(
            child: CustomRoundedButton(
              onPressed: () => context.go(HomePage.routeName),
              label: TextConstants.getStarted,
              backgroundColor: Colors.white,
              textColor: ColorName.blueBase,
            ),
          )
        ],
      ),
    );
  }
}
