import 'package:fake_store_flutter/utils/theme/custom_themes/appbar_theme.dart';
import 'package:fake_store_flutter/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:fake_store_flutter/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:fake_store_flutter/utils/theme/custom_themes/chip_theme.dart';
import 'package:fake_store_flutter/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:fake_store_flutter/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:fake_store_flutter/utils/theme/custom_themes/text_field_theme.dart';
import 'package:fake_store_flutter/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      // fontFamily:
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      textTheme: TTextTheme.lightTextTheme,
      chipTheme: TChipTheme.lightChipTheme,
      scaffoldBackgroundColor: TColors.light,
      appBarTheme: TAppBarTheme.lightAppBarTheme,
      checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
      bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
      elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
      outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
      inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme);
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      // fontFamily:
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      textTheme: TTextTheme.darkTextTheme,
      chipTheme: TChipTheme.darkChipTheme,
      scaffoldBackgroundColor: TColors.black,
      appBarTheme: TAppBarTheme.darkAppBarTheme,
      checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
      bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
      elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
      outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
      inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme);
}
