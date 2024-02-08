import 'package:fake_store_flutter/utils/constants/colors.dart';
import 'package:fake_store_flutter/utils/helpers/helper_funcion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullScreenLoader {
  static void openLoadingDialog(String text) {
    showGeneralDialog(
      context: Get.context!,
      barrierLabel:
          MaterialLocalizations.of(Get.context!).modalBarrierDismissLabel,
      barrierDismissible: false,
      pageBuilder: (context, animation, secondaryAnimation) => Center(
        child: Container(
          color: HelperFunctions.isDarkMode(Get.context!)
              ? MyColors.dark
              : MyColors.white, // Semi-transparent overlay
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              // Loader content with correct text alignment
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(height: 20),
                    Text(
                      text,
                      textAlign: TextAlign.center,
                      style: Theme.of(Get.context!).textTheme.headlineSmall,
                    ),
                  ],
                ),
              ),
              // Optional background gradient
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.black.withOpacity(0.3),
                      Colors.black.withOpacity(0.0)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
