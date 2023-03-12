import 'package:ecom_project/constants/styling.dart';
import 'package:ecom_project/constants/text_constant.dart';
import 'package:ecom_project/gen/assets.gen.dart';
import 'package:ecom_project/gen/colors.gen.dart';
import 'package:ecom_project/widgets/blue_tappable_text.dart';
import 'package:ecom_project/widgets/card_payment_logo.dart';
import 'package:ecom_project/widgets/checkout/payment_method.dart';
import 'package:ecom_project/widgets/custom_rounded_button.dart';
import 'package:ecom_project/widgets/scaffold_customed.dart';
import 'package:ecom_project/widgets/total_price_row.dart';
import 'package:ecom_project/widgets/white_card_layout.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:sizer/sizer.dart';

class CheckoutPage extends StatelessWidget {
  static const routeName = 'checkout_page';
  const CheckoutPage({super.key});

  void _openConfirmPaySheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      builder: (context) {
        return const _ConfirmPayBottomSheetContent();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustomed(
      titleLabel: TextConstants.checkout,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: sidePadding),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const _CheckoutLabel(label: TextConstants.shippingInfo),
                BlueTappableText(
                  label: TextConstants.change,
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 1.h),
            WhiteCardLayout(
              child: Column(
                children: [
                  const _IconTextRow(
                    iconData: IconlyLight.profile,
                    label: 'Testinglabel',
                  ),
                  SizedBox(height: 1.5.h),
                  const _IconTextRow(
                    iconData: IconlyLight.location,
                    label: '43 Oxford Road M13 4GR Manchester, UK',
                  ),
                  SizedBox(height: 1.5.h),
                  const _IconTextRow(
                    iconData: IconlyLight.call,
                    label: '+234 9011039271',
                  ),
                ],
              ),
            ),
            SizedBox(height: 2.h),
            const Align(
              alignment: Alignment.centerLeft,
              child: _CheckoutLabel(
                label: TextConstants.paymentMethod,
              ),
            ),
            SizedBox(height: 2.h),
            const WhiteCardLayout(child: PaymentMethod()),
            SizedBox(height: 2.h),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const TotalPriceRow(),
                  SizedBox(height: 4.h),
                  CustomRoundedButton(
                    onPressed: () => _openConfirmPaySheet(context),
                    label: TextConstants.confirmAndPay,
                  ),
                ],
              ),
            ),
            SizedBox(height: 3.h),
          ],
        ),
      ),
    );
  }
}

class _CheckoutLabel extends StatelessWidget {
  final String label;
  final FontWeight fontWeight;
  final Color color;

  const _CheckoutLabel({
    super.key,
    required this.label,
    this.fontWeight = FontWeight.w600,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 16.0,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}

class _IconTextRow extends StatelessWidget {
  final IconData iconData;
  final String label;

  const _IconTextRow({
    super.key,
    required this.iconData,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(iconData),
        SizedBox(width: 2.w),
        Flexible(
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15.0,
            ),
          ),
        ),
      ],
    );
  }
}

class _ConfirmPayBottomSheetContent extends StatelessWidget {
  // TODO: pass in selected payment type

  const _ConfirmPayBottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return SizedBox(
          height: constraint.maxHeight,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: sidePadding + 2.w,
              vertical: 5.h,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const _CheckoutLabel(
                      label: TextConstants.confirmAndPay,
                    ),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: TextConstants.products,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          TextSpan(text: ': '),
                          TextSpan(
                            text: '2',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 3.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: ColorName.greyLightBackground,
                    border: Border.all(
                      width: 1,
                      color: ColorName.greyBtnNotSelected,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const _CheckoutLabel(
                            label: 'My credit card',
                            fontWeight: FontWeight.bold,
                          ),
                          CardPaymentLogo(imagePath: Assets.images.visa.path),
                        ],
                      ),
                      SizedBox(height: 2.5.h),
                      const Text(
                        '**** **** **** 1234',
                        style: TextStyle(
                          fontSize: 36.0,
                        ),
                      ),
                      SizedBox(height: 2.5.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          _CheckoutLabel(
                            label: 'Rosina Doe',
                            fontWeight: FontWeight.w500,
                            color: ColorName.greySecondary,
                          ),
                          _CheckoutLabel(
                            label: '04/26',
                            fontWeight: FontWeight.w500,
                            color: ColorName.greySecondary,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const TotalPriceRow(),
                      SizedBox(height: 4.h),
                      CustomRoundedButton(
                        onPressed: () {},
                        label: TextConstants.confirmAndPay,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
