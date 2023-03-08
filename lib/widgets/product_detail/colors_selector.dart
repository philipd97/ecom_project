import 'package:ecom_project/constants/text_constant.dart';
import 'package:ecom_project/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sizer/sizer.dart';

const _dummyName = [
  'Sky Blue',
  'Rose Gold',
  'Green',
];

const _dummyColor = [
  Color(0xFF7485C1),
  Color(0xFFC9A19C),
  Color(0xFFA1C89B),
];

class ColorsSelector extends HookWidget {
  const ColorsSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useValueNotifier(0);
    final value = useValueListenable(selectedIndex);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          TextConstants.colors,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17.0,
          ),
        ),
        SizedBox(height: 1.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              _dummyName.length,
              (index) => _ColorDisplayWidget(
                onPressed: () {
                  if (value == index) return;
                  selectedIndex.value = index;
                },
                isSelected: value == index,
                colorName: _dummyName[index],
                color: _dummyColor[index],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ColorDisplayWidget extends StatelessWidget {
  final String colorName;
  final Color color;
  final bool isSelected;
  final VoidCallback onPressed;

  const _ColorDisplayWidget({
    super.key,
    required this.colorName,
    required this.color,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.only(right: 2.5.w),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          // selected then use greySecondary
          color: isSelected
              ? ColorName.greySecondary
              : ColorName.greyBtnNotSelected,
        ),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            offset: const Offset(0, 4),
            blurRadius: 14.0,
          )
        ],
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.5.h),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 2.h,
                  width: 2.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color,
                  ),
                ),
                SizedBox(width: 2.w),
                Text(
                  colorName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
