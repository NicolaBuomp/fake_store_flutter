import 'package:fake_store_flutter/common/widgets/appbar/appbar.dart';
import 'package:fake_store_flutter/common/widgets/images/t_circular_image.dart';
import 'package:fake_store_flutter/common/widgets/texts/section_heading.dart';
import 'package:fake_store_flutter/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:fake_store_flutter/utils/constants/image_strings.dart';
import 'package:fake_store_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Profilo'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const TCircularImage(
                      image: TImages.user,
                      width: 80,
                      height: 80,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text('Cambia l\'immagine del profilo'))
                  ],
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              const TSectionHeading(
                title: 'Informazioni profilo',
                showActionButton: false,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              ProfileMenu(
                  title: 'Nome', value: 'Nicola Buompane', onPressed: () {}),
              ProfileMenu(title: 'Username', value: 'Nix', onPressed: () {}),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              const TSectionHeading(
                title: 'Informazioni personali',
                showActionButton: false,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              ProfileMenu(
                  title: 'User ID',
                  value: '346295',
                  icon: Iconsax.copy,
                  onPressed: () {}),
              ProfileMenu(
                  title: 'E-Mail',
                  value: 'nicolabuompane.dev@gmail.com',
                  onPressed: () {}),
              ProfileMenu(
                  title: 'Numero di Telefono',
                  value: '+39 3510008604',
                  onPressed: () {}),
              ProfileMenu(title: 'Sesso', value: 'Uomo', onPressed: () {}),
              ProfileMenu(
                  title: 'Data di nascita',
                  value: '29/10/1996',
                  onPressed: () {}),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Elimina Account',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}