import 'package:fake_store_flutter/common/widgets/images/circular_image.dart';
import 'package:fake_store_flutter/features/personalization/controllers/user_controller.dart';
import 'package:fake_store_flutter/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
    this.isNetworkImage = false,
    this.onPressed,
  });

  final bool isNetworkImage;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: Obx(() => CircularImage(
            image: controller.user.value.profilePicture,
            width: 50,
            height: 50,
            padding: 0,
            isNetworkImage: true,
          )),
      title: Text(
        controller.user.value.fullName,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: MyColors.white),
      ),
      subtitle: Text(
        controller.user.value.email,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .apply(color: MyColors.white),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Iconsax.edit,
          color: MyColors.white,
        ),
      ),
    );
  }
}
