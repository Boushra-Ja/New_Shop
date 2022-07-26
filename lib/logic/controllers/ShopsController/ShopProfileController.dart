import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:new_shop/models/Boshra/Store/MyFavourite.dart';
import 'package:new_shop/models/Boshra/Store/Product_ClassModel.dart';
import '../../../main.dart';
import '../../../models/Boshra/Store/ShopModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../utls/Themes.dart';
import '../../../view/ShopsPages/RatingStore.dart';

class ShopProfileController extends GetxController{
  var check_tap = true.obs  , count = 1.obs ;
  var size_list = 4.obs ;
  final shop_id;
  late Shop shop_info ;
  String selectedSection = 'خياطة';
  var isLoading = true.obs , user_id , notes = "" , select_star = 0;
  Map<int , List<Product_Class>> products_classification = new HashMap() ;
  final storage=const FlutterSecureStorage();
  var items = [];
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  var check_star = <bool>[false, false , false , false , false].obs ;

  void increment_size(){
    int difference = shop_info.all_review.length - (count*4) ;
    if(difference  > 0)
      {
        if(difference - 4 > 0 )
          {
            size_list+= 4 ;
            difference-= 4 ;
          }
        else{
          size_list+= difference ;
        }

    }
    count++ ;
    update() ;

  }

  ShopProfileController(this.shop_id);

  void setselectedSection(var val){
    selectedSection = val;
    update() ;
  }

  void setcheck_tap(var val) {
    check_tap.value = val  ;
    update();
  }

  Future<void> fetchShopInfo()async{

    products_classification = {} ;
    final response = await http.get(Uri.parse('${MyApp.api}/api/stores/$shop_id')) ;
    final favourite = await http.get(Uri.parse('${MyApp.api}/api/myFavorite/1')) ;

    if(response.statusCode == 200 && favourite.statusCode == 200)
    {
      ShopModel shopModel = ShopModel.fromJson(jsonDecode(response.body)) ;
      MyFavouriteModel favorite_storeModel = MyFavouriteModel.fromJson(jsonDecode(favourite.body));

      shop_info = Shop(id: shopModel.data[0].id, shop_name: shopModel.data[0].shop_name, discription: shopModel.data[0].discription,
      image: shopModel.data[0].image,mobile: shopModel.data[0].mobile, email: shopModel.data[0].email, facebook: shopModel.data[0].facebook,
      num_of_salling: shopModel.data[0].num_of_salling, all_review: shopModel.data[0].all_review  ) ;
      await my_products();
      for(int i = 0 ; i < favorite_storeModel.data.length ; i++) {

        if(shop_id == favorite_storeModel.data.elementAt(i).store_id)
          {
            shop_info.isFavourite = true ;
            break ;
          }
        else
          shop_info.isFavourite = false ;

      }


      for(int j = 0 ; j <  shop_info.all_review.length ; j++)
        {
          shop_info.review += shop_info.all_review[j]['value'] as int ;
        }

        if(shop_info.all_review.length > 0) {
          shop_info.review = (shop_info.review / shop_info.all_review.length).toInt();
        }

        await isRating();
        isLoading.value = false ;

    }else{
      print("errorrrrr") ;
    }

  }

  Future<void> my_products()async{

    final response = await http.get(Uri.parse('${MyApp.api}/api/product_with_class/$shop_id')) ;

    if(response.statusCode == 200)
      {
        Product_ClassModel productModel = Product_ClassModel.fromJson(jsonDecode(response.body)) ;

        for(int i =0 ; i < productModel.data.length ; i++)
          {
            final favourite = await http.get(Uri.parse('${MyApp.api}/api/isFavourite/product/${productModel.data[i].id}/1')) ;
            if(products_classification.containsKey(productModel.data[i].classification_id)) {
              products_classification[productModel.data[i].classification_id]
                  ?.add(productModel.data[i]);

              if (favourite.body == "1") {
                products_classification[productModel.data[i].classification_id]!
                    .elementAt(products_classification[productModel.data[i]
                    .classification_id]!.length - 1).isFavourite = true;
              } else {
                products_classification[productModel.data[i].classification_id]!
                    .elementAt(products_classification[productModel.data[i]
                    .classification_id]!.length - 1).isFavourite = false;
              }
            }
            else
            {
              products_classification[productModel.data[i].classification_id] =  [productModel.data[i]] ;
              items.add(products_classification[productModel.data[i].classification_id]!.elementAt(0).classifications_title);

              if(favourite.body == "1")
                products_classification[productModel.data[i].classification_id]!.elementAt(0).isFavourite = true ;
              else
                products_classification[productModel.data[i].classification_id]!.elementAt(0).isFavourite = false ;

            }

          }
      }
    print(products_classification) ;
  }

  Future<void> addToFavouriteStore()async {

    final response = await http.post(
        Uri.parse('${MyApp.api}/api/FavoriteStore/Add_Favorite'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(<String, int>{
          "store_id": shop_id,
          "customer_id": 1,
        }));

    if(response.statusCode == 200)
    {
      shop_info.isFavourite = true ;
      print("Success") ;
      update() ;
    }

  }

  Future<void> deleteFromFavourite()async{
    final response = await http.delete(
        Uri.parse('${MyApp.api}/api/FavoriteStore/Delete_Favorite/${shop_id}/1'),
        headers: {
          'Accept':'application/json'
        });

    print(response.body);
    if(response.statusCode == 200)
      {
        print('success') ;
        shop_info.isFavourite = false ;
        update() ;


      }
  }

  Future<void> addToFavouriteProduct(int class_id , int product_id , int ind)async {

    final response = await http.post(
        Uri.parse('${MyApp.api}/api/FavoriteProduct/Add_Favorite/${product_id}'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(<String, int>{
          "customer_id": 1,
        }));

    print(response.body) ;
    if(response.body=="add_to_favorite")
    {
      products_classification[class_id]!.elementAt(ind).isFavourite = true;
      print("add") ;
      update() ;
    }
    else {
      products_classification[class_id]!.elementAt(ind).isFavourite = false;
      print("remove") ;
      update() ;
    }


  }

  Future<void> rating_store()async{
    user_id  = await storage.read(key: 'id') ;

    if(notes.isEmpty)
    {
      var form = formstate.currentState;
      form!.save();
    }


    final response = await http.post(
        Uri.parse('${MyApp.api}/api/rating_store'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(<String, dynamic>{
          "customer_id": int.parse(user_id),
          "store_id": shop_id,
          "notes" : notes ,
          "value" : select_star
        }));

    if(response.statusCode == 200)
    {
      print("successs");
      Get.back() ;
      Get.snackbar("", "شكراا على تفاعلك ^_^") ;
    }

  }

  Future<void> isRating()async{
    user_id  = await storage.read(key: 'id') ;
    final response = await http.get(
        Uri.parse('${MyApp.api}/api/isRating/store/${shop_id}/${user_id}'));
    if(response.statusCode == 200)
    {
      if(response.body =="1")
        shop_info.isRating = true ;
      else
        shop_info.isRating = false ;

      update() ;
    }
  }

  @override
  void onInit() async{
    super.onInit();
    await fetchShopInfo() ;
    if(!shop_info.isRating)
    {
      Get.defaultDialog(
        radius: 20 ,
        title: "ما هو تقييمك لهذا المتجر؟؟",
        titlePadding: EdgeInsets.only(top: 20),
        backgroundColor: Colors.grey.shade50.withOpacity(0.9),
        titleStyle: Themes.headline1,
        content : RatingStore(),
        barrierDismissible: false,

      );
    }
  }

}