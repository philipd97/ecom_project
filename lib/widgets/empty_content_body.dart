import 'dart:async';
import 'dart:ui' as ui;
import 'package:ecom_project/gen/colors.gen.dart';
import 'package:ecom_project/widgets/custom_rounded_button.dart';
import 'package:sizer/sizer.dart';

import 'package:ecom_project/constants/text_constant.dart';
import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';

class EmptyContentBody extends StatelessWidget {
  final String assetPath;
  final String text;
  final String description;

  const EmptyContentBody({
    super.key,
    required this.assetPath,
    required this.text,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final image = Image.asset(assetPath);
    final completer = Completer<ui.Image>();
    image.image
        .resolve(const ImageConfiguration())
        .addListener(ImageStreamListener((info, _) {
      completer.complete(info.image);
    }));

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        children: [
          FutureBuilder<ui.Image>(
            future: completer.future,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final height = (snapshot.data?.height.toDouble()) ?? 0.00;
                final width = (snapshot.data?.width.toDouble()) ?? 0.00;
                return Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    image,
                    Positioned(
                      bottom: -(height * 0.2),
                      child: Column(
                        children: [
                          Text(
                            text,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 28.0,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 1.5.h),
                          const Text(
                            TextConstants.startOrderingDesc,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 2.h),
                          CustomRoundedButton(
                            needWidth: false,
                            backgroundColor: ColorName.tealBtn,
                            padding: EdgeInsets.symmetric(
                              vertical: 1.8.h,
                              horizontal: 10.w,
                            ),
                            label: TextConstants.startOrdering,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}
