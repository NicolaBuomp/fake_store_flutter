import 'package:fake_store_flutter/features/authentication/screens/login/widgets/form_divider.dart';
import 'package:fake_store_flutter/features/authentication/screens/login/widgets/social_buttons.dart';
import 'package:fake_store_flutter/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:fake_store_flutter/utils/constants/sizes.dart';
import 'package:fake_store_flutter/utils/constants/text_string.dart';
import 'package:fake_store_flutter/utils/helpers/helper_funcion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              TTexts.signupTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            SignupForm(isDark: isDark),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            FormDivider(
              isDark: isDark,
              dividerText: TTexts.orSignUpwith.capitalize!,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            const SocialButtons()
          ],
        ),
      )),
    );
  }
}
