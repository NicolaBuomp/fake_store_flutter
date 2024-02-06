import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_funcion.dart';
import '../custom_shapes/container/rounded_container.dart';
import 'brand_card.dart';

class BrandShowcase extends StatelessWidget {
  const BrandShowcase({
    super.key, required this.images,
  });
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      showBorder: true,
      borderColor: MyColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(Sizes.md),
      margin:
      const EdgeInsets.only(bottom: Sizes.spaceBtwItems),
      child: Column(
        children: [
          const BrandCard(showBorder: false),
          Row(
              children: images.map((image) => brandTopProductImageWidget(image, context)).toList()
          )
        ],
      ),
    );
  }
}

Widget brandTopProductImageWidget(String image, context) {
  return Expanded(
    child: RoundedContainer(
      height: 100,
      backgroundColor:
      HelperFunctions.isDarkMode(context)
          ? MyColors.darkerGrey
          : MyColors.light,
      margin:
      const EdgeInsets.only(right: Sizes.sm),
      padding: const EdgeInsets.all(Sizes.md),
      child: Image(
        fit: BoxFit.contain,
        image:
        AssetImage(image),
      ),
    ),
  );
}
