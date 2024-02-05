import 'package:fake_store_flutter/common/widgets/appbar/appbar.dart';
import 'package:fake_store_flutter/features/shop/screens/product_review/widgets/overall_product_rating_widget.dart';
import 'package:fake_store_flutter/common/widgets/products/rating/rating_bar_indicator.dart';
import 'package:fake_store_flutter/features/shop/screens/product_review/widgets/user_reviw_card.dart';
import 'package:fake_store_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: Text('Reviews & Rating'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Sizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
                'Lorem ipsum dolor sit amet, consectetur adip nonum soc tempor inv soc et dolore magna aliqu sapien et dolore magna aliqu'),
            const SizedBox(height: Sizes.spaceBtwItems),
            const OverallProductRating(),
            const MyRatingBarIndicator(
              rating: 2,
            ),
            Text('12.234', style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: Sizes.spaceBtwSections),
            const UserReviwCard(),
            const UserReviwCard()
          ],
        ),
      ),
    );
  }
}
