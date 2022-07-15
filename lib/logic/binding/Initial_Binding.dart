import 'package:get/get.dart';
import 'package:new_shop/logic/controllers/OrderController.dart';
import 'package:new_shop/logic/controllers/orders/OrdersController.dart';

import '../controllers/HomePageController.dart';
import '../controllers/ShopsController/ShopPageController.dart';

class Initial_Binding extends  Bindings{
  @override
  void dependencies() {
    Get.put<ShopPageController>(ShopPageController()) ;
    Get.put<OrdersController>(OrdersController()) ;

    Get.lazyPut<HomeController>(
          () => HomeController(),fenix: true
    );
    }

}