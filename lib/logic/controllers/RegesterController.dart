import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
import '../../services/auth_services.dart';

class RegisterController extends GetxController
{
  var isLoading = false.obs;
  // final registerFormkeyn = GlobalKey<FormState>();
  // final registerFormkeye = GlobalKey<FormState>();
  // final registerFormkeyp = GlobalKey<FormState>();
  final registerFormkey = GlobalKey<FormState>();


  late TextEditingController nameController, emailController, passwordController;
  String name = '', email = '', password = '';
 final storage=const FlutterSecureStorage();



  String temp = '';


  @override
  void onInit() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  void dispose() {
    nameController.dispose();
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

  doRegister() async {
    bool isvalidate = registerFormkey.currentState!.validate();

    // bool isvalidaten = registerFormkeyn.currentState!.validate();
    // bool isvalidatee = registerFormkeye.currentState!.validate();
    // bool isvalidatep = registerFormkeyp.currentState!.validate();
    // &&  isvalidatee  && isvalidatep
    if (isvalidate) {
      print("*******************valid**********************");
      isLoading.value = true;
      try {

        var data =
      await   AuthServices.register(
            name: nameController.text,
            email: emailController.text,
            password: passwordController.text);
        print("____________________________________________________");


        print("____________________________________________________");


        if(data != null) {
          print("___________________444444444444444444444444444_______________________");

        print(data.user);
       //  await storage.write(key: "d", value: data.token.toString());
         await storage.write(key: "token", value: data.token);

          ///await storage.write(key: "id", value: data.user.id);
          registerFormkey.currentState!.save();



          // registerFormkeyn.currentState!.save();
          // registerFormkeye.currentState!.save();
          // registerFormkeyp.currentState!.save();


          Get.toNamed('/HomePage');

        }
        else {

          Get.snackbar("تسجيل دحول ", "خطا في التسجيل...اعد المحاوله!!");
        }
      }finally {
        isLoading(false);

      }
    }
  }
}
