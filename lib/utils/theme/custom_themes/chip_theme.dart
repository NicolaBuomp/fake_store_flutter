import 'package:fake_store_flutter/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TChipTheme {
  TChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: MyColors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: MyColors.black),
    selectedColor: MyColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: MyColors.white,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: MyColors.grey,
    labelStyle: TextStyle(color: MyColors.white),
    selectedColor: MyColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: MyColors.white,
  );
}
