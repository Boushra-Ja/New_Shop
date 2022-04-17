import 'package:get/get.dart';

class ShopPageController extends GetxController {

  var selectedsortvalue = "الأكثر مبيعا";
  var items = [
    "الأكثر مبيعا",
    "الأفضل تقييما",
  ];


  void setselectedvalue(String val)
  {
    selectedsortvalue  = val ;
    update();
  }

  String? validate_value(String val) {
    if (val == "") {
      return ' مطلوب';
    }
    return null;
  }
}