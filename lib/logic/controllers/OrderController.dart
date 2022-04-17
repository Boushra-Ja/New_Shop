import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  var Index = 2;
  List<Widget> _dropdownItems2 = [
    Text ("دمشق"),Text("صحنايا"),Text("درعا"),
  ];

  List<String> io = [
   "دمشق","صحنايا","درعا",
  ];

  List<String> io2 = [
    "دمشق","صحنايا","درعا",
  ];
  String? selectedValue;
  void  onSelected(String value) async{
    selectedValue = value;
    print(selectedValue);
    update();
  }

  String? selectedValue2;
  void  onSelected2(String value) async{
    selectedValue2 = value;
    print(selectedValue2);
    update();
  }

}