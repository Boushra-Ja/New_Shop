import 'package:get/get.dart';

import '../controllers/ShopsController/ShopPageController.dart';

class Shops_Binding extends  Bindings{
  @override
  void dependencies() {
     Get.put<ShopPageController>(ShopPageController()) ;
  }

}