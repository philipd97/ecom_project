import 'package:ecom_project/constants/styling.dart';
import 'package:ecom_project/constants/text_constant.dart';
import 'package:ecom_project/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:iconly/iconly.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
