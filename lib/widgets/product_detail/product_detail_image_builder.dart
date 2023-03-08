import 'package:ecom_project/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ProductDetailImageBuilder extends HookWidget {
  const ProductDetailImageBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController(
      viewportFraction: 0.50,
    );

    final pageIndex = useState<int>(0);

    useEffect(
      () {
        pageController.addListener(() {});
        return null;
      },
      [pageController],
    );

    return PageView.builder(
      controller: pageController,
      itemCount: 3,
      itemBuilder: (context, index) {
        return Transform.scale(
          scale: index == 0 ? 1.25 : 1,
          child: Assets.images.noFavourite.image(),
        );
      },
    );
  }
}
