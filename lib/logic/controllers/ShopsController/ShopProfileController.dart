import 'package:get/get.dart';
import '../../../models/Boshra/Store/ShopModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ShopProfileController extends GetxController{
  var check_tap = true.obs ;
  var size_list = 0.obs ;
  var new_size = 0.obs ;
  final shop_id;
  var shop_info ;
  String selectedSection = 'خياطة';
  var isLoading = true.obs  ;
  var items = [
    'خياطة',
    'اكسسوارات',
    'مواد تجميل',
    'ديكور منزل',
    'ماغات',
    'لوحات',
  ];

  void increment_size(){
    size_list.value += ( new_size.value) % 4 ;
    new_size.value = shop_info.all_review.length  - size_list.value ;
  }

  ShopProfileController(this.shop_id);


  void setselectedSection(var val){
    selectedSection = val;
    update() ;
  }

  void setcheck_tap(var val)
  {
    check_tap.value = val  ;
    update();
  }

  Future<void> fetchShopInfo()async{

    final response = await http.get(Uri.parse('http://192.168.137.237:8000/api/stores/$shop_id')) ;

    if(response.statusCode == 200)
    {
      ShopModel shopModel = ShopModel.fromJson(jsonDecode(response.body)) ;
      shop_info = Shop(id: shopModel.data[0].id, shop_name: shopModel.data[0].shop_name, discription: shopModel.data[0].discription,
      image: shopModel.data[0].image,mobile: shopModel.data[0].mobile, email: shopModel.data[0].email, facebook: shopModel.data[0].facebook,
      num_of_salling: shopModel.data[0].num_of_salling, all_review: shopModel.data[0].all_review , all_products : shopModel.data[0].all_products  ) ;

      new_size.value = shop_info.all_review.length ;

      for(int j = 0 ; j <  shop_info.all_review.length ; j++)
        {
          shop_info.review += shop_info.all_review[j]['value'] as int ;
        }

        if(shop_info.all_review.length > 0) {
          shop_info.review = (shop_info.review / shop_info.all_review.length).toInt();
          size_list.value = ( new_size.value) % 10 ;
          new_size.value = shop_info.all_review.length  - size_list.value ;
        }

          isLoading.value = false ;
    }else{
      print("errorrrrr") ;
    }

  }

  @override
  void onInit() async{
    super.onInit();
    await fetchShopInfo() ;
  }



}