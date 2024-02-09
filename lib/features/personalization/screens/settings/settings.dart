import 'package:fake_store_flutter/common/widgets/appbar/appbar.dart';
import 'package:fake_store_flutter/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:fake_store_flutter/common/widgets/list_tile/settings_menu_tile.dart';
import 'package:fake_store_flutter/common/widgets/list_tile/user_profile_tile.dart';
import 'package:fake_store_flutter/common/widgets/texts/section_heading.dart';
import 'package:fake_store_flutter/data/repositories/authentication/authentication_repository.dart';
import 'package:fake_store_flutter/features/personalization/screens/address/address.dart';
import 'package:fake_store_flutter/features/personalization/screens/profile/profile.dart';
import 'package:fake_store_flutter/features/shop/screens/orders/orders.dart';
import 'package:fake_store_flutter/utils/constants/colors.dart';
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
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  MyAppBar(
                      title: Text('Account',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .apply(color: MyColors.white))),
                  UserProfileTile(
                      onPressed: () => Get.to(() => const ProfileScreen())),
                  const SizedBox(
                    height: Sizes.spaceBtwSections,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Sizes.defaultSpace),
              child: Column(
                children: [
                  const SectionHeading(
                    title: 'Impostazioni Account',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: Sizes.spaceBtwItems,
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
                    onTap: () => Get.to(() => const OrderScreen()),
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
                    height: Sizes.spaceBtwSections,
                  ),
                  const SectionHeading(
                    title: 'Impostazioni app',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: Sizes.spaceBtwItems,
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
                  const SizedBox(
                    height: Sizes.spaceBtwItems,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () =>
                          AuthenticationRepository.instance.logout(),
                      child: const Text('Logout'),
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
