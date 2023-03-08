import '../../constants/styling.dart';
import '../../constants/text_constant.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import 'add_remove_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BasketItem extends StatelessWidget {
  const BasketItem({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(  
          horizontal: 2.w,
          vertical: 3.h,
        ),
        child: Row(
          children: [
            Assets.images.noFavourite.image(height: 12.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '2020 Apple iPad Air 10.9"',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  '\$579.00',
                  style: blueTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    const Text(
                      TextConstants.quantity,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: ColorName.greySecondary,
                      ),
                    ),
                    SizedBox(width: 3.w),
                    AddRemoveButton(
                      addRemove: AddRemove.remove,
                      onTap: () {},
                    ),
                    SizedBox(width: 2.w),
                    const Text(
                      '1',
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 2.w),
                    AddRemoveButton(
                      addRemove: AddRemove.add,
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
