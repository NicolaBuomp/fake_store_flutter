import 'package:fake_store_flutter/common/widgets/login_signup/form_divider.dart';
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
    final isDark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(Sizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              TTexts.signupTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: Sizes.spaceBtwSections,
            ),
            const SignupForm(),
            const SizedBox(
              height: Sizes.spaceBtwSections,
            ),
            FormDivider(
              isDark: isDark,
              dividerText: TTexts.orSignUpwith.capitalize!,
            ),
            const SizedBox(
              height: Sizes.spaceBtwItems,
            ),
            const SocialButtons()
          ],
        ),
      )),
    );
  }
}
