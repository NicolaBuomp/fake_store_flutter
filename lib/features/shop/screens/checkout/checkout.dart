import 'package:fake_store_flutter/common/widgets/appbar/appbar.dart';
import 'package:fake_store_flutter/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:fake_store_flutter/common/widgets/products/checkout/coupon_code.dart';
import 'package:fake_store_flutter/common/widgets/success_screen/succes_screen.dart';
import 'package:fake_store_flutter/features/shop/screens/cart/widgets/cart_item.dart';
import 'package:fake_store_flutter/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:fake_store_flutter/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:fake_store_flutter/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:fake_store_flutter/navigation_menu.dart';
import 'package:fake_store_flutter/utils/constants/colors.dart';
import 'package:fake_store_flutter/utils/constants/image_strings.dart';
import 'package:fake_store_flutter/utils/constants/sizes.dart';
import 'package:fake_store_flutter/utils/helpers/helper_funcion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: MyAppBar(
        showBackArrow: true,
        title: Text(
          'Riepilogo ordine',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              const CartItems(showAddRemoveButton: false),
              const SizedBox(height: Sizes.spaceBtwSections),
              const CouponCode(),
              const SizedBox(height: Sizes.spaceBtwSections),
              RoundedContainer(
                showBorder: false,
                padding: const EdgeInsets.all(Sizes.md),
                backgroundColor: isDark ? MyColors.dark : MyColors.white,
                child: const Column(
                  children: [
                    BillingAmountSection(),
                    SizedBox(height: Sizes.spaceBtwItems),
                    Divider(),
                    SizedBox(height: Sizes.spaceBtwItems),
                    BillingPaymentSection(),
                    SizedBox(height: Sizes.spaceBtwItems),
                    BillingAddressSection(),
                    SizedBox(height: Sizes.spaceBtwItems),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(Sizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => SuccessScreen(
                image: MyImages.imageProductCard3,
                title: 'Pagamento Avvenuto con Successo',
                subtitle: 'I tuoi ogeeti saranno spediti a breve',
                onPressed: () => Get.offAll(const NavigationMenu()))),
            child: const Text('Acquista 100.00 \$')),
      ),
    );
  }
}
