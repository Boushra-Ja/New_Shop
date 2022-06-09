import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';

import '../../services/auth_services.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  final loginFormkey = GlobalKey<FormState>();
  late TextEditingController  emailController, passwordController;
  String name = '', email = '', password = '';
  final storage=const FlutterSecureStorage();

  @override
  void onInit() {

    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "this is wrong email";
    } else {

      return null;
    }
  }

  String? validatePassword(String value) {
    if (value.length <= 5) {

      return "this is wrong password";
    } else {

      return null;
    }
  }

  doLogin() async {
    bool isvalidate = loginFormkey.currentState!.validate();
    if (isvalidate) {
      print("*******************valid**********************");
      isLoading.value = true;
      try {
        var data = await AuthServices.login(
            email: emailController.text,
            password: passwordController.text);
        print("____________________________________________________");

        print("____________________________________________________");


        if(data != null) {
         // await storage.write(key: "name", value: data.user.name);
         await storage.write(key: "token", value: data.token);
          loginFormkey.currentState!.save();
          // Get.to (()=>InsertProductsView());
          Get.toNamed('/HomePage');

        }
        else {
          Get.snackbar("Login", "problem in login");
        }
      }finally {
        isLoading(false);
      }
    }
  }
}
