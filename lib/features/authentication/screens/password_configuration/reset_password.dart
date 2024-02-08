import 'package:fake_store_flutter/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:fake_store_flutter/features/authentication/screens/login/login.dart';
import 'package:fake_store_flutter/utils/constants/image_strings.dart';
import 'package:fake_store_flutter/utils/constants/sizes.dart';
import 'package:fake_store_flutter/utils/constants/text_string.dart';
import 'package:fake_store_flutter/utils/helpers/helper_funcion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(Sizes.defaultSpace),
        child: Column(
          children: [
            Image(
              image: const AssetImage(MyImages.adidas2),
              width: HelperFunctions.screenWidth() * 0.6,
            ),
            const SizedBox(height: Sizes.spaceBtwSections),
            Text(
              email,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Sizes.spaceBtwItems),
            Text(
              TTexts.changeYourPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Sizes.spaceBtwItems),
            Text(
              TTexts.changeYourPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Sizes.spaceBtwSections),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => Get.to(() => const LoginScreen()),
                  child: const Text(TTexts.ok)),
            ),
            const SizedBox(height: Sizes.spaceBtwItems),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                  onPressed: () => ForgetPasswordController.instance
                      .resendPasswordResetEmail(email),
                  child: const Text(TTexts.resendEmail)),
            )
          ],
        ),
      )),
    );
  }
}
