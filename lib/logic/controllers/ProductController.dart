import 'dart:convert';

import 'package:get/get.dart';
import 'package:new_shop/models/batool/Category2Model.dart';
import 'package:new_shop/models/batool/CategoryModel.dart';
import 'package:http/http.dart' as http;

import '../../models/batool/FavoriteProduct2Model.dart';
import '../../models/batool/ProductModel.dart';


class ProductController extends GetxController {

  var flist = <int>[].obs;

  var loading = true.obs;
  var listpoduct_discount = <products>[].obs;
  var listpoduct_salary = <products>[].obs;
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
  var listpoduct_sales = <products>[].obs;
  var listpoduct_favorite = <products>[].obs;
  late List jsonResponse;
  var  selectedImagePath ="".obs;
  var  DateNow ="".obs;
  var nameuser="".obs;
  var namepub="".obs;
  var Col=1.obs;
  void changeCol( var data,int col,int product_id) {

     if (data=="add")
       {

         print("to red");}

       else
         {
           print("to black");}

      Col.value = col;



    update();
  }


  late String token;
  //final storage=const FlutterSecureStorage();



  FetcDhataList_classification(/*{required  token}*/) async {
    final response =
    await http.get(Uri.parse('http://192.168.137.102:8000/api/Show_p'),
      // headers: {  'Authorization':'Bearer '+'${token}'
      // }
    );
    print("********************hhhhhh*******************************************hhhhhhh*************");

    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      print(response.body);
      print(jsonResponse);

      return jsonResponse.map((data) => new categories.fromJson(data)).toList();
    } else
      return ('Unexpected error occured!');
  }
  FetcDhataList_f(/*{required  token}*/) async {
    final response =
    await http.get(Uri.parse('http://192.168.137.102:8000/api/Product_Allf'),
      // headers: {  'Authorization':'Bearer '+'${token}'
      // }
    );
    print("********************hhhhhh*******************************************hhhhhhh*************");

    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      print(response.body);
      print(jsonResponse);

      return jsonResponse.map((data) => new Favorite_product2.fromJson(data)).toList();
    } else
      return ('Unexpected error occured!');
  }
  FetcDhataList_Secondary( id) async {
    final response =
    await http.get(Uri.parse('http://192.168.137.102:8000/api/Product/ShowClassification2/$id'),
    );

    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      print(response.body);

      print('wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq');
      print(jsonResponse);

      return jsonResponse.map((data) => new categories2.fromJson(data)).toList();
    } else
      return ('Unexpected error occured!');
  }


  FetcDhataList_discount(/*{required  token}*/) async {
    final response =
    await http.get(Uri.parse('http://192.168.137.102:8000/api/Product/Product_Order_discount'),
      // headers: {  'Authorization':'Bearer '+'${token}'
      // }
    );
    print("********************hhhhhh*******************************************hhhhhhh*************");

    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      print(response.body);
      print(jsonResponse);

      return jsonResponse.map((data) => new products.fromJson(data)).toList();
    } else
      return ('Unexpected error occured!');
  }
  FetcDhataList_salary(/*{required  token}*/) async {
    final response =
    await http.get(Uri.parse('http://192.168.137.102:8000/api/Product/Product_Order_Salary'),
      // headers: {  'Authorization':'Bearer '+'${token}'
      // }
    );
    print("********************hhhhhh*******************************************hhhhhhh*************");

    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      print(response.body);
      print(jsonResponse);

      return jsonResponse.map((data) => new products.fromJson(data)).toList();
    } else
      return ('Unexpected error occured!');
  }
  FetcDhataList_sales(/*{required  token}*/) async {
    final response =
    await http.get(Uri.parse('http://192.168.137.102:8000/api/Product/Product_Order_sales'),
      // headers: {  'Authorization':'Bearer '+'${token}'
      // }
    );
    // print("********************hhhhhh*******************************************hhhhhhh*************");

    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      print(response.body);
      print(jsonResponse);

      return jsonResponse.map((data) => new products.fromJson(data)).toList();
    } else
      return ('Unexpected error occured!');
  }
  FetcDhataList_favorite(/*{required  token}*/) async {
    final response =
    await http.get(Uri.parse('http://192.168.137.102:8000/api/Product/Product_Order_favorite'),
      // headers: {  'Authorization':'Bearer '+'${token}'
      // }
    );

    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      print(response.body);
      print(jsonResponse);
      //jsonResponse
      return jsonResponse.map((data) => new products.fromJson(data)).toList();
    } else
      return ('Unexpected error occured!');
  }

  @override
  void onInit() {

    getData1();
    getData2();
    getData3();
    getData4();
    getData5();
    getData7();
    for(int i=1;i<=10;i++)
      getData6(i);

    // print("jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj");
    // print(list1_Secondary.length);
    // print("jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj");
    super.onInit();
  }

  getData1() async {
    try {
      loading.value = true;


      var result = await FetcDhataList_discount(
        // token : await storage.read(key: "token"),
        // name_user : await storage.read(key: "name"),
        // name_pub:  await storage.read(key: "name_pub"),


      );

      if (result != null) {
        listpoduct_discount.assignAll(result);
      }
      else
        print("null");
    } finally {
      loading.value = false;
    }
    update();
  }
  getData2() async {
    try {
      loading.value = true;


      var result2 = await FetcDhataList_favorite(
        // token : await storage.read(key: "token"),
        // name_user : await storage.read(key: "name"),
        // name_pub:  await storage.read(key: "name_pub"),


      );

      if (result2 != null) {
        listpoduct_favorite.assignAll(result2);
      }
      else
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
        // name_user : await storage.read(key: "name"),
        // name_pub:  await storage.read(key: "name_pub"),


      );

      if (result3 != null) {
        listpoduct_salary.assignAll(result3);
      }
      else
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
        // name_user : await storage.read(key: "name"),
        // name_pub:  await storage.read(key: "name_pub"),


      );

      if (result4 != null) {
        listpoduct_sales.assignAll(result4);
      }
      else
        print("null");
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
        // name_user : await storage.read(key: "name"),
        // name_pub:  await storage.read(key: "name_pub"),


      );

      if (result4 != null) {
        listpoduct_classification.assignAll(result4);
      }
      else
        print("null");
    } finally {
      loading.value = false;
    }
    update();
  }
  getData7() async {
    try {
      loading.value = true;


      var result4 = await FetcDhataList_f(
        // token : await storage.read(key: "token"),
        // name_user : await storage.read(key: "name"),
        // name_pub:  await storage.read(key: "name_pub"),


      );

      if (result4 != null) {
        listpoduct_f.assignAll(result4);
        print ("77777777777777777777777777777777777777777");
        print (listpoduct_f.length);
        print ("hjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj");
      }
      else
        print("null");
    } finally {
      loading.value = false;
    }
    update();
  }


  getData6( id) async {
    try {
      loading.value = true;


      var result = await FetcDhataList_Secondary(id);
      if (result != null) {

        if(id==1)
          list1_Secondary.assignAll(result);

        else   if(id==2)
          list2_Secondary.assignAll(result);
        else  if(id==3)
          list3_Secondary.assignAll(result);
        else  if(id==4)
          list4_Secondary.assignAll(result);
        else  if(id==5)
          list5_Secondary.assignAll(result);
        else  if(id==6)
          list6_Secondary.assignAll(result);
        else  if(id==7)
          list7_Secondary.assignAll(result);
        else  if(id==8)
          list8_Secondary.assignAll(result);
        else  if(id==9)
          list9_Secondary.assignAll(result);
        else
          list10_Secondary.assignAll(result);

      }
      else
        print("null");
    } finally {
      loading.value = false;
    }
    update();
  }






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

  void  onSelected(String value,id) async{

    if(id==1)
      selectedValue1 = value;
    else if(id==2)
      selectedValue2 = value;
    else if(id==3)
      selectedValue3 = value;
    else if(id==4)
      selectedValue4 = value;
    else if(id==5)
      selectedValue5 = value;
    else if(id==6)
      selectedValue6 = value;
    else if(id==7)
      selectedValue7 = value;
    else if(id==8)
      selectedValue8 = value;
    else if(id==9)
      selectedValue9 = value;
    else if(id==10)
      selectedValue10 = value;


    //await storage.write(key: "name_pub", value: selectedValue);
    update();
  }






}