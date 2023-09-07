import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductsController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  late TextEditingController cNama;
  late TextEditingController cHarga;

  @override
  void onInit() {
    cNama = TextEditingController();
    cHarga = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    cNama.dispose();
    cHarga.dispose();
    super.onClose();
  }

  void addProduct(String nama, String harga) async {
    CollectionReference products = firestore.collection("products");
    try {
      products.add({
        "name": nama,
        "price": harga,
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Data berhasil diinput!",
          onConfirm: () {
            cNama.clear();
            cHarga.clear();
            Get.back();
            Get.back();
          });
    } catch (e) {
      print(e);
    }
  }
}
