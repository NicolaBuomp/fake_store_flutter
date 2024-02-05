import 'package:fake_store_flutter/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:fake_store_flutter/common/widgets/products/rating/rating_bar_indicator.dart';
import 'package:fake_store_flutter/utils/constants/colors.dart';
import 'package:fake_store_flutter/utils/constants/image_strings.dart';
import 'package:fake_store_flutter/utils/constants/sizes.dart';
import 'package:fake_store_flutter/utils/helpers/helper_funcion.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviwCard extends StatelessWidget {
  const UserReviwCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(TImages.user)),
                const SizedBox(width: Sizes.spaceBtwItems),
                Text('Nix', style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(height: Sizes.spaceBtwItems),
        Row(
          children: [
            const MyRatingBarIndicator(rating: 4),
            const SizedBox(width: Sizes.spaceBtwItems),
            Text('01 Nov 2023', style: Theme.of(context).textTheme.bodyMedium)
          ],
        ),
        const SizedBox(height: Sizes.spaceBtwItems),
        const ReadMoreText(
          'This is the description of the section heading for the section heading for the section heading for the section heading for the section heading for the section',
          trimLines: 1,
          trimMode: TrimMode.Line,
          trimCollapsedText: ' show more',
          trimExpandedText: ' less',
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
        ),
        const SizedBox(height: Sizes.spaceBtwItems),
        RoundedContainer(
          backgroundColor: isDark ? TColors.darkerGrey : TColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(Sizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Fake Store',
                        style: Theme.of(context).textTheme.bodyLarge),
                    Text('02 Nov, 2023',
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const SizedBox(height: Sizes.spaceBtwItems),
                const ReadMoreText(
                  'This is the description of the section heading for the section heading for the section heading for the section heading for the section heading for the section',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: ' show more',
                  trimExpandedText: ' less',
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TColors.primary),
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: Sizes.spaceBtwSections),
      ],
    );
  }
}
