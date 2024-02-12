import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_store_flutter/data/repositories/authentication/authentication_repository.dart';
import 'package:fake_store_flutter/features/authentication/models/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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

  // GET user by ID
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db
          .collection("users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      // Handle Firebase-specific errors
      print(e.code);
      rethrow; // Rethrow to allow for further handling
    } on FormatException catch (e) {
      // Handle data formatting errors
      print(e);
      rethrow;
    } on PlatformException catch (e) {
      // Handle platform-specific errors
      print(e.code);
      rethrow;
    } catch (e) {
      // Handle other unexpected errors
      print(e);
      throw 'An unexpected error : ${e.toString()}... fetchUserDetails';
    }
  }

// update user
  Future<void> updateUserDetails(UserModel updateUser) async {
    try {
      await _db
          .collection("users")
          .doc(updateUser.id)
          .update(updateUser.toJson());
    } on FirebaseException catch (e) {
      // Handle Firebase-specific errors
      print(e.code);
      rethrow; // Rethrow to allow for further handling
    } on FormatException catch (e) {
      // Handle data formatting errors
      print(e);
      rethrow;
    } on PlatformException catch (e) {
      // Handle platform-specific errors
      print(e.code);
      rethrow;
    } catch (e) {
      // Handle other unexpected errors
      print(e);
      throw 'An unexpected error occurred. Please try again.';
    }
  }

  // update any field in specific user collection
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      final docRef = _db.collection("users").doc(AuthenticationRepository.instance.authUser?.uid);
      await docRef.update(json);
    } on FirebaseException catch (e) {
      // Handle Firebase-specific errors
      print(e.code);
      rethrow; // Rethrow to allow for further handling
    } on FormatException catch (e) {
      // Handle data formatting errors
      print(e);
      rethrow;
    } on PlatformException catch (e) {
      // Handle platform-specific errors
      print(e.code);
      rethrow;
    } catch (e) {
      // Handle other unexpected errors
      print(e);
      throw 'An unexpected error occurred. Please try again.';
    }
  }

  // remove user
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection("users").doc(userId).delete();
    } on FirebaseException catch (e) {
      // Handle Firebase-specific errors
      print(e.code);
      rethrow; // Rethrow to allow for further handling
    } on FormatException catch (e) {
      // Handle data formatting errors
      print(e);
      rethrow;
    } on PlatformException catch (e) {
      // Handle platform-specific errors
      print(e.code);
      rethrow;
    } catch (e) {
      // Handle other unexpected errors
      print(e);
      throw 'An unexpected error occurred. Please try again.';
    }
  }

  // upload image
  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      // Gestisci gli errori specifici di Firebase
      print(e.code);
      rethrow; // Rilancia per consentire ulteriori gestioni
    } on FormatException catch (e) {
      // Gestisci gli errori di formattazione dei dati
      print(e);
      rethrow;
    } on PlatformException catch (e) {
      // Gestisci gli errori specifici della piattaforma
      print(e.code);
      rethrow;
    } catch (e) {
      // Gestisci altri errori imprevisti
      print(e);
      throw 'Errore: ${e.toString()}';
    }
  }
}
