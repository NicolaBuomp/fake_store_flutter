import 'package:fake_store_flutter/utils/constants/colors.dart';
import 'package:fake_store_flutter/utils/constants/sizes.dart';
import 'package:fake_store_flutter/utils/helpers/helper_funcion.dart';
import 'package:flutter/material.dart';

class CircularIcon extends StatelessWidget {
  const CircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = Sizes.lg,
    required this.icon,
    this.color,
    this.backgroudColor,
    this.onPress,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroudColor;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroudColor != null
            ? backgroudColor!
            : isDark
                ? MyColors.black.withOpacity(0.9)
                : MyColors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        onPressed: onPress,
        icon: Icon(
          icon,
          color: color,
          size: size,
        ),
      ),
    );
  }
}
