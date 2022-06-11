import 'package:get/get.dart';
import 'package:new_shop/models/Boshra/Store/MyFavourite.dart';
import '../../../main.dart';
import '../../../models/Boshra/Store/ShopModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ShopProfileController extends GetxController{
  var check_tap = true.obs  ;
  var size_list = 0.obs ;
  var new_size = 0.obs ;
  final shop_id;
  late Shop shop_info ;
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

    final response = await http.get(Uri.parse('${MyApp.api}/api/stores/$shop_id')) ;
    final favourite = await http.get(Uri.parse('${MyApp.api}/api/myFavorite/4')) ;

    if(response.statusCode == 200 && favourite.statusCode == 200)
    {
      ShopModel shopModel = ShopModel.fromJson(jsonDecode(response.body)) ;
      MyFavouriteModel favorite_storeModel = MyFavouriteModel.fromJson(jsonDecode(favourite.body));

      shop_info = Shop(id: shopModel.data[0].id, shop_name: shopModel.data[0].shop_name, discription: shopModel.data[0].discription,
      image: shopModel.data[0].image,mobile: shopModel.data[0].mobile, email: shopModel.data[0].email, facebook: shopModel.data[0].facebook,
      num_of_salling: shopModel.data[0].num_of_salling, all_review: shopModel.data[0].all_review , all_products : shopModel.data[0].all_products  ) ;

      for(int i = 0 ; i < favorite_storeModel.data.length ; i++) {

        if(shop_id == favorite_storeModel.data.elementAt(i).store_id)
          {
            shop_info.isFavourite = true ;
            break ;
          }
        else
          shop_info.isFavourite = false ;

      }

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


  Future<void> addToFavouriteStore()async {
    final response = await http.post(
        Uri.parse('${MyApp.api}/api/FavoriteStore/Add_Favorite/$shop_id'),
        headers: {'Content-Type': 'application/json', 'Authorization':'Bearer '+'3|oOaSMCUlb4vpXa1JbbtymRutVtXhefkBbLEnJrqT',},
        body: jsonEncode(<String, int>{
          "store_id": shop_id,

        }));

    if(response.statusCode == 200)
    {
      print(shop_info.isFavourite);
      shop_info.isFavourite = true ;
      print(shop_info.isFavourite);

      print("Success") ;
      update() ;
    }

  }

  Future<void> deleteFromFavourite()async{
    final response = await http.delete(
        Uri.parse('${MyApp.api}/api/FavoriteStore/Delete_Favorite/$shop_id'),
        headers: { 'Authorization':'Bearer '+'3|oOaSMCUlb4vpXa1JbbtymRutVtXhefkBbLEnJrqT',});

    if(response.statusCode == 200)
      {
        print('success') ;
        shop_info.isFavourite = false ;
        update() ;


      }
  }


  @override
  void onInit() async{
    super.onInit();
    await fetchShopInfo() ;
  }



}