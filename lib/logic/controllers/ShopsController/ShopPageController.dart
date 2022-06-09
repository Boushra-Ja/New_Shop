import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../models/Boshra/Store/ShopModel.dart';

class ShopPageController extends GetxController {

  RxString selectedsortvalue = "جميع المتاجر".obs ;
  var items = [
    "جميع المتاجر" ,
    "الأكثر مبيعا",
    "الأفضل تقييما",
  ];

  List<Shop> ShopList = <Shop>[].obs ;
  var isLoading = true.obs ;


  @override
  void onInit() {
    super.onInit();
    fetchALlStores() ;
  }



  Future<void>fetchALlStores()async{
    final response = await http.get(Uri.parse('http://192.168.137.148:8000/api/stores')) ;
    if(response.statusCode == 200)
      {

          isLoading.value = true;
          ShopModel shopModel = ShopModel.fromJson(jsonDecode(response.body)) ;
          ShopList.assignAll(shopModel.data );

          isLoading.value = false;

        for(int i = 0 ; i < ShopList.length ; i++)
          {
            for(int j = 0 ; j <  ShopList[i].all_review.length ; j++)
              {
                ShopList[i].review += ShopList[i].all_review[j]['value'] as int ;
              }
            if(ShopList[i].all_review.length > 0)
                ShopList[i].review = (ShopList[i].review /ShopList[i].all_review.length).toInt()  ;

          }
      }else{
      print("errorrrrr") ;
    }
  }

  Future<void>StoresMoreSales()async{
    final response = await http.get(Uri.parse('http://192.168.137.148:8000/api/stores/order/sales')) ;
    if(response.statusCode == 200)
    {
      ShopModel shopModel = ShopModel.fromJson(jsonDecode(response.body)) ;
     // ShopList = shopModel.data ;
      ShopList.assignAll(shopModel.data );
      for(int i = 0 ; i < ShopList.length ; i++)
      {
        for(int j = 0 ; j <  ShopList[i].all_review.length ; j++)
        {
          ShopList[i].review += ShopList[i].all_review[j]['value'] as int ;
        }
        if(ShopList[i].all_review.length > 0)
          ShopList[i].review = (ShopList[i].review /ShopList[i].all_review.length).toInt()  ;

      }

      isLoading.value = false ;

    }else{

      print("errorrrrr") ;
    }
  }

  Future<void>StoresMoreReview()async{
    final response = await http.get(Uri.parse('http://192.168.137.148:8000/api/stores/order/reviews')) ;
    if(response.statusCode == 200)
    {
      ShopModel shopModel = ShopModel.fromJson(jsonDecode(response.body)) ;
      ShopList.assignAll(shopModel.data );
      for(int i = 0 ; i < ShopList.length ; i++)
      {
        for(int j = 0 ; j <  ShopList[i].all_review.length ; j++)
        {
          ShopList[i].review += ShopList[i].all_review[j]['value'] as int ;
        }
        if(ShopList[i].all_review.length > 0)
          ShopList[i].review = (ShopList[i].review /ShopList[i].all_review.length).toInt()  ;

      }

      isLoading.value = false ;

    }else{

      print("errorrrrr") ;
    }
  }

  void setselectedvalue(var val)
  {
    selectedsortvalue  = val ;
  }

  String? validate_value(String val) {
    if (val == "") {
      return ' مطلوب';
    }
    return null;
  }
}