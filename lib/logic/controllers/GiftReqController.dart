import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GiftReqController extends GetxController {
  var selectedAge =  "3-5 سنوات".obs;
  var selectedGender =  "ذكر".obs;
  var selectedMaterial =  "البلاستيك".obs;
  var selectedPrice =  "10000 - 20000".obs;
  var chexkboxValue = false.obs ;
  late TextEditingController  Gift_Occasion;


  Rx<List<DropdownMenuItem<String>>> lsAgeDropdownMenuItem =
      Rx<List<DropdownMenuItem<String>>>([]);

  var Agelist = [
    "3-5 سنوات",
    "5-10 سنوات",
    "10-18 سنوات",
    "18-25 سنوات",
    "25-40 سنوات",
    "أكثر من 40",
    "لا يهمني"
  ];
  var Genderlist = [
    "ذكر",
    "أنثى",
    "لا يهمني"
  ];
  var Materiallist = [
    "البلاستيك",
    "الزجاج",
    "الصدف",
    "لا يهمني"

  ];
  var Pricelist = [
    "10000 - 20000",
    "20000 - 30000",
    "30000 - 60000",
    "أكثر من 60000",
    "لا يهمني"

  ];

  void setSelectedAge(String value) {
    selectedAge.value = value;
  }
  void setSelectedGender(String value) {
    selectedGender.value = value;
  }
  void setSelectedMaterial(String value) {
    selectedMaterial.value = value;
  }
  void setSelectedPrice(String value) {
    selectedPrice.value = value;
  }

  String? validate_gender(String val) {
    if (val == "") {
      return 'الجنس مطلوب';
    }
    return null;
  }
  String? validate_age(String val) {
    if (val == "") {
      return 'العمر مطلوب';
    }
    return null;
  }
  String? validate_material(String val) {
    if (val == "") {
      return ' مطلوب';
    }
    return null;
  }
  String? validate_price(String val) {
    if (val == "") {
      return 'مطلوب';
    }
    return null;
  }

  bool? setCheckBox(var val){
    chexkboxValue.value = val ;
  }


  @override
  void onInit() {
    Gift_Occasion = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
  @override
  void dispose() {
    Gift_Occasion.dispose();
    super.dispose();
  }
}
