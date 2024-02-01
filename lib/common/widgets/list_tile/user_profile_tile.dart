import 'package:fake_store_flutter/common/widgets/images/t_circular_image.dart';
import 'package:fake_store_flutter/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.image,
      this.isNetworkImage = false});

  final String title, subtitle, image;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: TCircularImage(
        image: image,
        width: 50,
        height: 50,
        padding: 0,
        isNetworkImage: isNetworkImage,
      ),
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: TColors.white),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .apply(color: TColors.white),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(
          Iconsax.edit,
          color: TColors.white,
        ),
      ),
    );
  }
}
