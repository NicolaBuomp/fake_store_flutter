import 'package:fake_store_flutter/common/widgets/texts/section_heading.dart';
import 'package:fake_store_flutter/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:fake_store_flutter/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:fake_store_flutter/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:fake_store_flutter/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:fake_store_flutter/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:fake_store_flutter/features/shop/screens/product_review/product_review.dart';
import 'package:fake_store_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          // 1 - Product image slider
          children: [
            const ProductImageSlider(),

            // 2 - Product details
            Padding(
              padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  // Recensioni
                  const RatingAndShare(),

                  // Info prodotto
                  const ProductMetaData(),

                  // Colore / Taglia
                  const ProductAttributes(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // Checkout
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('Checkout')),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  const TSectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const ReadMoreText(
                    'This is the description of the section heading for the section heading for the section heading for the section heading for the section heading for the section',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show More',
                    trimExpandedText: ' Less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  const Divider(),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(
                        title: 'Review (199)',
                        showActionButton: false,
                      ),
                      IconButton(
                          onPressed: () =>
                              Get.to(() => const ProductReviewScreen()),
                          icon: const Icon(
                            Iconsax.arrow_right_3,
                            size: 18,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
