import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:new_shop/logic/binding/Shops_Binding.dart';
import 'package:new_shop/logic/controllers/FavoriteController.dart';
import 'package:new_shop/logic/controllers/OrderController.dart';
import 'package:new_shop/routes/routes.dart';

import 'logic/binding/Initial_Binding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => FavoriteController(), fenix: true);
    Get.lazyPut(() => OrderController(), fenix: true);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.WelcomPage,
      getPages: AppPages.routes,
      initialBinding: Initial_Binding(),
    );
  }
}
