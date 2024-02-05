import 'package:fake_store_flutter/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:fake_store_flutter/common/widgets/images/circular_image.dart';
import 'package:fake_store_flutter/common/widgets/texts/brand_title_text_with_veried_icon.dart';
import 'package:fake_store_flutter/common/widgets/texts/product_price_text.dart';
import 'package:fake_store_flutter/common/widgets/texts/product_title_text.dart';
import 'package:fake_store_flutter/utils/constants/colors.dart';
import 'package:fake_store_flutter/utils/constants/enums.dart';
import 'package:fake_store_flutter/utils/constants/image_strings.dart';
import 'package:fake_store_flutter/utils/constants/sizes.dart';
import 'package:fake_store_flutter/utils/helpers/helper_funcion.dart';
import 'package:flutter/material.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            RoundedContainer(
              radius: Sizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.sm, vertical: Sizes.xs),
              child: Text(
                '25%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: TColors.black),
              ),
            ),
            const SizedBox(
              width: Sizes.spaceBtwItems,
            ),
            Text(
              '\$250',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(
              width: Sizes.spaceBtwItems,
            ),
            const ProductPriceText(
              price: '175',
              isLarge: true,
            ),
          ],
        ),
        const SizedBox(
          height: Sizes.spaceBtwItems / 1.5,
        ),
        const ProductTitleText(title: 'Nike Jordan 1 High'),
        const SizedBox(
          height: Sizes.spaceBtwItems / 1.5,
        ),
        Row(
          children: [
            const ProductTitleText(title: 'Status'),
            const SizedBox(
              width: Sizes.spaceBtwItems,
            ),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium)
          ],
        ),
        const SizedBox(
          height: Sizes.spaceBtwItems / 1.5,
        ),
        Row(
          children: [
            CircularImage(
              image: TImages.shoeIcon,
              width: 32,
              height: 32,
              overlayColor: isDark ? TColors.white : TColors.black,
            ),
            const BrandTitleWithVerifiedIcon(
              title: 'Nike',
              brandTextSize: TextSizes.medium,
            ),
          ],
        ),
      ],
    );
  }
}
