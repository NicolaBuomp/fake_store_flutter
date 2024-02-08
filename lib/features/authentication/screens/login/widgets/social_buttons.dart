import 'package:fake_store_flutter/features/authentication/controllers/login/login_controller.dart';
import 'package:fake_store_flutter/utils/constants/colors.dart';
import 'package:fake_store_flutter/utils/constants/image_strings.dart';
import 'package:fake_store_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: MyColors.grey),
              borderRadius: BorderRadius.circular(180)),
          child: IconButton(
              onPressed: () => controller.googleSignIn(),
              icon: const Image(
                  width: Sizes.iconMd,
                  height: Sizes.iconMd,
                  image: AssetImage(MyImages.google))),
        ),
        const SizedBox(
          width: Sizes.spaceBtwItems,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: MyColors.grey),
              borderRadius: BorderRadius.circular(180)),
          child: IconButton(
              onPressed: () {},
              icon: const Image(
                  width: Sizes.iconMd,
                  height: Sizes.iconMd,
                  image: AssetImage(MyImages.facebook))),
        ),
      ],
    );
  }
}
