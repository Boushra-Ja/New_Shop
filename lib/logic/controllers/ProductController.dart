import 'dart:convert';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:new_shop/models/batool/Category2Model.dart';
import 'package:new_shop/models/batool/CategoryModel.dart';
import 'package:http/http.dart' as http;
import 'package:new_shop/models/batool/ProductModel.dart';
import '../../main.dart';
import '../../models/batool/FavoriteProduct2Model.dart';
import '../../models/batool/ProductModel.dart';
import '../../models/batool/SalesModel.dart';

class ProductController extends GetxController {
  var flist = <int>[].obs;

  var loading = true.obs;
  var listpoduct_discount = <products>[].obs;
  var listpoduct_salary = <Sales>[].obs;
  var listpoduct_sales = <Sales>[].obs;
  var listpoduct_favorite = <products>[].obs;

  var isLoading = true.obs  ;


  var listpoduct_f = <Favorite_product2>[].obs;
  var listpoduct_classification = <categories>[].obs;
  var list1_Secondary = <categories2>[].obs;
  var list2_Secondary = <categories2>[].obs;
  var list3_Secondary = <categories2>[].obs;
  var list4_Secondary = <categories2>[].obs;
  var list5_Secondary = <categories2>[].obs;
  var list6_Secondary = <categories2>[].obs;
  var list7_Secondary = <categories2>[].obs;
  var list8_Secondary = <categories2>[].obs;
  var list9_Secondary = <categories2>[].obs;
  var list10_Secondary = <categories2>[].obs;
  late List jsonResponse;
  var selectedImagePath = "".obs;
  String? selectedValue1;
  String? selectedValue2;
  String? selectedValue3;
  String? selectedValue4;
  String? selectedValue5;
  String? selectedValue6;
  String? selectedValue7;
  String? selectedValue8;
  String? selectedValue9;
  String? selectedValue10;
  var Col = 1.obs;
  late String token;
  var col =0.obs;

  drop( var id, var title) async {
    final response = await http.get(
      Uri.parse('${MyApp.api}/api/Product/ShowClassification/$id/$title'),);

    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      print(response.body);
      return jsonResponse.map((data) => new products.fromJson(data)).toList();
    } else
      return null;
  }

  drops( var id, var title) async {
    final response = await http.get(
      Uri.parse('${MyApp.api}/api/Product/ShowClassification/$id/$title'),);

    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      print(response.body);
      return jsonResponse.map((data) => new Sales.fromJson(data)).toList();
    } else
      return null;
  }

  call_drops(var id ,var title) async {
    try {
      loading.value = true;

      var result2 = await drops(id,title);

      if (result2 != null) {
          if (id==1)
             listpoduct_sales.assignAll(result2);
          if (id==2)
             listpoduct_salary.assignAll(result2);

      } else
        print("null");
    } finally {
      loading.value = false;
    }
    update();
  }
  call_drop(var id ,var title) async {
    try {
      loading.value = true;

      var result2 = await drop(id,title);

      if (result2 != null) {

          if (id==3)
             listpoduct_discount.assignAll(result2);
          if (id==4)
             listpoduct_favorite.assignAll(result2);


      } else
        print("null");
    } finally {
      loading.value = false;
    }
    update();
  }
  bool check(int product_id){

    for(int i=0;i<listpoduct_f.length;i++){
      if(product_id==listpoduct_f.elementAt(i).product_id)
        return true;



    }
    return false;

  }
  void changeCol(var data, int col, int product_id) {
    if (data == "add") {
      print("to red");
    } else {
      print("to black");
    }

    Col.value = col;

    update();
  }


  FetcDhataList_classification(/*{required  token}*/) async {
      final response = await http.get(
        Uri.parse('${MyApp.api}/api/Show_p')
      );

    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => new categories.fromJson(data)).toList();
    } else
      return null;
  }

  get()async{
    // var col =0.obs;
    var c =await storage.read(key: "isDarkMode") ;
    if(c=="false")
    {

      col.value=0;
      print("********************false****************************");

    }
    else {
      col.value=1;
      print("********************true****************************");


    }

  }
  FetcDhataList_f(/*{required  token}*/) async {
      final response = await http.get(
        Uri.parse('${MyApp.api}/api/FavoriteProduct/show'),
      );

    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((data) => new Favorite_product2.fromJson(data))
          .toList();
    } else
      return null;
  }

  FetcDhataList_Secondary(id) async {
    final response = await http.get(
      Uri.parse('${MyApp.api}/api/Product/ShowClassification2/$id'),
    );

    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((data) => new categories2.fromJson(data))
          .toList();
    } else
      return null;
  }

  FetcDhataList_discount(/*{required  token}*/) async {
    final response = await http.get(
      Uri.parse('${MyApp.api}/api/Product/Order_discount'),

    );

    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => new products.fromJson(data)).toList();
    } else
      return null;
  }

  Future<void>discount_get()async{
    final response = await http.get(
      Uri.parse('${MyApp.api}/api/Product/Order_discount'),

    );  if(response.statusCode == 200)
    {
      productsModel shopModel = productsModel.fromJson(jsonDecode(response.body)) ;
      listpoduct_discount.assignAll(shopModel.data );
      for(int i = 0 ; i < listpoduct_discount.length ; i++)
      {

        if(listpoduct_discount[i].rating.length!=0)
        for(int j = 0 ; j <  listpoduct_discount[i].rating.length ; j++) {

                if(listpoduct_discount[i].rating[j]['value'] as int==0)
                      listpoduct_discount[i].count_0 ++ ;

                    else if(listpoduct_discount[i].rating[j]['value'] as int==1)
                      listpoduct_discount[i].count_1 ++ ;

                    else  if(listpoduct_discount[i].rating[j]['value'] as int==2)
                      listpoduct_discount[i].count_2 ++ ;

              }
            else{
              listpoduct_discount[i].count_0 =-1 ;
              listpoduct_discount[i].count_1 =-1 ;
              listpoduct_discount[i].count_2 =-1 ;



          }




        if( listpoduct_discount[i].count_0 > listpoduct_discount[i].count_1)
          {

            if(listpoduct_discount[i].count_0 >listpoduct_discount[i].count_2)
              listpoduct_discount[i].rating=0;
            else
              listpoduct_discount[i].rating=2;
          }
        else if( listpoduct_discount[i].count_0 < listpoduct_discount[i].count_1)
        {

          if(listpoduct_discount[i].count_1 >listpoduct_discount[i].count_2)
            listpoduct_discount[i].rating=1;
          else
            listpoduct_discount[i].rating=2;
        }





        if(listpoduct_discount[i].count_0==listpoduct_discount[i].count_1)
          if(listpoduct_discount[i].count_1==listpoduct_discount[i].count_2)
            if(listpoduct_discount[i].count_1!=-1)
              listpoduct_discount[i].rating=1;











      }



      isLoading.value = false ;
    }else{
      print("errorrrrr") ;
    }
  }

  FetcDhataList_salary(/*{required  token}*/) async {
    final response = await http.get(
      Uri.parse('${MyApp.api}/api/Product/Order_Salary'),
    );

    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);



      return jsonResponse.map((data) => new Sales.fromJson(data)).toList();
    } else
      return null;
  }

  FetcDhataList_sales(/*{required  token}*/) async {
    final response = await http.get(
      Uri.parse('${MyApp.api}/api/Product/Order_sales'),
    );

    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => new Sales.fromJson(data)).toList();
    } else
      return null;
  }

  FetcDhataList_favorite(/*{required  token}*/) async {
    final response = await http.get(
      Uri.parse('${MyApp.api}/api/Product/Order_favorite'),
    );

    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => new products.fromJson(data)).toList();
    } else
      return null;
  }

  @override
  void onInit() {
   // getData1();
    get();
    getData2();
    discount_get();
    getData3();
    getData4();
    getData5();
    getData7();
    for (int i = 1; i <= 10; i++)
      getData6(i);

    super.onInit();
  }

  // getData1() async {
  //   try {
  //     loading.value = true;
  //
  //     var result = await FetcDhataList_discount(
  //       // token : await storage.read(key: "token"),
  //     );
  //
  //     if (result != null) {
  //       listpoduct_discount.assignAll(result);
  //     } else
  //       print("null");
  //   } finally {
  //     loading.value = false;
  //   }
  //   update();
  // }

  getData2() async {
    try {
      loading.value = true;
      var result2 = await FetcDhataList_f(
        // token : await storage.read(key: "token"),
      );

      if (result2 != null) {

        listpoduct_f.assignAll(result2);


      } else
        print("null");
    } finally {
      loading.value = false;
    }
    update();
  }

  getData3() async {
    try {
      loading.value = true;

      var result3 = await FetcDhataList_salary(
        // token : await storage.read(key: "token"),
      );

      if (result3 != null) {
        listpoduct_salary.assignAll(result3);
      } else
        print("null");
    } finally {
      loading.value = false;
    }
    update();
  }

  getData4() async {
    try {
      loading.value = true;

      var result4 = await FetcDhataList_sales(
        // token : await storage.read(key: "token"),
      );

      if (result4 != null) {
        listpoduct_sales.assignAll(result4);
        print(listpoduct_sales.length);

      } else
        print("null______________________________");
    } finally {
      loading.value = false;
    }
    update();
  }

  getData5() async {
    try {
      loading.value = true;

      var result4 = await FetcDhataList_classification(
        // token : await storage.read(key: "token"),
      );

      if (result4 != null) {
        listpoduct_classification.assignAll(result4);
      } else
        print("null");
    } finally {
      loading.value = false;
    }
    update();
  }

  getData7() async {
    try {
      loading.value = true;

      var result4 = await FetcDhataList_favorite(
        // token : await storage.read(key: "token"),
      );

      if (result4 != null) {
        listpoduct_favorite.assignAll(result4);
      } else
        print("null");
    } finally {
      loading.value = false;
    }
    update();
  }

  getData6(id) async {
    try {
      loading.value = true;

      var result = await FetcDhataList_Secondary(id);
      if (result != null) {
        if (id == 1)
          list1_Secondary.assignAll(result);
        else if (id == 2)
          list2_Secondary.assignAll(result);
        else if (id == 3)
          list3_Secondary.assignAll(result);
        else if (id == 4)
          list4_Secondary.assignAll(result);
        else if (id == 5)
          list5_Secondary.assignAll(result);
        else if (id == 6)
          list6_Secondary.assignAll(result);
        else if (id == 7)
          list7_Secondary.assignAll(result);
        else if (id == 8)
          list8_Secondary.assignAll(result);
        else if (id == 9)
          list9_Secondary.assignAll(result);
        else
          list10_Secondary.assignAll(result);
      } else
        print("null");
    } finally {
      loading.value = false;
    }
    update();
  }

  void onSelected(String value, id) async {
    if (id == 1)
      selectedValue1 = value;
    else if (id == 2)
      selectedValue2 = value;
    else if (id == 3)
      selectedValue3 = value;
    else if (id == 4)
      selectedValue4 = value;
    else if (id == 5)
      selectedValue5 = value;
    else if (id == 6)
      selectedValue6 = value;
    else if (id == 7)
      selectedValue7 = value;
    else if (id == 8)
      selectedValue8 = value;
    else if (id == 9)
      selectedValue9 = value;
    else if (id == 10) selectedValue10 = value;

    //await storage.write(key: "name_pub", value: selectedValue);
    update();
  }
}





































































  // Get_Classification() async {
  //   final response = await http.get(
  //     Uri.parse('${MyApp.api}/api/Show_p')
  //   );
  //
  //   categoryModel cat= categoryModel.fromJson(jsonDecode(response.body)) ;
  //   if (response.statusCode == 200) {
  //     listpoduct_classification.assignAll(cat.data);
  //   }
  // }
  // Get_F() async {
  //   final response = await http.get(
  //     Uri.parse('${MyApp.api}/api/FavoriteProduct/show'),
  //   );
  //   Favorite_product2Model favorite_product2= Favorite_product2Model.fromJson(jsonDecode(response.body)) ;
  //
  //   if (response.statusCode == 200) {
  //     listpoduct_f.assignAll(favorite_product2.data);
  //   }
  // }
  // Get_SecondaryClassification(id) async {
  //   final response = await http.get(
  //     Uri.parse('${MyApp.api}/api/Product/ShowClassification2/$id'),);
  //
  //   if (response.statusCode == 200) {
  //     jsonResponse = json.decode(response.body);
  //     return jsonResponse
  //         .map((data) => new categories2.fromJson(data))
  //         .toList();
  //   } else
  //     return null;
  // }
  // Get_Discount() async {
  //   final response = await http.get(Uri.parse('${MyApp.api}/api/Product/Order_discount'),);
  //   productsModel productModel= productsModel.fromJson(jsonDecode(response.body)) ;
  //   if (response.statusCode == 200) {
  //     listpoduct_discount.assignAll(productModel.data);
  //   }
  // }
  // Get_Salary() async {
  //   final response = await http.get(Uri.parse('${MyApp.api}/api/Product/Order_Salary'),);
  //   productsModel productModel= productsModel.fromJson(jsonDecode(response.body)) ;
  //   if (response.statusCode == 200) {
  //     listpoduct_salary.assignAll(productModel.data);
  //   }
  //
  // }
  // Get_Sale() async {
  //   final response = await http.get(Uri.parse('${MyApp.api}/api/Product/Order_sales'),);
  //
  //   productsModel productModel= productsModel.fromJson(jsonDecode(response.body)) ;
  //   if (response.statusCode == 200) {
  //     listpoduct_sales.assignAll(productModel.data);
  //   }
  // }
  // Get_Favorite() async {
  //   final response = await http.get(Uri.parse('${MyApp.api}/api/Product/Order_favorite'),);
  //
  //
  //   productsModel productModel= productsModel.fromJson(jsonDecode(response.body)) ;
  //   if (response.statusCode == 200) {
  //     listpoduct_favorite.assignAll(productModel.data);
  //   }
  // }
//   @override
//   void onInit() {
//     get();
//    // Get_F();
//     //Get_Discount();Get_Salary();Get_Sale();Get_Favorite();Get_Classification();
//
//     for (int i = 1; i <= 10; i++)
//       getData6(i);
//
//     super.onInit();
//   }
//
//
//
//
//
//   getData6(id) async {
//     try {
//       loading.value = true;
//
//       var result = await Get_SecondaryClassification(id);
//       if (result != null) {
//         if (id == 1)
//           list1_Secondary.assignAll(result);
//         else if (id == 2)
//           list2_Secondary.assignAll(result);
//         else if (id == 3)
//           list3_Secondary.assignAll(result);
//         else if (id == 4)
//           list4_Secondary.assignAll(result);
//         else if (id == 5)
//           list5_Secondary.assignAll(result);
//         else if (id == 6)
//           list6_Secondary.assignAll(result);
//         else if (id == 7)
//           list7_Secondary.assignAll(result);
//         else if (id == 8)
//           list8_Secondary.assignAll(result);
//         else if (id == 9)
//           list9_Secondary.assignAll(result);
//         else
//           list10_Secondary.assignAll(result);
//       } else
//         print("null");
//     } finally {
//       loading.value = false;
//     }
//     update();
//   }
//
//   String? selectedValue1;
//   String? selectedValue2;
//   String? selectedValue3;
//   String? selectedValue4;
//   String? selectedValue5;
//   String? selectedValue6;
//   String? selectedValue7;
//   String? selectedValue8;
//   String? selectedValue9;
//   String? selectedValue10;
//
//   void onSelected(String value, id) async {
//     if (id == 1)
//       selectedValue1 = value;
//     else if (id == 2)
//       selectedValue2 = value;
//     else if (id == 3)
//       selectedValue3 = value;
//     else if (id == 4)
//       selectedValue4 = value;
//     else if (id == 5)
//       selectedValue5 = value;
//     else if (id == 6)
//       selectedValue6 = value;
//     else if (id == 7)
//       selectedValue7 = value;
//     else if (id == 8)
//       selectedValue8 = value;
//     else if (id == 9)
//       selectedValue9 = value;
//     else if (id == 10) selectedValue10 = value;
//
//     //await storage.write(key: "name_pub", value: selectedValue);
//     update();
//   }
// }
