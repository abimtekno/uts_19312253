import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  final cAuth = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Akun'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: ListView(
          children: [
            SizedBox(
              height: 160,
            ),
            TextField(
              controller: controller.cEmail,
              decoration: InputDecoration(
                  hintText: "Email",
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: controller.cPass,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Password",
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => cAuth.signup(
                controller.cEmail.text,
                controller.cPass.text,
              ),
              child: Text("DAFTAR"),
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
