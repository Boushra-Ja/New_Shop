import 'package:get/get.dart';

import '../controllers/HomePageController.dart';
import '../controllers/ShopsController/ShopPageController.dart';

class Initial_Binding extends  Bindings{
  @override
  void dependencies() {
    Get.put<ShopPageController>(ShopPageController()) ;
    Get.lazyPut<HomeController>(() => HomeController(),fenix: true
    );  }

}