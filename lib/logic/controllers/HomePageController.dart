import 'package:get/get.dart';

class HomePageController extends GetxController {
  var tabIndex = 3;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}