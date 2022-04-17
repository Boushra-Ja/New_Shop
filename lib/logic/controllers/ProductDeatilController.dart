import 'package:get/get.dart';

class ProductDeatilController extends GetxController{


  var selectedColor = "الأحمر".obs ;
  var selectedSize = "10".obs ;
  var selectedMaterial = "بلاستيك".obs ;
  var chexkboxValue = "yes".obs;
  var report_of_product = '' ;
  var size_list = 2.obs ;
  var Colorlist = [
    "الأحمر",
    "الأصفر",
    "الأزرق",
  ];

  void setSelectedColor(String val){
    selectedColor.value = val ;
  }
  void setSelectedSize(String val){
    selectedSize.value = val ;
  }
  void setSelectedMaterial(String val){
    selectedMaterial.value = val ;
  }
  void setchexkboxValue(String val){
    chexkboxValue.value = val ;
  }
  void set_reportofproduct(String val){
    report_of_product  = val ;
    update() ;
  }

  String? validate_material(String val) {
    if (val == "") {
      return ' مطلوب';
    }
    return null;
  }

  String? validate_color(String val) {
    if (val == "") {
      return ' مطلوب';
    }
    return null;
  }
  String? validate_size(String val) {
    if (val == "") {
      return ' مطلوب';
    }
    return null;
  }

  void increment_size(){
    size_list+=2 ;
  }
  String? validate_reportofproduct(String val) {
    if (val == "") {
      return ' مطلوب';
    }
    return null;
  }

}