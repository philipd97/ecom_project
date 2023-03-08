import 'package:ecom_project/gen/colors.gen.dart';
import 'package:ecom_project/widgets/card_payment_logo.dart';

import '../../gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sizer/sizer.dart';

enum PaymentMethodEnum {
  visa,
  masterCard,
}

class PaymentMethod extends HookWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    final paymentType = useState<PaymentMethodEnum>(PaymentMethodEnum.visa);

    return Column(
      children: [
        _PaymentRadioTile(
          value: PaymentMethodEnum.visa,
          groupValue: paymentType.value,
          onChanged: (newPayment) => paymentType.value = newPayment,
          imagePath: Assets.images.visa.path,
          content: '**** **** **** 1234',
        ),
        _PaymentRadioTile(
          value: PaymentMethodEnum.masterCard,
          groupValue: paymentType.value,
          onChanged: (newPayment) => paymentType.value = newPayment,
          imagePath: Assets.images.mastercard.path,
          content: '**** **** **** 1234',
        ),
      ],
    );
  }
}

class _PaymentRadioTile extends StatelessWidget {
  final PaymentMethodEnum value;
  final PaymentMethodEnum groupValue;
  final void Function(PaymentMethodEnum newValue) onChanged;
  final String imagePath;
  final String content;

  const _PaymentRadioTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.imagePath,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile<PaymentMethodEnum>(
      value: value,
      dense: true,
      contentPadding: EdgeInsets.zero,
      groupValue: groupValue,
      onChanged: (newPaymentType) {
        if (newPaymentType == null || groupValue == newPaymentType) {
          return;
        }
        onChanged(newPaymentType);
      },
      title: Row(
        children: [
          CardPaymentLogo(imagePath: imagePath),
          SizedBox(width: 3.w),
          Text(
            content,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
