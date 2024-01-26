import 'package:fake_store_flutter/common/styles/spacing_styles.dart';
import 'package:fake_store_flutter/common/widgets/login_signup/form_divider.dart';
import 'package:fake_store_flutter/features/authentication/screens/login/widgets/login_form.dart';
import 'package:fake_store_flutter/features/authentication/screens/login/widgets/login_header.dart';
import 'package:fake_store_flutter/features/authentication/screens/login/widgets/social_buttons.dart';
import 'package:fake_store_flutter/utils/constants/sizes.dart';
import 'package:fake_store_flutter/utils/constants/text_string.dart';
import 'package:fake_store_flutter/utils/helpers/helper_funcion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              const LoginHeader(),
              const LoginForm(),
              FormDivider(
                isDark: isDark,
                dividerText: TTexts.orSignInWith.capitalize!,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              const SocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
