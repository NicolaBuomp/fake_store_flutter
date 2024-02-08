import 'package:fake_store_flutter/utils/constants/colors.dart';
import 'package:fake_store_flutter/utils/helpers/helper_funcion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullScreenLoader {
  static void openLoadingDialog(String text) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => _FullScreenLoadingDialog(text: text),
    );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}

class _FullScreenLoadingDialog extends StatelessWidget {
  final String text;

  const _FullScreenLoadingDialog({required this.text});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      // Impostare il backgroundColor in modo che occupi l'intera schermata
      backgroundColor: HelperFunctions.isDarkMode(Get.context!)
          ? MyColors.dark
          : MyColors.white,
      elevation: 0,
      child: Center(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 16),
              Text(text),
            ],
          ),
        ),
      ),
    );
  }
}
