import 'package:fake_store_flutter/common/widgets/loader/loaders.dart';
import 'package:fake_store_flutter/data/repositories/User/user_repository.dart';
import 'package:fake_store_flutter/features/personalization/controllers/user_controller.dart';
import 'package:fake_store_flutter/features/personalization/screens/profile/profile.dart';
import 'package:fake_store_flutter/utils/network/network_manager.dart';
import 'package:fake_store_flutter/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      FullScreenLoader.openLoadingDialog('Aggiorno il tuo nome...');

      final isConnected = await NetworkManager.intance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      if (!updateUserNameFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> name = {
        'firstName': firstName.text.trim(),
        'lastName': lastName.text.trim()
      };

      await userRepository.updateSingleField(name);

      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      FullScreenLoader.stopLoading();

      Loaders.successSnackBar(
          title: 'Congratulazioni',
          message: 'Il tuo nome è stato aggiornato con successo');
      Get.off(() => const ProfileScreen());
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(
          title: 'Si è verificato un errore', message: e.toString());
    }
  }
}
