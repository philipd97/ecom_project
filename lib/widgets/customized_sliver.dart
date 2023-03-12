import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecom_project/constants/styling.dart';
import 'package:ecom_project/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../helpers/extension_helpers.dart';

class CustomizedSliver extends StatelessWidget {
  final String title;
  final List<Widget> slivers;

  const CustomizedSliver({
    super.key,
    required this.title,
    required this.slivers,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: calculate text height & add to expandedheight instead

    final expandedHeight = kToolbarHeight + 10.h;

    final mediaQueryTop = MediaQuery.of(context).padding.top;
    final collapsedAppBarHeight = kToolbarHeight + mediaQueryTop;
    final expandedAppBarHeight = expandedHeight + mediaQueryTop;

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: ColorName.greyLightBackground,
          elevation: 0.0,
          pinned: true,
          expandedHeight: expandedHeight,
          flexibleSpace: LayoutBuilder(
            builder: (context, constraint) {
              final paddingWidth = constraint.maxHeight.normalized(
                normalizedRangeMin: 72.0,
                normalizedRangeMax: sidePadding,
                selfRangeMin: collapsedAppBarHeight,
                selfRangeMax: expandedAppBarHeight,
              );
              return FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(
                  left: paddingWidth,
                  bottom: 6,
                ),
                title: AutoSizeText(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    color: Colors.black,
                  ),
                ),
              );
            },
          ),
        ),
        ...slivers,
      ],
    );
  }
}
