import 'package:fake_store_flutter/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

class MyRatingBarIndicator extends StatelessWidget {
  const MyRatingBarIndicator({
    super.key,
    required this.rating,
  });
  final double rating;
  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
        rating: rating,
        itemSize: 20,
        itemBuilder: (_, __) => const Icon(
              Iconsax.star1,
              color: TColors.primary,
            ));
  }
}
