import 'package:get/get.dart';

import '../controllers/HomePageController.dart';
class HomeBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(() => HomePageController());


  }}