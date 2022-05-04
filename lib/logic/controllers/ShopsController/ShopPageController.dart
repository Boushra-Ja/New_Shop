import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:new_shop/models/ShopModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ShopPageController extends GetxController {

  var selectedsortvalue = "الأكثر مبيعا";
  var items = [
    "الأكثر مبيعا",
    "الأفضل تقييما",
  ];

  List<Shop> ShopList = <Shop>[].obs ;
  var isLoading = true.obs ;


  @override
  void onInit() {
    super.onInit();
    print("onInit") ;
   // fetchShopData() ;

  }



  Future<void>fetchShopData()async{
    final response = await http.get(Uri.parse('http://192.168.1.107:8000/api/shops')) ;
    if(response.statusCode == 200)
      {
        ShopModel shopModel = ShopModel.fromJson(jsonDecode(response.body)) ;
        ShopList = shopModel.data ;

        isLoading.value = true ;

      }else{

      print("errorrrrr") ;
    }
  }

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