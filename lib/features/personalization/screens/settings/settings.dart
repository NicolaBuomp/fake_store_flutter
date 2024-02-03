import 'package:fake_store_flutter/common/widgets/appbar/appbar.dart';
import 'package:fake_store_flutter/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:fake_store_flutter/common/widgets/list_tile/settings_menu_tile.dart';
import 'package:fake_store_flutter/common/widgets/list_tile/user_profile_tile.dart';
import 'package:fake_store_flutter/common/widgets/texts/section_heading.dart';
import 'package:fake_store_flutter/features/personalization/screens/address/address.dart';
import 'package:fake_store_flutter/features/personalization/screens/profile/profile.dart';
import 'package:fake_store_flutter/utils/constants/colors.dart';
import 'package:fake_store_flutter/utils/constants/image_strings.dart';
import 'package:fake_store_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  TAppBar(
                      title: Text('Account',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .apply(color: TColors.white))),
                  UserProfileTile(
                      title: 'Nicola Buompane',
                      subtitle: 'nicolabuompane.dev@gmail.com',
                      image: TImages.user,
                      onPressed: () => Get.to(() => const ProfileScreen())),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TSectionHeading(
                    title: 'Impostazioni Account',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'Indirizzo',
                    subtitle: 'Imposta il tuo indirizzo di spedizione',
                    onTap: () => Get.to(() => const UserAddressScreen()),
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: 'Carrello',
                    subtitle: 'Imposta il tuo indirizzo di spedizione',
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'Ordini',
                    subtitle: 'Imposta il tuo indirizzo di spedizione',
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.bank,
                    title: 'Pagamenti',
                    subtitle: 'Imposta il tuo indirizzo di spedizione',
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.discount_shape,
                    title: 'Sconti',
                    subtitle: 'Imposta il tuo indirizzo di spedizione',
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notifiche',
                    subtitle: 'Imposta il tuo indirizzo di spedizione',
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.security_card,
                    title: 'Privacy',
                    subtitle: 'Imposta il tuo indirizzo di spedizione',
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const TSectionHeading(
                    title: 'Impostazioni app',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.document_upload,
                    title: 'Firebase',
                    subtitle: 'Carica i dati di Firebase',
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Localizzazione',
                    subtitle: 'Abilita la localizzazionie',
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subtitle: 'Abilita Safe Mode',
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'HD Image Quality',
                    subtitle: 'Abilita le immagini in HD',
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
