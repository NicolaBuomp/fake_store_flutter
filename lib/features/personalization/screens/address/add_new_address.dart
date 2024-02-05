import 'package:fake_store_flutter/common/widgets/appbar/appbar.dart';
import 'package:fake_store_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        showBackArrow: true,
        title: Text('Crea nuovo Indirizzo'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(Sizes.defaultSpace),
        child: Form(
            child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.user), labelText: 'Nome'),
            ),
            const SizedBox(
              height: Sizes.spaceBtwInputFields,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.mobile),
                  labelText: 'Numero di telefono'),
            ),
            const SizedBox(
              height: Sizes.spaceBtwInputFields,
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.building_31),
                        labelText: 'Via'),
                  ),
                ),
                const SizedBox(
                  width: Sizes.spaceBtwInputFields,
                ),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.code),
                        labelText: 'Codice Postale'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: Sizes.spaceBtwInputFields,
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.building), labelText: 'Città'),
                  ),
                ),
                const SizedBox(
                  width: Sizes.spaceBtwInputFields,
                ),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.activity), labelText: 'Provincia'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: Sizes.spaceBtwInputFields,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.global),
                  labelText: 'Stato'),
            ),
            const SizedBox(
              height: Sizes.spaceBtwInputFields,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Salva'),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
