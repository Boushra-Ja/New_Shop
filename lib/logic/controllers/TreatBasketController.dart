import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:new_shop/logic/controllers/orders/ShoppingBasket.dart';

class TreatBasketController extends GetxController {


   List<ShoppingBasket> maplist=[];

   var chexkboxValue=[false,false,false,false,false,false,false,false,false,false,false].obs;

   void setchexkboxValue(bool val,int id){

     // print(id);
     // print(val);
     // int h=int.parse(id);
     chexkboxValue.value[id-1]=val ;
     update();
   }





  @override
  void onInit() {
    maplist=Get.arguments["map"];
    // List<ShoppingBasket> bb=Get.arguments ;
    // for(int i=0;i<bb.length;i++)
    // maplist[i]=bb.elementAt(i);
    // print(maplist.elementAt(0).product_name);


    // for(int i=0;i<maplist.length;i++)
    //   chexkboxValue.value[i]=false;
    super.onInit();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
  }
}