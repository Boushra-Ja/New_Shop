import 'package:get/get.dart';
import 'package:new_shop/view/ShopsPages/ShopsPage.dart';

class Shops_Binding extends  Bindings{
  @override
  void dependencies() {
     Get.lazyPut (() => ShopsPage());
  }

}