import 'package:ecom_project/views/create_account_page.dart';
import 'package:ecom_project/views/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../gen/colors.gen.dart';
import '../widgets/home/drawer_menu.dart';
import '../widgets/home/home_body_content.dart';
import '../widgets/home/scaled_transform_widget.dart';
import '../widgets/rounded_hollow.dart';

class HomePage extends HookWidget {
  static const routeName = '/home-page';

  const HomePage({super.key});

  void _triggerDrawer({
    required ValueNotifier<bool> drawerOpened,
    required AnimationController scaleController,
    required AnimationController moveRightController,
  }) {
    FocusManager.instance.primaryFocus?.unfocus();
    drawerOpened.value = !drawerOpened.value;

    if (drawerOpened.value) {
      scaleController.reverse();
      moveRightController.reverse();
    } else {
      scaleController.forward();
      moveRightController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    const animDuration = Duration(milliseconds: 350);

    final drawerOpened = useState<bool>(false);

    final scaleController = useAnimationController(
      initialValue: 1.0,
      lowerBound: 0.65,
      upperBound: 1.0,
      duration: animDuration,
    );

    final moveRightController = useAnimationController(
      initialValue: 0.0,
      lowerBound: -80.w,
      upperBound: 0.0,
      duration: animDuration,
    );

    return BackButtonListener(
      onBackButtonPressed: () {
        if (drawerOpened.value) {
          _triggerDrawer(
            drawerOpened: drawerOpened,
            scaleController: scaleController,
            moveRightController: moveRightController,
          );
          return Future.value(true);
        } else {
          return Future.value(false);
        }
      },
      child: Scaffold(
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
                onPressed: () => context.push('${LoginPage.routeName}'),
                child: Text('login')),
            TextButton(
                onPressed: () =>
                    context.push('${CreateAccountPage.routeName}'),
                child: Text('register')),
            SizedBox(height: 2.h),
          ],
        ),
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
                  child: const DrawerMenu(),
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
                right: moveRightController.value + 20.w,
                child: ScaledTransformWidget(
                  controller: scaleController,
                  animationValue: scaleController.value,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                right: moveRightController.value,
                child: ScaledTransformWidget(
                  controller: scaleController,
                  animationValue: scaleController.value,
                  child: GestureDetector(
                    behavior:
                        drawerOpened.value ? HitTestBehavior.translucent : null,
                    onTap: drawerOpened.value
                        ? () => _triggerDrawer(
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
                          onPressDrawer: () => _triggerDrawer(
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
