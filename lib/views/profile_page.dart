import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:sizer/sizer.dart';

import '../constants/styling.dart';
import '../constants/text_constant.dart';
import '../gen/assets.gen.dart';
import '../widgets/customized_sliver.dart';
import '../widgets/scaffold_customed.dart';
import '../widgets/white_card_layout.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = '/profile-page';

  const ProfilePage({super.key});

  // max = 80, original > 80 clamp between  80 & expandedheight + mediaquery top
  // 72 & 0
  // if 80 = 72,
  // if expandedHeight + MediaQuery = 0

  @override
  Widget build(BuildContext context) {
    final profPicSize = 5.75.h;
    final titleSpaceSizedBox = SizedBox(height: 3.h);

    return ScaffoldCustomed(
      hasAppBar: false,
      child: CustomizedSliver(
        title: TextConstants.myProfile,
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: sidePadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8.5.h),
                      Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          WhiteCardLayout(
                            circularRadius: 20.0,
                            child: Column(
                              children: [
                                SizedBox(height: profPicSize * 0.70),
                                const Text(
                                  'Name',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20.0,
                                  ),
                                ),
                                SizedBox(height: 1.h),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(IconlyLight.location),
                                    SizedBox(width: 3.w),
                                    const Flexible(
                                      child: _AddressText(
                                        text:
                                            'Address: 43 Oxford Road M13 4GR Manchester, UK',
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: -profPicSize,
                            child: CircleAvatar(
                              foregroundImage:
                                  AssetImage(Assets.images.noFavourite.path),
                              radius: profPicSize,
                            ),
                          ),
                        ],
                      ),
                      titleSpaceSizedBox,
                      _TitleTile(
                        title: TextConstants.editProfile,
                        onTap: () {},
                      ),
                      titleSpaceSizedBox,
                      _TitleTile(
                        title: TextConstants.shoppingAddress,
                        onTap: () {},
                      ),
                      titleSpaceSizedBox,
                      _TitleTile(
                        title: TextConstants.orderHistory,
                        onTap: () {},
                      ),
                      titleSpaceSizedBox,
                      _TitleTile(
                        title: TextConstants.cards,
                        onTap: () {},
                      ),
                      titleSpaceSizedBox,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TitleTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _TitleTile({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return WhiteCardLayout(
      circularRadius: 20.0,
      padding: EdgeInsets.zero,
      child: Material(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(20.0),
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: sidePadding,
              vertical: 3.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                const Icon(IconlyLight.arrow_right_2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AddressText extends StatelessWidget {
  final String text;

  const _AddressText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(),
    );
  }
}
