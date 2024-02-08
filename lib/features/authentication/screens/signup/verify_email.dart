import 'package:fake_store_flutter/data/repositories/authentication/authentication_repository.dart';
import 'package:fake_store_flutter/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:fake_store_flutter/utils/constants/sizes.dart';
import 'package:fake_store_flutter/utils/constants/text_string.dart';
import 'package:fake_store_flutter/utils/helpers/helper_funcion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({
    super.key, required this.email,
  });

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => AuthenticationRepository.instance.logout(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(Sizes.defaultSpace),
        child: Column(
          children: [
            Image(
              image: const NetworkImage('https://picsum.photos/200/300'),
              width: HelperFunctions.screenWidth() * 0.6,
            ),
            const SizedBox(
              height: Sizes.spaceBtwSections,
            ),
            Text(
              TTexts.confirmEmail,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: Sizes.spaceBtwItems,
            ),
            Text(
              email ?? '',
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: Sizes.spaceBtwSections,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.checkEmailVerificationStatus(),
                child: const Text(TTexts.tContinue),
              ),
            ),
            const SizedBox(
              height: Sizes.spaceBtwItems,
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () => controller.sendEmailVerification(),
                child: const Text(TTexts.resendEmail),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
