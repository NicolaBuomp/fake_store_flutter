import 'package:fake_store_flutter/common/widgets/appbar/appbar.dart';
import 'package:fake_store_flutter/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:fake_store_flutter/common/widgets/icon/circular_icon.dart';
import 'package:fake_store_flutter/common/widgets/images/rounded_image.dart';
import 'package:fake_store_flutter/utils/constants/colors.dart';
import 'package:fake_store_flutter/utils/constants/image_strings.dart';
import 'package:fake_store_flutter/utils/constants/sizes.dart';
import 'package:fake_store_flutter/utils/helpers/helper_funcion.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return CurvedEdgeWidget(
      child: Container(
        color: isDark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            const SizedBox(
                height: 400,
                child: Padding(
                  padding: EdgeInsets.all(Sizes.productImageRadius * 2),
                  child: Center(
                      child:
                          Image(image: AssetImage(TImages.imageProductCard3))),
                )),
            Positioned(
              right: Sizes.defaultSpace,
              bottom: 30,
              left: Sizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: 6,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(
                    width: Sizes.spaceBtwItems,
                  ),
                  itemBuilder: (_, index) => RoundedImage(
                    width: 80,
                    border: Border.all(color: TColors.primary),
                    padding: const EdgeInsets.all(Sizes.sm),
                    backgroundColor: isDark ? TColors.dark : TColors.white,
                    imageUrl: TImages.imageProductCard2,
                  ),
                ),
              ),
            ),
            const MyAppBar(
              showBackArrow: true,
              actions: [CircularIcon(icon: Iconsax.heart5, color: Colors.red)],
            )
          ],
        ),
      ),
    );
  }
}
