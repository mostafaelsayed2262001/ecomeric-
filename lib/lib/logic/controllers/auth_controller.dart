import 'package:ecomerec/lib/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  bool isvisiblity = false;
  bool isCheckBox = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  var displayUserName = ''.obs;
  var dislayUserPhoto = ''.obs;
  var dislayUserEmail = ''.obs;
  GoogleSignIn signInGoogle = GoogleSignIn();
  var isSignedIn = false;
  GetStorage authBox = GetStorage();

  void visiblity() {
    isvisiblity = !isvisiblity;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    googleSignUp();
    super.onInit();
  }

  // ignore: non_constant_identifier_names
  void CheckBox() {
    isCheckBox = !isCheckBox;
    update();
  }

  void signUpAuth({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                displayUserName.value = name,
                auth.currentUser!.updateDisplayName(name)
              });
      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (e) {
      var title = e.code.replaceAll('-', ' ').capitalize;
      var message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else {
        message = e.code.toString();
      }
      Get.snackbar(title!, message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    } catch (error) {
      Get.snackbar('Error', error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
  }

  void logInAuth({
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => displayUserName.value = auth.currentUser!.displayName!);
      isSignedIn = true;
      authBox.write('auth', isSignedIn);
      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (e) {
      var title = e.code.replaceAll('-', ' ').capitalize;
      var message = '';

      if (e.code == 'user-not-found') {
        message =
            'Account does not Exists for that $email ..Create your account by sining up ...';
      } else if (e.code == 'wrong-password') {
        message = 'Invalid Password... Please Try again!';
      } else {
        message = e.message.toString();
      }
      Get.snackbar(title!, message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
  }

  void resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      update();
      Get.back();
    } on FirebaseAuthException catch (e) {
      var title = e.code.replaceAll('-', ' ').capitalize;
      var message = '';
      if (e.code == 'user-not-found') {
        message =
            'Account does not Exists for that $email ..Create your account by sining up ...';
      } else {
        message = e.code.toString();
      }
      Get.snackbar(title!, message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    } catch (error) {
      Get.snackbar('Error', error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
  }

  void googleSignUp() async {
    try {
      final GoogleSignInAccount? googleUser = await signInGoogle.signIn();
      displayUserName.value = googleUser!.displayName!;
      dislayUserPhoto.value = googleUser.photoUrl!;
      dislayUserEmail.value = googleUser.email;
      GoogleSignInAuthentication  googleSignInAuthentication = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken
      );
      await auth.signInWithCredential(credential);

      isSignedIn = true;
      authBox.write('auth', isSignedIn);
      update();
      Get.offNamed(Routes.mainScreen);
    } catch (error) {
      Get.snackbar('Error', error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
  }

  void signOut() async {
    try {
      await auth.signOut();
      await signInGoogle.signOut();
      displayUserName.value = '';
      dislayUserPhoto.value = '';
      dislayUserEmail.value = '';
      isSignedIn = false;
      authBox.remove('auth');
      update();
      Get.offNamed(Routes.welcomeScreen);
    } catch (error) {
      Get.snackbar('Error', error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
  }
}
