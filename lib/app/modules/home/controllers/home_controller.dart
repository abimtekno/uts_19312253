import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> GetData() async {
    CollectionReference products = firestore.collection('products');
    return products.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference products = firestore.collection('products');
    return products.snapshots();
  }

  void deleteProduct(String doc) async {
    CollectionReference products = firestore.collection("products");
    try {
      products.doc(doc).delete();
      Get.back();
    } catch (e) {
      print(e);
    }
  }
}
