import 'package:fake_store_flutter/features/authentication/screens/login/login.dart';
import 'package:fake_store_flutter/features/authentication/screens/onboarding/onboarding.dart';
import 'package:fake_store_flutter/features/authentication/screens/signup/verify_email.dart';
import 'package:fake_store_flutter/navigation_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnBoardingScreen());
    }
  }

// Login with EMAIL
  Future<UserCredential> loginWithEmailAncPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e.code);
      throw e; // Rilancia l'eccezione per essere gestita da chi chiama la funzione
    } on FirebaseException catch (e) {
      print(e.code);
      throw e; // Rilancia l'eccezione per essere gestita da chi chiama la funzione
    } on FormatException catch (_) {
      print('Format Exception');
      throw 'Format Exception'; // Rilancia l'eccezione per essere gestita da chi chiama la funzione
    } on PlatformException catch (e) {
      print(e.code);
      throw e; // Rilancia l'eccezione per essere gestita da chi chiama la funzione
    } catch (e) {
      print('Errore generico, riprova!');
      throw 'Errore generico, riprova!';
    }
  }


//   SIGNUP EMAIL
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e.code);
    } on FirebaseException catch (e) {
      print(e.code);
    } on FormatException catch (_) {
      print('Format Exeption');
    } on PlatformException catch (e) {
      print(e.code);
    } catch (e) {
      throw 'Errore generico, riprova!';
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      print(e.code);
    } on FirebaseException catch (e) {
      print(e.code);
    } on FormatException catch (_) {
      print('Format Exeption');
    } on PlatformException catch (e) {
      print(e.code);
    } catch (e) {
      throw 'Errore generico, riprova!';
    }
  }

//   Logout user
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      print(e.code);
    } on FirebaseException catch (e) {
      print(e.code);
    } on FormatException catch (_) {
      print('Format Exeption');
    } on PlatformException catch (e) {
      print(e.code);
    } catch (e) {
      throw 'Errore generico, riprova!';
    }
  }
}
