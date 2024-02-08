import 'package:fake_store_flutter/common/widgets/loader/loaders.dart';
import 'package:fake_store_flutter/data/repositories/authentication/authentication_repository.dart';
import 'package:fake_store_flutter/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:fake_store_flutter/utils/network/network_manager.dart';
import 'package:fake_store_flutter/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async {
    try {
      FullScreenLoader.openLoadingDialog('Richiesta di reset password');

      final isConnected = await NetworkManager.intance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      if (!forgetPasswordFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      FullScreenLoader.stopLoading();

      Loaders.successSnackBar(
          title: 'Email inviata',
          message:
              'Email per il reset della password inviata. Fai click sul link per effettuare il reset!'
                  .tr);

      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Errore', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      FullScreenLoader.openLoadingDialog('Richiesta di reset password');

      final isConnected = await NetworkManager.intance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      FullScreenLoader.stopLoading();

      Loaders.successSnackBar(
          title: 'Email inviata',
          message:
              'Email per il reset della password inviata. Fai click sul link per effettuare il reset!'
                  .tr);
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Errore', message: e.toString());
    }
  }
}
