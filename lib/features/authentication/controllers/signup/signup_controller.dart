import 'package:fake_store_flutter/common/widgets/loader/loaders.dart';
import 'package:fake_store_flutter/data/repositories/User/user_repository.dart';
import 'package:fake_store_flutter/data/repositories/authentication/authentication_repository.dart';
import 'package:fake_store_flutter/features/authentication/models/user_model.dart';
import 'package:fake_store_flutter/features/authentication/screens/signup/verify_email.dart';
import 'package:fake_store_flutter/utils/constants/image_strings.dart';
import 'package:fake_store_flutter/utils/network/network_manager.dart';
import 'package:fake_store_flutter/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get intance => Get.find();

  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  Future<void> signUp() async {
    try {
      FullScreenLoader.openLoadingDialog(
          'Stiamo procesando i tuoi dati', MyImages.adidas);

      final isConnected = await NetworkManager.intance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      if (!signupFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      if (!privacyPolicy.value) {
        Loaders.warningSnackBar(
            title: 'Accetta Privacy & Policy',
            message:
                'In order to create account, you must have to read and accept the Privacy Policy & terms of Use');
        return;
      }

      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: username.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '');

      final userRepository = Get.put(UserRepository());

      await userRepository.saveUserRecord(newUser);

      Loaders.successSnackBar(
          title: 'Congratulazioni',
          message: 'Account creato! Verifica l\'email per continuare.');

      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      Loaders.errorSnackBar(title: 'Errore', message: e.toString());
    } finally {
      FullScreenLoader.stopLoading();
    }
  }
}
