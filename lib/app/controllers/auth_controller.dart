import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:project_get/app/routes/app_pages.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  void signup(String emailAddress, String password) async {
    try {
      UserCredential myUser = await auth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      await myUser.user!.sendEmailVerification();
      Get.defaultDialog(
          title: "Verifikasi email",
          middleText: "Kami telah mengirim email konfirmasi ke $emailAddress.",
          onConfirm: () {
            Get.back(); // else
            Get.back(); // login
          },
          textConfirm: "OK");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        msg("Week Password!");
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        msg("Email Telah Digunakan");
        print('The account already exists for that email.');
      } else {
        msg(e.code);
      }
    } catch (e) {
      print(e);
    }
  }

  void login(String emailAddress, String password) async {
    try {
      UserCredential myUser = await auth.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      if (myUser.user!.emailVerified) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.defaultDialog(
            title: "Email Belum Diverifikasi",
            middleText: "Silahkan cek email terlebih dahulu.");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        msg("User Not Found!");
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        msg("Password Salah!");
        print('Wrong password provided for that user.');
      } else {
        msg(e.code);
        print(e.code);
      }
    }
  }

  void logout() async {
    await auth.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }

  void resetPassword(String emailAddress) async {
    //reset password
    if (emailAddress != '' && GetUtils.isEmail(emailAddress)) {
      try {
        await auth.sendPasswordResetEmail(email: emailAddress);
        Get.defaultDialog(
            title: "Priksa Email Anda!!",
            middleText:
                "Kami telah mengirim permintaan reset password ke $emailAddress.",
            onConfirm: () {
              Get.back();
              Get.back();
            },
            textConfirm: "Ok");
      } catch (e) {
        Get.defaultDialog(
            title: "Tidak bisa reset", middleText: "Sistem Error.");
      }
    } else {
      Get.defaultDialog(
        title: "Email tidak valid",
        middleText: "Perika kembali email anda.",
      );
    }
  }

  void msg(String p) {
    Fluttertoast.showToast(
        msg: p,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP_LEFT,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
