import 'package:fake_store_flutter/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:fake_store_flutter/common/widgets/custom_shapes/container/search_container.dart';
import 'package:fake_store_flutter/common/widgets/layouts/grid_layout.dart';
import 'package:fake_store_flutter/common/widgets/products/products_card/product_card_vertical.dart';
import 'package:fake_store_flutter/common/widgets/texts/section_heading.dart';
import 'package:fake_store_flutter/features/shop/screens/home/widget/home_appbar.dart';
import 'package:fake_store_flutter/features/shop/screens/home/widget/home_categories.dart';
import 'package:fake_store_flutter/features/shop/screens/home/widget/promo_slider.dart';
import 'package:fake_store_flutter/utils/constants/colors.dart';
import 'package:fake_store_flutter/utils/constants/image_strings.dart';
import 'package:fake_store_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: Padding(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  // Appbar
                  THomeAppBar(),

                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  // Searchbar
                  TSearchContainer(
                    text: 'Search in Store',
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  // Categories
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(children: [
                      TSectionHeading(
                        title: 'Popular Categories',
                        showActionButton: false,
                        textColor: TColors.white,
                      ),
                      SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      THomeCategories()
                    ]),
                  )
                ],
              ),
            ),
            // Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TPromoSlider(
                    banners: [
                      TImages.imageBannerCard,
                      TImages.imageBannerCard,
                      TImages.imageBannerCard
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  TSectionHeading(title: 'Popular Products', onPressed: (){},),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  TGridLayout(
                      itemCount: 2,
                      itemBuilder: (_, index) => const ProductCardVertical())
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
