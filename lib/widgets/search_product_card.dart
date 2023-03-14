import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecom_project/constants/styling.dart';
import 'package:ecom_project/gen/assets.gen.dart';
import 'package:ecom_project/views/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class SearchProductCard extends StatelessWidget {
  const SearchProductCard({super.key});

  void _goToProductDetails(BuildContext context) {
    context.push(ProductDetailPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        final maxHeight = constraint.maxHeight;
        final imageHeight = maxHeight * 0.50;
        final imageHeightTop = imageHeight * 0.15;

        return Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned.fill(
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () => _goToProductDetails(context),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: imageHeightTop),
                          AutoSizeText(
                            'Apple Watch',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                          SizedBox(height: maxHeight * 0.050),
                          Text(
                            '\$ 359',
                            textAlign: TextAlign.center,
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
            Positioned(
              top: -50,
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
