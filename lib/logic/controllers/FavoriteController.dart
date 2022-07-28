import 'dart:convert';
import 'package:get/get.dart';
import 'package:new_shop/models/batool/FavoriteProductModel.dart';
import 'package:http/http.dart' as http;
import '../../main.dart';
import '../../models/Boshra/Store/ShopModel.dart';
import '../../models/Boshra/products/ProductModel.dart';
import '../../models/batool/FavoriteStore.dart';

class FavoriteController extends GetxController {
  var Tabbar = 1.obs;
  var loading = true.obs;
  var check=''.obs;
  var listfavoite = <Product>[].obs;
  var listfavoitestore = <Shop>[].obs;
  late List jsonResponse;
  String? selectedValue;
  var isLoading = true.obs;

  void changeTabbar(int index) {
    Tabbar.value = index;
    update();
  }

  FetchData_favorite() async {


    final response = await http.get(Uri.parse('${MyApp.api}/api/FavoriteProduct/index'));
    ProductModel productModel = ProductModel.fromJson(jsonDecode(response.body));
    listfavoite.assignAll(productModel.data );

    if(response.statusCode==200 && listfavoite.isEmpty) {
      check.value='NODATA';
      print("99999");
      print( check.value);
      print( listfavoite.length);

      update();

    }



    if (response.statusCode == 200 && listfavoite.isNotEmpty) {
      check.value='DATA';
      print("11111");
      print( check.value);
      print( listfavoite.length);


      update();

      for(int i=0;i<listfavoite.length;i++)
        {
          for(int k=0;k<listfavoite[i].all_review.length;k++)
            listfavoite[i].review += listfavoite[i].all_review.elementAt(k)['value'] as int;


        }
    }


  }



  FetchData_favorite_store() async {

    final response = await http.get(Uri.parse('${MyApp.api}/api/FavoriteStore/Show_Favorite'));
    print(response.body);
   // if(response.body!=null)
    {
      ShopModel shopModel = ShopModel.fromJson(jsonDecode(response.body)) ;
      listfavoitestore.assignAll(shopModel.data );
      print("===============================================================");

      print(response.body);
      print("===============================================================");

      if (response.statusCode == 200) {



        for(int i=0;i<listfavoitestore.length;i++)
        {
          for(int k=0;k<listfavoitestore[i].all_review.length;k++)
            listfavoitestore[i].review += listfavoitestore[i].all_review.elementAt(k)['value'] as int ;
          int j=(listfavoitestore[i].review / 3) .toInt();  ;
          listfavoitestore[i].review = j    ;

        }
      }

    }


  }



  @override
  void onInit() {


     FetchData_favorite();
     FetchData_favorite_store();
    super.onInit();
  }





  void dispose() {
    super.dispose();
  }
}
