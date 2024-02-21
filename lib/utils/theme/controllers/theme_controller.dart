import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

enum ThemeModeOption {
  automatico,
  scuro,
  chiaro,
}

class ThemeController extends GetxController {
  final _storage = GetStorage();
  Rx<ThemeModeOption> dropdownValue = ThemeModeOption.automatico.obs;
  Brightness systemTheme = Brightness.light;

  @override
  void onInit() {
    super.onInit();
    _loadDropdownValue();
    _initSystemTheme();
  }

  void _loadDropdownValue() async {
    final savedValueString = await _storage.read('themePreference');
    final savedValue = _parseThemeModeOption(savedValueString);
    dropdownValue.value = savedValue;
  }

  Future<void> _initSystemTheme() async {
    final Brightness platformBrightness =
        WidgetsBinding.instance.window.platformBrightness;
    systemTheme = platformBrightness;
    if (dropdownValue.value == ThemeModeOption.automatico) {
      _updateDropdownValue(systemTheme);
    }
  }

  ThemeModeOption _parseThemeModeOption(String? value) {
    if (value == null) return ThemeModeOption.automatico;
    switch (value.toLowerCase()) {
      case 'automatico':
        return ThemeModeOption.automatico;
      case 'scuro':
        return ThemeModeOption.scuro;
      case 'chiaro':
        return ThemeModeOption.chiaro;
      default:
        return ThemeModeOption.automatico; // Default value if parsing fails
    }
  }

  void _setTheme() {
    switch (dropdownValue.value) {
      case ThemeModeOption.automatico:
        Get.changeThemeMode(
            systemTheme == Brightness.dark ? ThemeMode.dark : ThemeMode.light);
        break;
      case ThemeModeOption.scuro:
        Get.changeThemeMode(ThemeMode.dark);
        break;
      case ThemeModeOption.chiaro:
        Get.changeThemeMode(ThemeMode.light);
        break;
    }
  }

  void _updateDropdownValue(Brightness theme) {
    dropdownValue.value = theme == Brightness.dark
        ? ThemeModeOption.scuro
        : ThemeModeOption.chiaro;
  }

  void changeDropdownValue(ThemeModeOption value) async {
    dropdownValue.value = value;
    await _storage.write('themePreference', value.toString().split('.').last);
    _setTheme();
  }
}
