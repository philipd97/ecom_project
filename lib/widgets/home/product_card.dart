import 'dart:developer';

import 'package:ecom_project/constants/styling.dart';
import 'package:ecom_project/gen/assets.gen.dart';
import 'package:ecom_project/gen/colors.gen.dart';
import 'package:ecom_project/views/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  void _goToProductDetails(BuildContext context) {
    context.push('/${ProductDetailPage.routeName}');
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        log('Main Constarint: $constraint ${constraint.maxHeight * 0.1}');
        final maxHeight = constraint.maxHeight;
        final imageHeight = maxHeight * 0.420;
        final imageHeightTop = imageHeight * 0.15;

        return Stack(
          children: [
            Positioned(
              child: Padding(
                padding: EdgeInsets.fromLTRB(3.w, 0.0, 3.w, 1.h),
                child: Column(
                  children: [
                    SizedBox(height: maxHeight * 0.20),
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
                                      height: imageHeight - imageHeightTop),
                                  Text(
                                    'Apple Watch',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  SizedBox(height: maxHeight * 0.035),
                                  Text(
                                    'Series 6 . Red',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: ColorName.greySecondary,
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
                                  SizedBox(
                                    height: constraint.maxHeight * 0.075,
                                  )
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
