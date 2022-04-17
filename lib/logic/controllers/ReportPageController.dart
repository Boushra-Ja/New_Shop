import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ReportPageController extends GetxController{

  late TextEditingController name_controller ;
  var selectedshopname =  'shop1'.obs;

  var user_name = '' ;
  var content_report = '' ;
  late TextEditingController content_controller ;
  /////Dynamic list
  var shopsList = [
    'shop1' ,
    'Shop2'
  ].obs ;

  @override
  void onInit() {
    name_controller = TextEditingController () ;
    content_controller = TextEditingController () ;

    super.onInit();
  }

  @override
  void dispose() {
    name_controller.dispose();
    content_controller.dispose();
    super.dispose();
  }

  void set_username(var val )
  {
    user_name = val ;
    update() ;
  }
  void set_content(var val )
  {
    content_report = val ;
    update() ;
  }

  void set_selectedshopname(String val )
  {
    selectedshopname.value = val ;
  }

  String? validate_shopname(var val )
  {
    if(val == '')
      {
        return "الرجاء اختيار اسم المتجر أولا";
      }
    return null ;
  }
  String? validate_username(var val )
  {
    if(val == '')
    {
      return "مطلوب";
    }
    return null ;
  }

  String? validate_content(var val )
  {
    if(val == '')
    {
      return "مطلوب";
    }
    return null ;
  }
}