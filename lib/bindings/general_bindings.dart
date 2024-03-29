import 'package:fake_store_flutter/utils/network/network_manager.dart';
import 'package:fake_store_flutter/utils/theme/controllers/theme_controller.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(ThemeController());
  }
}
