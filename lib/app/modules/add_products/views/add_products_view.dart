import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_products_controller.dart';

class AddProductsView extends GetView<AddProductsController> {
  const AddProductsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Produk'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: ListView(
          children: [
            TextField(
              controller: controller.cNama,
              decoration: InputDecoration(
                  hintText: "Name",
                  labelText: "Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: controller.cHarga,
              decoration: InputDecoration(
                  hintText: "Price",
                  labelText: "Price",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => controller.addProduct(
                controller.cNama.text,
                controller.cHarga.text,
              ),
              child: Text("SUBMIT"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
