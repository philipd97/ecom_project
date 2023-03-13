import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:sizer/sizer.dart';

import '../constants/styling.dart';
import '../constants/text_constant.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/custom_rounded_button.dart';
import '../widgets/product_detail/colors_selector.dart';
import '../widgets/product_detail/product_detail_image_builder.dart';
import '../widgets/scaffold_customed.dart';
import '../widgets/text_arrow_tappable.dart';

class ProductDetailPage extends StatelessWidget {
  static const routeName = '/product-detail-page';

  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustomed(
      trailingWidget: CustomIconButton(
        onPressed: () {},
        iconWidget: const Icon(IconlyLight.heart),
      ),
      child: Column(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height:
                  100.h - kToolbarHeight - MediaQuery.of(context).padding.top,
              child: Column(
                children: [
                  const Expanded(
                    flex: 2,
                    child: ProductDetailImageBuilder(),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: sidePadding,
                        vertical: 2.h,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '2020 Apple iPad Air 10.9"',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0,
                            ),
                          ),
                          SizedBox(height: 1.h),
                          const ColorsSelector(),
                          SizedBox(height: 3.5.h),
                          const Text(
                            'Get Apple TV + free for a year',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0,
                            ),
                          ),
                          SizedBox(height: 1.h),
                          const Text(
                            'AAvailable when you purchase any new iPhone, iPad, iPod Touch, Mac or Apple TV, £4.99/month after free trial',
                            style: TextStyle(
                              letterSpacing: 0.2,
                              height: 1.38,
                            ),
                          ),
                          TextArrowTappable(
                            text: TextConstants.fullDesc,
                            padding: EdgeInsets.symmetric(
                                vertical: 1.h, horizontal: 0.2.w),
                            onTap: () {},
                          ),
                          SizedBox(height: 3.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                TextConstants.total,
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                              Text(
                                '\$ 579',
                                style: blueTextStyle.copyWith(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 3.h),
                          CustomRoundedButton(
                            onPressed: () {},
                            label: TextConstants.addToBasket,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
