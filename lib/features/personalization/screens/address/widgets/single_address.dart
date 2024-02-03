import 'package:fake_store_flutter/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:fake_store_flutter/utils/constants/colors.dart';
import 'package:fake_store_flutter/utils/constants/sizes.dart';
import 'package:fake_store_flutter/utils/helpers/helper_funcion.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;
  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      padding: const EdgeInsets.all(TSizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress
          ? TColors.primary.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : isDark
              ? TColors.darkerGrey
              : TColors.grey,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
              top: 0,
              right: 5,
              child: Icon(
                selectedAddress ? Iconsax.tick_circle5 : null,
                color: selectedAddress
                    ? isDark
                        ? TColors.light
                        : TColors.dark
                    : null,
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nicola Buompane',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: TSizes.sm / 2),
              const Text(
                '+39 1234565784',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: TSizes.sm / 2),
              const Text(
                '12345 Via McDonald 17, Caserta, Italia',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          )
        ],
      ),
    );
  }
}
