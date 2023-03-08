import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iconly/iconly.dart';
import 'package:sizer/sizer.dart';

import '../constants/styling.dart';
import '../constants/text_constant.dart';
import '../gen/colors.gen.dart';
import '../widgets/home/home_body_content.dart';
import '../widgets/home/scaled_transform_widget.dart';
import '../widgets/rounded_hollow.dart';

class HomePage extends HookWidget {
  static const routeName = 'home_page';

  const HomePage({super.key});

  void _openDrawer({
    required ValueNotifier<bool> drawerOpened,
    required AnimationController scaleController,
    required AnimationController moveRightController,
  }) {
    drawerOpened.value = !drawerOpened.value;
    if (drawerOpened.value) {
      scaleController.reverse();
      moveRightController.reverse();
    } else {
      scaleController.forward();
      moveRightController.forward();
    }
  }

  void _focusBackHomePage({
    required ValueNotifier<bool> drawerOpened,
    required AnimationController scaleController,
    required AnimationController moveRightController,
  }) {
    // trigger animation method
    drawerOpened.value = false;
    scaleController.forward();
    moveRightController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final drawerOpened = useState<bool>(false);

    final scaleController = useAnimationController(
        initialValue: 1.0,
        lowerBound: 0.65,
        upperBound: 1.0,
        duration: const Duration(milliseconds: 200));

    final moveRightController = useAnimationController(
      initialValue: 0.0,
      lowerBound: -80.w,
      upperBound: 0.0,
      duration: const Duration(milliseconds: 200),
    );

    final scaleAnimation = useAnimation(scaleController);
    final moveRightAnimation = useAnimation(moveRightController);

    return Scaffold(
      body: AnimatedBuilder(
        animation: moveRightController,
        builder: (ctx, child) => Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              color: ColorName.blueBase,
            ),
            Positioned(
              child: SizedBox(
                width: 50.w,
                child: Drawer(
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),
                      _MenuTile(
                        icon: IconlyLight.profile,
                        label: TextConstants.profile,
                        onTap: () {},
                      ),
                      SizedBox(height: .5.h),
                      const _CustomDivider(),
                      SizedBox(height: .5.h),
                      _MenuTile(
                        icon: IconlyLight.buy,
                        label: TextConstants.myOrders,
                        onTap: () {},
                      ),
                      SizedBox(height: .5.h),
                      const _CustomDivider(),
                      SizedBox(height: .5.h),
                      _MenuTile(
                        icon: IconlyLight.heart,
                        label: TextConstants.favorites,
                        onTap: () {},
                      ),
                      SizedBox(height: .5.h),
                      const _CustomDivider(),
                      SizedBox(height: .5.h),
                      _MenuTile(
                        icon: IconlyLight.bag,
                        label: TextConstants.delivery,
                        onTap: () {},
                      ),
                      SizedBox(height: .5.h),
                      const _CustomDivider(),
                      SizedBox(height: .5.h),
                      _MenuTile(
                        icon: IconlyLight.setting,
                        label: TextConstants.settings,
                        hasDivider: false,
                        onTap: () {},
                      ),
                      SizedBox(height: 1.h),
                      Expanded(
                        child: Align(
                          alignment: const Alignment(0.0, 0.70),
                          child: _MenuTile(
                            icon: IconlyLight.logout,
                            label: TextConstants.signOut,
                            hasDivider: false,
                            onTap: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: -6.5.h,
              right: -moveRightController.lowerBound * 0.35,
              child: const _MoonDecoration(),
            ),
            Positioned(
              top: 8.5.h,
              right: -moveRightController.lowerBound * 0.25,
              child: const RoundedHollow(),
            ),
            Positioned(
              left: 12.w,
              bottom: 18.5.h,
              child: const _MoonDecoration(radius: 4.5),
            ),
            Positioned(
              left: 35.w,
              bottom: 30.h,
              child: const RoundedHollow(),
            ),
            Positioned.fill(
              top: 8.5.h,
              bottom: -2.0.h,
              right: moveRightAnimation + 20.w,
              child: ScaledTransformWidget(
                controller: scaleController,
                animationValue: scaleAnimation,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              right: moveRightAnimation,
              child: ScaledTransformWidget(
                controller: scaleController,
                animationValue: scaleAnimation,
                child: GestureDetector(
                  behavior:
                      drawerOpened.value ? HitTestBehavior.translucent : null,
                  onTap: drawerOpened.value
                      ? () => _focusBackHomePage(
                            drawerOpened: drawerOpened,
                            scaleController: scaleController,
                            moveRightController: moveRightController,
                          )
                      : null,
                  child: IgnorePointer(
                    ignoring: drawerOpened.value,
                    child: Material(
                      clipBehavior: Clip.hardEdge,
                      borderRadius: !drawerOpened.value
                          ? null
                          : BorderRadius.circular(20.0),
                      child: HomeBodyContent(
                        onPressDrawer: () => _openDrawer(
                          drawerOpened: drawerOpened,
                          scaleController: scaleController,
                          moveRightController: moveRightController,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MoonDecoration extends StatelessWidget {
  final double radius;

  const _MoonDecoration({
    super.key,
    this.radius = 6.5,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius.h,
      backgroundColor: ColorName.blueBaseMoon.withOpacity(0.60),
    );
  }
}

class _MenuTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool hasDivider;
  final VoidCallback onTap;

  const _MenuTile({
    super.key,
    required this.icon,
    required this.label,
    this.hasDivider = true,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.only(
        bottomRight: Radius.circular(15.0),
        topRight: Radius.circular(15.0),
      ),
      clipBehavior: Clip.hardEdge,
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: sidePadding, vertical: 1.25.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white),
              SizedBox(width: 3.w),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 17.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: sidePadding),
      child: Row(
        children: [
          const SizedBox(width: 24),
          SizedBox(width: 3.w),
          const Expanded(
            child: Divider(thickness: 0.3, color: ColorName.dividerColor),
          ),
        ],
      ),
    );
  }
}
