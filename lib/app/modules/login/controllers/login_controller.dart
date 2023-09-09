import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project_get/app/routes/app_pages.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  final cEmail = TextEditingController();
  final cPass = TextEditingController();

  @override
  void onClose() {
    cEmail.dispose();
    cPass.dispose();
    super.onClose();
  }

  void loginGoogle() async {
    try {
      GoogleSignIn _googleSignIn = GoogleSignIn();
      GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        await FirebaseAuth.instance.signInWithCredential(credential);
        Get.offAllNamed(Routes.HOME);
      } else {
        throw "Belum memilih akun google";
      }
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Gagal",
        middleText: "${e.toString()}",
      );
    }
  }
}
