import 'package:ecom_project/constants/styling.dart';
import 'package:ecom_project/constants/text_constant.dart';
import 'package:ecom_project/gen/assets.gen.dart';
import 'package:ecom_project/gen/colors.gen.dart';
import 'package:ecom_project/views/basket_page.dart';
import 'package:ecom_project/views/favorite_page.dart';
import 'package:ecom_project/views/profile_page.dart';
import 'package:ecom_project/widgets/home/product_card.dart';
import 'package:ecom_project/widgets/home/tappable_category.dart';
import 'package:ecom_project/widgets/scaffold_customed.dart';
import 'package:ecom_project/widgets/search_field.dart';
import 'package:ecom_project/widgets/text_arrow_tappable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:sizer/sizer.dart';

class HomeBodyContent extends StatelessWidget {
  final VoidCallback onPressDrawer;

  const HomeBodyContent({super.key, required this.onPressDrawer});

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustomed(
      hasAppBar: false,
      bottomNavigationBar: const _BottomNav(),
      child: Padding(
        padding: EdgeInsets.only(left: sidePadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: kToolbarHeight),
              Row(
                children: [
                  Material(
                    type: MaterialType.transparency,
                    shape: const CircleBorder(),
                    clipBehavior: Clip.hardEdge,
                    child: InkWell(
                      onTap: onPressDrawer,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Assets.icons.menuIcon.image(),
                      ),
                    ),
                  ),
                  SizedBox(width: 1.5.w),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: sidePadding),
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
              SizedBox(height: 3.h),
              const TappableCategories(),
              Container(
                height: 40.h,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF393939).withOpacity(0.1),
                      blurRadius: 60.0,
                    ),
                  ],
                ),
                child: OverflowBox(
                  maxWidth: 100.w,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return const ProductCard();
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextArrowTappable(
                  text: TextConstants.seeMore,
                  onTap: () {},
                ),
              ),
              SizedBox(height: 2.h),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomNav extends StatelessWidget {
  const _BottomNav();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 1.h,
        bottom: 2.h,
        left: sidePadding,
        right: sidePadding,
      ),
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
            onPressed: () =>
                GoRouter.of(context).push('/${FavoritePage.routeName}'),
            icon: const Icon(
              IconlyLight.heart,
              color: ColorName.bottomNavBarIcon,
            ),
          ),
          IconButton(
            onPressed: () =>
                GoRouter.of(context).push('/${ProfilePage.routeName}'),
            icon: const Icon(
              IconlyLight.profile,
              color: ColorName.bottomNavBarIcon,
            ),
          ),
          IconButton(
            onPressed: () =>
                GoRouter.of(context).push('/${BasketPage.routeName}'),
            icon: const Icon(
              IconlyLight.buy,
              color: ColorName.bottomNavBarIcon,
            ),
          ),
        ],
      ),
    );
  }
}
