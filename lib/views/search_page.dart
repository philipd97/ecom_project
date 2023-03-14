import 'dart:developer';

import '../widgets/search_product_card.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/styling.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/custom_row_search_field.dart';
import '../widgets/scaffold_customed.dart';

class StaggeredTile {
  const StaggeredTile({
    required this.crossAxisCount,
    required this.mainAxisCount,
  });

  final int crossAxisCount;
  final int mainAxisCount;
}

class SearchPage extends StatefulWidget {
  static const routeName = '/search-page';
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldCustomed(
      hasAppBar: false,
      child: Column(
        children: [
          const SizedBox(height: kToolbarHeight),
          CustomRowSearchField(
            leadingWidget: Padding(
              padding: EdgeInsets.only(left: sidePadding),
              child: const CustomBackButton(),
            ),
            onSubmitted: (value) {},
          ),
          SizedBox(height: 5.h),
          Text(
            'Found 6 results',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          SizedBox(height: 2.h),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.only(
                top: 8.5.h,
                left: sidePadding,
                right: sidePadding,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 40.h,
                crossAxisSpacing: 5.w,
              ),
              itemCount: 8,
              itemBuilder: (context, index) => LayoutBuilder(
                builder: (context, constraint) {
                  log('maxheight: $constraint');
                  return Align(
                    alignment: index.isEven
                        ? Alignment.topCenter
                        : Alignment.bottomCenter,
                    child: SizedBox(
                      height: constraint.maxHeight * 0.80,
                      child: const SearchProductCard(),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
