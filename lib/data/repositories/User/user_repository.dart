import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_store_flutter/features/authentication/models/user_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      print(e.code);
    } on FormatException catch (e) {
      print(e);
    } on PlatformException catch (e) {
      print(e.code);
    } catch (e) {
      throw 'Riprova';
    }
  }
}
