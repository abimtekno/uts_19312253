import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_products_controller.dart';

class AddProductsView extends GetView<AddProductsController> {
  const AddProductsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TAMBAH MAHASISWA'),
        centerTitle: true,
        backgroundColor: Colors.orange, // Set the background color to orange
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/uti.png', // Replace with your image path
            width: 50, // Set the width as needed
            height: 50, // Set the height as needed
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: ListView(
          children: [
            TextField(
              controller: controller.cNPM,
              decoration: InputDecoration(
                  hintText: "NPM",
                  labelText: "NPM",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: controller.cNAMA,
              decoration: InputDecoration(
                  hintText: "NAMA",
                  labelText: "NAMA",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: controller.cALAMAT,
              decoration: InputDecoration(
                  hintText: "ALAMAT",
                  labelText: "ALAMAT",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: controller.cJK,
              decoration: InputDecoration(
                  hintText: "JENIS KELAMIN",
                  labelText: "JENIS KELAMIN",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: controller.cPS,
              decoration: InputDecoration(
                  hintText: "PROGRAM STUDI",
                  labelText: "PROGRAM STUDI",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => controller.addProduct(
                controller.cNPM.text,
                controller.cNAMA.text,
                controller.cALAMAT.text,
                controller.cJK.text,
                controller.cPS.text,
              ),
              child: Text("SUBMIT"),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.orange),
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
