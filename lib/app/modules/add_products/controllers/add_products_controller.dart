import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductsController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  late TextEditingController cNPM;
  late TextEditingController cNAMA;
  late TextEditingController cALAMAT;
  late TextEditingController cPS;
  late TextEditingController cJK;

  @override
  void onInit() {
    cNPM = TextEditingController();
    cNAMA = TextEditingController();
    cALAMAT = TextEditingController();
    cPS = TextEditingController();
    cJK = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    cNPM.dispose();
    cNAMA.dispose();
    cALAMAT.dispose();
    cPS.dispose();
    cJK.dispose();
    super.onClose();
  }

  void addProduct(String npm, String nama, String alamat, String jk,
      String program_studi) async {
    CollectionReference products = firestore.collection("mahasiswa");
    try {
      products.add({
        "npm": npm,
        "nama": nama,
        "alamat": alamat,
        "program_studi": program_studi,
        "jk": jk,
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Data berhasil diinput!",
          onConfirm: () {
            cNPM.clear();
            cNAMA.clear();
            cALAMAT.clear();
            cPS.clear();
            cJK.clear();
            Get.back();
            Get.back();
          });
    } catch (e) {
      print(e);
    }
  }
}
