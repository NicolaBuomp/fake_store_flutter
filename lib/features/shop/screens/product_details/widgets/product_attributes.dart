import 'package:fake_store_flutter/common/widgets/chips/choice_chip.dart';
import 'package:fake_store_flutter/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:fake_store_flutter/common/widgets/texts/product_price_text.dart';
import 'package:fake_store_flutter/common/widgets/texts/product_title_text.dart';
import 'package:fake_store_flutter/common/widgets/texts/section_heading.dart';
import 'package:fake_store_flutter/utils/constants/colors.dart';
import 'package:fake_store_flutter/utils/constants/sizes.dart';
import 'package:fake_store_flutter/utils/helpers/helper_funcion.dart';
import 'package:flutter/material.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    return Column(
      children: [
        TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: isDark ? TColors.darkerGrey : TColors.grey,
          child: Column(
            children: [
              Row(
                children: [
                  const TSectionHeading(
                    title: 'Variant',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const ProductTitleText(
                            title: 'Price : ',
                            smallSize: true,
                          ),
                          Text(
                            '\$25',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(
                            width: TSizes.spaceBtwItems,
                          ),
                          const TProductPriceText(price: '20'),
                        ],
                      ),
                      Row(
                        children: [
                          const ProductTitleText(
                            title: 'Stock : ',
                            smallSize: true,
                          ),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              const ProductTitleText(
                title:
                    'This is the Description of the product anc it can go up to max 4 lines.',
                smallSize: true,
                maxLines: 4,
              )
            ],
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(
              title: 'Colors',
              showActionButton: false,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                CustomChoiceChip(
                    text: 'Green', selected: true, onSelected: (value) {}),
                CustomChoiceChip(
                    text: 'Blue', selected: false, onSelected: (value) {}),
                CustomChoiceChip(
                    text: 'Yellow', selected: false, onSelected: (value) {}),
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(
              title: 'Size',
              showActionButton: false,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                CustomChoiceChip(
                    text: 'EU 40', selected: true, onSelected: (value) {}),
                CustomChoiceChip(
                    text: 'EU 41', selected: false, onSelected: (value) {}),
                CustomChoiceChip(
                    text: 'EU 42', selected: false, onSelected: (value) {}),
              ],
            )
          ],
        )
      ],
    );
  }
}
