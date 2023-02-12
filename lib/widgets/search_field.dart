import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iconly/iconly.dart';

import '../constants/text_constant.dart';
import '../gen/colors.gen.dart';

class SearchField extends HookWidget {
  final void Function(String value)? onSubmitted;

  const SearchField({
    super.key,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();

    final hasText = useState<bool>(false);

    useEffect(
      () {
        controller.addListener(() {
          hasText.value = controller.text.trim().isNotEmpty;
        });
        return null;
      },
      [controller],
    );

    return TextField(
      controller: controller,
      onSubmitted: onSubmitted,
      textInputAction: TextInputAction.search,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: TextConstants.search,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          color: ColorName.greySecondary,
        ),
        prefixIcon: const Icon(
          IconlyLight.search,
          color: Colors.black,
        ),
        suffixIcon: hasText.value
            ? Material(
                type: MaterialType.transparency,
                shape: const CircleBorder(),
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  onTap: () => controller.clear(),
                  child: const Icon(
                    Icons.cancel_outlined,
                    color: ColorName.greySecondary,
                  ),
                ),
              )
            : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
      ),
    );
  }
}
