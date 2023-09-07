import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  //TODO: Implement SignupController
  final cEmail = TextEditingController();
  final cPass = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    cEmail.dispose();
    cPass.dispose();
    super.onClose();
  }

  void increment() => count.value++;
}
