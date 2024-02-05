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
            const PrimaryHeaderContainer(
              child: Column(
                children: [
                  // Appbar
                  THomeAppBar(),

                  SizedBox(
                    height: Sizes.spaceBtwSections,
                  ),

                  // Searchbar
                  SearchContainer(
                    text: 'Search in Store',
                  ),
                  SizedBox(
                    height: Sizes.spaceBtwSections,
                  ),

                  // Categories
                  Padding(
                    padding: EdgeInsets.only(left: Sizes.defaultSpace),
                    child: Column(children: [
                      SectionHeading(
                        title: 'Popular Categories',
                        showActionButton: false,
                        textColor: TColors.white,
                      ),
                      SizedBox(
                        height: Sizes.spaceBtwItems,
                      ),
                      THomeCategories()
                    ]),
                  ),

                  SizedBox(height: Sizes.spaceBtwSections),
                ],
              ),
            ),
            // Body
            Padding(
              padding: const EdgeInsets.all(Sizes.defaultSpace),
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
                    height: Sizes.spaceBtwSections,
                  ),

                  SectionHeading(title: 'Popular Products', onPressed: (){},),
                  const SizedBox(
                    height: Sizes.spaceBtwItems,
                  ),
                  GridLayout(
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
