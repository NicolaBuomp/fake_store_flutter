import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_funcion.dart';
import '../../icon/circular_icon.dart';

class AddAndRemoveProductCart extends StatelessWidget {
  const AddAndRemoveProductCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [

        CircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: Sizes.md,
          color: THelperFunctions.isDarkMode(context)
              ? TColors.white
              : TColors.black,
          backgroudColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.light,
        ),
        const SizedBox(
          width: Sizes.spaceBtwItems,
        ),
        Text(
          '2',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(
          width: Sizes.spaceBtwItems,
        ),
        const CircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: Sizes.md,
          color: TColors.white,
          backgroudColor: TColors.primary,
        ),
      ],
    );
  }
}
