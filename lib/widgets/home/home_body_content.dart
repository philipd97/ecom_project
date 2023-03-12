import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:sizer/sizer.dart';

import '../../constants/styling.dart';
import '../../constants/text_constant.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../views/basket_page.dart';
import '../../views/favorite_page.dart';
import '../../views/profile_page.dart';
import '../../views/search_page.dart';
import '../custom_row_search_field.dart';
import '../scaffold_customed.dart';
import '../text_arrow_tappable.dart';
import 'product_card.dart';
import 'tappable_category.dart';

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
              CustomRowSearchField(
                leadingWidget: Material(
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
                onSubmitted: (value) {
                  context.push('/${SearchPage.routeName}');
                },
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
