
import 'package:get/get.dart';

class ShopProfileController extends GetxController{
  var check_tap = true.obs;

  String selectedSection = 'خياطة';

  var items = [
    'خياطة',
    'اكسسوارات',
    'مواد تجميل',
    'ديكور منزل',
    'ماغات',
    'لوحات',
  ];

  void setselectedSection(var val){
    selectedSection = val;
    update() ;
  }

  void setcheck_tap(var val)
  {
    check_tap.value = val  ;
    update();
  }


}