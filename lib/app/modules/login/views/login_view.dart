import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final cAuth = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Lupa Password?"),
                TextButton(
                  onPressed: () => Get.toNamed(Routes.RESET_PASSWORD),
                  child: Text("Klik Disini"),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () => cAuth.login(
                controller.cEmail.text,
                controller.cPass.text,
              ),
              child: Text("LOGIN"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Belum punya akun?"),
                TextButton(
                  onPressed: () => Get.toNamed(Routes.SIGNUP),
                  child: Text("Daftar Disini"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
