import 'package:fake_store_flutter/data/repositories/User/user_repository.dart';
import 'package:fake_store_flutter/features/authentication/screens/login/login.dart';
import 'package:fake_store_flutter/features/authentication/screens/onboarding/onboarding.dart';
import 'package:fake_store_flutter/features/authentication/screens/signup/verify_email.dart';
import 'package:fake_store_flutter/navigation_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  User? get authUser => _auth.currentUser;

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
  Future<UserCredential> loginWithEmailAncPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e.code);
      rethrow; // Rilancia l'eccezione per essere gestita da chi chiama la funzione
    } on FirebaseException catch (e) {
      print(e.code);
      rethrow; // Rilancia l'eccezione per essere gestita da chi chiama la funzione
    } on FormatException catch (_) {
      print('Format Exception');
      throw 'Format Exception'; // Rilancia l'eccezione per essere gestita da chi chiama la funzione
    } on PlatformException catch (e) {
      print(e.code);
      rethrow; // Rilancia l'eccezione per essere gestita da chi chiama la funzione
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

  // EMAIL VERIFICATION
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

// RESET PASSSWORD
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
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

  Future<void> reAuthenticateWithEmailAndPassword(
      String email, String password) async {
    try {
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);
      await _auth.currentUser!.reauthenticateWithCredential(credential);
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

  // Google Authentication
  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      print(e.code);
      throw 'Errore generico, FirebaseAuthException!';
    } on FirebaseException catch (e) {
      print(e.code);
      throw 'Errore generico, FirebaseException!';
    } on FormatException catch (_) {
      print('Format Exeption');
      throw 'Errore generico, FormatException!';
    } on PlatformException catch (e) {
      print(e.code);
      throw 'Errore generico, PlatformException!';
    } catch (e) {
      throw 'Errore generico, riprova!';
    }
  }

//   Logout user
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
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

// delete account
  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser!.delete();
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
