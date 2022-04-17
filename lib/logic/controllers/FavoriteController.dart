import 'package:get/get.dart';

class FavoriteController extends GetxController {
  var Tabbar = 1.obs;



  void changeTabbar(int index) {

    Tabbar.value = index;

    update();
  }




}