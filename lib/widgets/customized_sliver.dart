import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecom_project/constants/styling.dart';
import 'package:ecom_project/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import '../helpers/extension_helpers.dart';
import 'package:ecom_project/gen/fonts.gen.dart';

class CustomizedSliver extends StatelessWidget {
  final String title;
  final List<Widget> slivers;

  const CustomizedSliver({
    super.key,
    required this.title,
    required this.slivers,
  });

  Size _textSize(String text, TextStyle textStyle, BuildContext context) {
    final TextPainter painter = TextPainter(
      text: TextSpan(text: text, style: textStyle),
      textScaleFactor: MediaQuery.of(context).textScaleFactor,
      textDirection: TextDirection.ltr,
    )..layout();
    return painter.size;
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(
      fontSize: 34.0,
      color: Colors.black,
      fontFamily: FontFamily.raleway,
      fontWeight: FontWeight.bold,
    );
    final Size textSize = _textSize(title, textStyle, context);

    final mediaQueryTop = MediaQuery.of(context).padding.top;
    final collapsedAppBarHeight = kToolbarHeight + mediaQueryTop;
    final expandedAppBarHeight =
        kToolbarHeight + mediaQueryTop * 2 + textSize.height;

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: ColorName.greyLightBackground,
          elevation: 0.0,
          pinned: true,
          expandedHeight: expandedAppBarHeight,
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
