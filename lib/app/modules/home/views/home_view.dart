import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project_get/app/controllers/auth_controller.dart';
import 'package:project_get/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final cAuth = Get.find<AuthController>();

  void showOption(id) async {
    var result = await Get.dialog(
      SimpleDialog(
        children: [
          ListTile(
            onTap: () {
              Get.back();
              Get.toNamed(Routes.UPDATE_PRODUCT, arguments: id);
            },
            title: Text("Edit"),
          ),
          ListTile(
            onTap: () => controller.deleteProduct(id),
            title: Text("Hapus"),
          ),
          ListTile(
            onTap: () => Get.back(),
            title: Text("Close"),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME'),
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
        actions: [
          IconButton(
            onPressed: () => cAuth.logout(),
            icon: Icon(Icons.logout),
          )
        ],
      ),
      // INI UPDATE AUTOMATIS
      body: StreamBuilder<QuerySnapshot<Object?>>(
        stream: controller.streamData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            // mengambil data
            var listAllDocs = snapshot.data!.docs;
            return ListView.builder(
              itemCount: listAllDocs.length,
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  child: Text('${index + 1}'),
                  backgroundColor: Colors.white,
                ),
                title: Text(
                    "${(listAllDocs[index].data() as Map<String, dynamic>)["npm"]}"),
                subtitle: Text("Nama: ${(listAllDocs[index].data() as Map<String, dynamic>)["nama"]}" +
                    "\n" +
                    "Alamat: ${(listAllDocs[index].data() as Map<String, dynamic>)["alamat"]}" +
                    "\n" +
                    "Program Study: ${(listAllDocs[index].data() as Map<String, dynamic>)["program_studi"]}" +
                    "\n" +
                    "Jenis Kelamin: ${(listAllDocs[index].data() as Map<String, dynamic>)["jk"]}"),
                trailing: IconButton(
                  onPressed: () => showOption(listAllDocs[index].id),
                  icon: Icon(Icons.more_vert),
                ),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      // INI UPDATE AUTOMATIS

      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_PRODUCTS),
        child: Icon(Icons.add),
        backgroundColor: Colors.orange, // Set the background color to orange
      ),
    );
  }
}
