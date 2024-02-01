import 'package:fake_store_flutter/common/widgets/appbar/appbar.dart';
import 'package:fake_store_flutter/common/widgets/icon/t_circular_icon.dart';
import 'package:fake_store_flutter/common/widgets/layouts/grid_layout.dart';
import 'package:fake_store_flutter/common/widgets/products/products_card/product_card_vertical.dart';
import 'package:fake_store_flutter/features/shop/screens/home/home.dart';
import 'package:fake_store_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Whishlist', style: Theme.of(context).textTheme.headlineMedium,),
        actions: [
          TCircularIcon(icon: Iconsax.add, onPress: () => Get.to(const HomeScreen()),)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace), child: Column(
          children: [
            TGridLayout(itemCount: 4, itemBuilder: (_, index) => const ProductCardVertical())
          ],
        ),),
      )
    );
  }
}