import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:new_shop/models/batool/CartModel.dart';
import '../../main.dart';

class CartController extends GetxController {

 var counter =''.obs;
 String  CartAmount ="";
 late TextEditingController
 CartAmountcontroller;

 var ListCArt = <Carts>[].obs;




  String? selectedValue;
  String? selectedValue2;
  void  onSelected(String value) async{
    selectedValue = value;
    print(selectedValue);
    update();
  }
  void  onSelected2(String value) async{
    selectedValue2 = value;
    print(selectedValue2);
    update();
  }
  late List jsonResponse;




  List_Cart() async {
    final response = await http.get(Uri.parse('${MyApp.api}/api/index'));
       print(response.body);
      CartsModel cartModel = CartsModel.fromJson(jsonDecode(response.body)) ;
      ListCArt.assignAll(cartModel.data );

      print(ListCArt.length) ;
      print(response.statusCode) ;
    if (response.statusCode == 200) {


      for(int i=0;i<ListCArt.length;i++)
      {
        for(int k=0;k<ListCArt[i].myProducts[0].all_review.length;k++)
          ListCArt[i].myProducts[0].review += ListCArt[i].myProducts[0].all_review.elementAt(k)['value'] as int;

      }
      for(int i=0;i<ListCArt.length;i++)
      {
        for(int k=0;k<ListCArt[i].myProducts[0].all_reviews.length;k++)
          ListCArt[i].myProducts[0].reviews+= ListCArt[i].myProducts[0].all_reviews.elementAt(k)['value'] as int;
        // print("\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\");
        //
        //     print( ListCArt[i].myProducts[0].reviews);
        // print("\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\");

      }
     // for(int i=0;i<ListCArt.length;i++)
     //      {
     //
     //        print(ListCArt[i].myProducts[i].reviews);
     //
     //      }



    }







   }



   @override
  void onInit() {


     CartAmountcontroller=TextEditingController();


     List_Cart();



   }



}