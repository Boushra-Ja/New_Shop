import 'package:get/get.dart';

class ChatController extends GetxController {

  var  Images ="".obs;
  var  Title ="".obs;
  var  SubTitle ="".obs;
@override
  void onInit() {
  Title.value=Get.arguments["Title"];
  Images.value=Get.arguments["Image"];
  SubTitle.value=Get.arguments["SubTitle"];
  }
}