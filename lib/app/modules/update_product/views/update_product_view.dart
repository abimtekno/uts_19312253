import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/update_product_controller.dart';

class UpdateProductView extends GetView<UpdateProductController> {
  const UpdateProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('UPDATE MAHASISWA'),
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
        body: FutureBuilder<DocumentSnapshot<Object?>>(
          future: controller.getData(Get.arguments),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var data = snapshot.data!.data() as Map<String, dynamic>;
              controller.cNPM.text = data['npm'];
              controller.cNAMA.text = data['nama'];
              controller.cALAMAT.text = data['alamat'];
              controller.cJK.text = data['jk'];
              controller.cPS.text = data['program_studi'];
              return Container(
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
                      onPressed: () => controller.updateProduct(
                        controller.cNPM.text,
                        controller.cNAMA.text,
                        controller.cALAMAT.text,
                        controller.cJK.text,
                        controller.cPS.text,
                        Get.arguments,
                      ),
                      child: Text("Edit"),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.orange),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
