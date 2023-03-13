import 'package:ecom_project/constants/text_constant.dart';
import 'package:ecom_project/gen/assets.gen.dart';
import 'package:ecom_project/widgets/empty_content_body.dart';
import 'package:ecom_project/widgets/scaffold_customed.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FavoritePage extends StatelessWidget {
  static const routeName = '/favorite-page';

  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustomed(
      child: Column(
        children: [
          // const AppBarCustomed(title: TextConstants.favorites),
          SizedBox(height: 5.h),
          EmptyContentBody(
            assetPath: Assets.images.noFavourite.path,
            text: TextConstants.noFavYet,
            description: '',
          ),
        ],
      ),
    );
  }
}
