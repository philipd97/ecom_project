import 'package:ecom_project/views/checkout_page.dart';
import 'package:ecom_project/widgets/custom_rounded_button.dart';
import 'package:ecom_project/widgets/total_price_row.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:sizer/sizer.dart';

import '../constants/styling.dart';
import '../constants/text_constant.dart';
import '../widgets/basket/basket_item.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/scaffold_customed.dart';

class BasketPage extends StatelessWidget {
  static const routeName = 'basket_page';
  const BasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustomed(
      titleLabel: TextConstants.basket,
      trailingWidget: Padding(
        padding: EdgeInsets.only(right: 2.w),
        child: CustomIconButton(
          onPressed: () {},
          iconWidget: const Icon(
            IconlyLight.delete,
            color: Colors.red,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: sidePadding),
        child: Column(
          children: [
            SizedBox(height: 5.h),
            _BannerNotice(),
            SizedBox(height: 2.h),
            const BasketItem(),
            SizedBox(height: 2.h),
            const BasketItem(),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const TotalPriceRow(),
                  SizedBox(height: 4.h),
                  CustomRoundedButton(
                    onPressed: () =>
                        GoRouter.of(context).push('/${CheckoutPage.routeName}'),
                    label: TextConstants.checkout,
                  ),
                  SizedBox(height: 2.h),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _BannerNotice extends StatelessWidget {
  const _BannerNotice({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xFFD3F2FF),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(1.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              IconlyLight.notification,
              size: 24,
            ),
            SizedBox(width: 0.5.w),
            const Text(
              TextConstants.deliveryNotice,
              style: TextStyle(
                fontSize: 11.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
