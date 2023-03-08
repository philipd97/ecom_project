import 'package:ecom_project/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sizer/sizer.dart';

const _categories = [
  'Wearable',
  'Laptops',
  'Phones',
  'Drones',
];

class TappableCategories extends HookWidget {
  const TappableCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useValueNotifier<int>(0);
    final value = useValueListenable(selectedIndex);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          _categories.length,
          (index) => _CategoryButton(
            key: ValueKey(index),
            label: _categories[index],
            isSelected: value == index,
            onPressed: () {
              if (selectedIndex.value == index) return;
              selectedIndex.value = index;
            },
          ),
        ),
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isSelected;

  const _CategoryButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.w),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: isSelected
              ? const Border(
                  bottom: BorderSide(
                    width: 3.0,
                    color: ColorName.blueBase,
                  ),
                )
              : null,
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            label,
            style: TextStyle(
              letterSpacing: 0.5,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
              color: isSelected ? ColorName.blueBase : ColorName.greySecondary,
            ),
          ),
        ),
      ),
    );
  }
}
