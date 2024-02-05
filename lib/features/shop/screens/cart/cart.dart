import 'package:fake_store_flutter/common/widgets/appbar/appbar.dart';
import 'package:fake_store_flutter/common/widgets/icon/circular_icon.dart';
import 'package:fake_store_flutter/common/widgets/images/rounded_image.dart';
import 'package:fake_store_flutter/common/widgets/texts/brand_title_text_with_veried_icon.dart';
import 'package:fake_store_flutter/common/widgets/texts/product_price_text.dart';
import 'package:fake_store_flutter/common/widgets/texts/product_title_text.dart';
import 'package:fake_store_flutter/utils/constants/colors.dart';
import 'package:fake_store_flutter/utils/constants/image_strings.dart';
import 'package:fake_store_flutter/utils/constants/sizes.dart';
import 'package:fake_store_flutter/utils/helpers/helper_funcion.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../common/widgets/products/cart/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        showBackArrow: true,
        title: Text(
          'Carrello',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.defaultSpace),
        child: ListView.separated(
          separatorBuilder: (_, __) => const SizedBox(
            height: Sizes.spaceBtwSections,
          ),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (_, index) => Column(
            children: [
              const CartItem(),
              const SizedBox(
                height: Sizes.spaceBtwItems,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 70,
                      ),
                      const AddAndRemoveProductCart(),
                    ],
                    
                  ),
                  ProductPriceText(price: '100'),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(Sizes.defaultSpace),
        child: ElevatedButton(onPressed: (){}, child: Text('Acquista 100.00 \$')),
      ),
    );
  }
}

