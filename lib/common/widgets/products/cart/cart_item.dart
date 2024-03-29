import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_funcion.dart';
import '../../images/rounded_image.dart';
import '../../texts/brand_title_text_with_veried_icon.dart';
import '../../texts/product_title_text.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RoundedImage(
            imageUrl: MyImages.imageProductCard1,
            width: 60,
            height: 60,
            padding: const EdgeInsets.all(Sizes.sm),
            backgroundColor: HelperFunctions.isDarkMode(context)
                ? MyColors.darkerGrey
                : MyColors.light),
        const SizedBox(width: Sizes.spaceBtwItems),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BrandTitleWithVerifiedIcon(title: 'Nike'),
              const Flexible(
                child: ProductTitleText(
                  title: 'Black Sports shoes',
                  maxLines: 1,
                ),
              ),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'Color ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: 'Green ',
                    style: Theme.of(context).textTheme.bodyLarge),
                TextSpan(
                    text: 'Size ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: 'EU 43 ',
                    style: Theme.of(context).textTheme.bodyLarge),
              ]))
            ],
          ),
        ),
      ],
    );
  }
}
