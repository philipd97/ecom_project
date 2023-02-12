import 'package:ecom_project/constants/text_constant.dart';
import 'package:ecom_project/gen/assets.gen.dart';
import 'package:ecom_project/gen/colors.gen.dart';
import 'package:ecom_project/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:iconly/iconly.dart';

class HomePage extends StatelessWidget {
  static const routeName = 'home_page';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final leftPad = 8.5.w;
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: leftPad),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                IconlyBold.home,
                color: ColorName.blueBase,
                shadows: [
                  BoxShadow(
                    color: ColorName.blueBase,
                    blurRadius: 20.0,
                    spreadRadius: 10.0,
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                IconlyLight.heart,
                color: ColorName.bottomNavBarIcon,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                IconlyLight.profile,
                color: ColorName.bottomNavBarIcon,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                IconlyLight.buy,
                color: ColorName.bottomNavBarIcon,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: leftPad),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: kToolbarHeight),
            Row(
              children: [
                Assets.icons.menuIcon.image(),
                SizedBox(width: 4.5.w),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: leftPad),
                    child: SearchField(
                      onSubmitted: (value) => {},
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Text(
              TextConstants.orderOnlineLabel,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
            ),
            SizedBox(height: 2.h),
          ],
        ),
      ),
    );
  }
}


//  BottomNavigationBarItem(
//       label: TextConstants.home,
//       icon: Icon(
//         IconlyLight.home,
//         color: ColorName.bottomNavBarIcon,
//       ),
//       activeIcon: Icon(
//         IconlyBold.home,
//         color: ColorName.blueBase,
//         shadows: [
//           BoxShadow(
//             color: ColorName.blueBase,
//             blurRadius: 20.0,
//             spreadRadius: 10.0,
//           ),
//         ],
//       ),
//     ),
//     BottomNavigationBarItem(
//       label: TextConstants.favorites,
//       icon: Icon(
//         IconlyLight.heart,
//         color: ColorName.bottomNavBarIcon,
//       ),
//     ),
//     BottomNavigationBarItem(
//       label: TextConstants.profile,
//       icon: Icon(
//         IconlyLight.profile,
//         color: ColorName.bottomNavBarIcon,
//       ),
//     ),
//     BottomNavigationBarItem(
//       label: TextConstants.basket,
//       icon: Icon(
//         IconlyLight.buy,
//         color: ColorName.bottomNavBarIcon,
//       ),
//     ),
