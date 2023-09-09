import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProductController extends GetxController {
  late TextEditingController cNPM;
  late TextEditingController cNAMA;
  late TextEditingController cALAMAT;
  late TextEditingController cPS;
  late TextEditingController cJK;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String id) async {
    DocumentReference docRef = firestore.collection("mahasiswa").doc(id);
    return docRef.get();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    cNPM = TextEditingController();
    cNAMA = TextEditingController();
    cALAMAT = TextEditingController();
    cPS = TextEditingController();
    cJK = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    cNPM.dispose();
    cNAMA.dispose();
    cALAMAT.dispose();
    cPS.dispose();
    cJK.dispose();
  }

  void updateProduct(String npm, String nama, String alamat,
      String program_studi, String jk, String id) {
    CollectionReference products = firestore.collection("mahasiswa");
    try {
      products.doc(id).update({
        "npm": npm,
        "nama": nama,
        "alamat": alamat,
        "program_studi": program_studi,
        "jk": jk,
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Data berhasil diedit!",
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
