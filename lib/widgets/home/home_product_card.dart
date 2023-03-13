import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecom_project/constants/styling.dart';
import 'package:ecom_project/gen/assets.gen.dart';
import 'package:ecom_project/gen/colors.gen.dart';
import 'package:ecom_project/views/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class HomeProductCard extends StatelessWidget {

  const HomeProductCard({
    super.key
  });

  void _goToProductDetails(BuildContext context) {
    context.push('/${ProductDetailPage.routeName}');
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        log('Main Constarint: $constraint ${constraint.maxHeight * 0.1}');
        final maxHeight = constraint.maxHeight;
        final topBox = maxHeight * 0.2;
        final imageHeight = maxHeight * 0.420;
        final imageHeightTop = imageHeight * 0.15;

        return Stack(
          children: [
            Positioned(
              child: Padding(
                padding: EdgeInsets.fromLTRB(3.w, 0.0, 3.w, 1.h),
                child: Column(
                  children: [
                    SizedBox(height: topBox),
                    Expanded(
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Material(
                          type: MaterialType.transparency,
                          child: InkWell(
                            onTap: () => _goToProductDetails(context),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: imageHeight - imageHeightTop,
                                  ),
                                  const Expanded(
                                    child: AutoSizeText(
                                      'Apple Watch',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: maxHeight * 0.035),
                                  const Expanded(
                                    child: Text(
                                      'Series 6 . Red',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: ColorName.greySecondary,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: maxHeight * 0.050),
                                  Text(
                                    '\$ 359',
                                    style: blueTextStyle.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0,
                                    ),
                                  ),
                                  SizedBox(height: maxHeight * 0.075)
                                ],
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
            Positioned(
              top: imageHeightTop,
              left: 0.0,
              right: 0.0,
              child: IgnorePointer(
                child: Material(
                  type: MaterialType.transparency,
                  shape: const CircleBorder(),
                  child: Assets.images.noFavourite.image(
                    height: imageHeight,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
