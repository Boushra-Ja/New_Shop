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
import '../../models/batool/ClassificationsModel.dart';

class ProductController extends GetxController {
  var flist = <int>[].obs;

  var loading = true.obs;
  var listpoduct_discount = <products>[].obs;
  var listpoduct_salary = <products>[].obs;
  var listpoduct_sales = <products>[].obs;
  var listpoduct_favorite = <products>[].obs;
  var listpoduct_f = <Favorite_product2>[].obs;
  var listpoduct_classification = <Classifications>[].obs;

  var isLoading = true.obs;
  late List<dynamic> jsonResponse;
    var  selectedValue=[] ;
  String? selectedValue10;
  var Col = 1.obs;
  late String token;
  var col = 0.obs;

  DropDown(var id, var title) async {
    final response = await http.get(
      Uri.parse('${MyApp.api}/api/Product/ShowClassification/$id/$title'),
    );

    if (response.statusCode == 200) {
      productsModel shopModel = productsModel.fromJson(jsonDecode(response.body));

      if (id == 1)
        listpoduct_sales.assignAll(shopModel.data);
      else if (id == 2)
        listpoduct_salary.assignAll(shopModel.data);
      if (id == 4)
        listpoduct_favorite.assignAll(shopModel.data);

    }
    else
      return "000000000000000000000000000000000000000";
  }


  // call_drop(var id, var title) async {
  //   try {
  //     loading.value = true;
  //
  //     var result2 = await drop(id, title);
  //
  //     if (result2 != null) {
  //       if (id == 3) listpoduct_discount.assignAll(result2);
  //       if (id == 4) listpoduct_favorite.assignAll(result2);
  //     } else
  //       print("null");
  //   } finally {
  //     loading.value = false;
  //   }
  //   update();
  // }

  bool check(int productId) {
    for (int i = 0; i < listpoduct_f.length; i++) {
      if (productId == listpoduct_f.elementAt(i).product_id) return true;
    }
    return false;
  }

  void changeCol(var data, int col, int productId) {
    if (data == "add") {
      print("to red");
    } else {
      print("to black");
    }

    Col.value = col;

    update();
  }

  classification_get() async {


    final response = await http.get(Uri.parse('${MyApp.api}/api/Show_p'));

    if (response.statusCode == 200) {
      ClassificationModel classificationModel = ClassificationModel.fromJson(jsonDecode(response.body));
      listpoduct_classification.assignAll(classificationModel.data);
    //  listpoduct_classification.elementAt(index)

      print("/////////////////////////////////////////////////////////////////////////");

      print(listpoduct_classification.length);

      for(int i=0;i<listpoduct_classification.length;i++)
        {
            print(listpoduct_classification.elementAt(i).id);
            Secondary s=new Secondary(title: listpoduct_classification.elementAt(i).title);
            listpoduct_classification.elementAt(i).mySecondary.add( s);
        }
      selectedValue.insert(0,"");

      for(int i=0;i<listpoduct_classification.length;i++) {
        print(listpoduct_classification.elementAt(i).title);
        selectedValue.insert(i + 1, listpoduct_classification.elementAt(i).title);
      }
      // selectedValue.insert(1,"خياطة");
      // selectedValue.insert(2,"كروشيه");
      // selectedValue.insert(3,"اكسسوار");
      // selectedValue.insert(4,"تطريز");
      // selectedValue.insert(5, "اساسي");
      // selectedValue.insert(6, "لوحات");



      print("/////////////////////////////////////////////////////////////////////////");
      for(int i=0;i<listpoduct_classification.length;i++)
      {

        for(int j=0;j<listpoduct_classification.elementAt(i).mySecondary.length;j++)
        {

            print(listpoduct_classification.elementAt(i).mySecondary.elementAt(j).title+"\n");


        }
        print("\n========\n");

      }
      print("/////////////////////////////////////////////////////////////////////////");

    } else
      return null;
  }

  get() async {
    // var col =0.obs;
    var c = await storage.read(key: "isDarkMode");
    if (c == "false") {
      col.value = 0;
      print("********************false****************************");
    } else {
      col.value = 1;
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


  Future<void> discount_get() async {
    final response = await http.get(
      Uri.parse('${MyApp.api}/api/Product/Order_discount'),
    );
    if (response.statusCode == 200) {
      productsModel shopModel =
          productsModel.fromJson(jsonDecode(response.body));
      listpoduct_discount.assignAll(shopModel.data);
      for (int i = 0; i < listpoduct_discount.length; i++) {
        if (listpoduct_discount[i].rating.length != 0)
          for (int j = 0; j < listpoduct_discount[i].rating.length; j++) {
            if (listpoduct_discount[i].rating[j]['value'] as int == 0)
              listpoduct_discount[i].count_0++;
            else if (listpoduct_discount[i].rating[j]['value'] as int == 1)
              listpoduct_discount[i].count_1++;
            else if (listpoduct_discount[i].rating[j]['value'] as int == 2)
              listpoduct_discount[i].count_2++;
          }
        else {
          listpoduct_discount[i].count_0 = -1;
          listpoduct_discount[i].count_1 = -1;
          listpoduct_discount[i].count_2 = -1;
        }

        if (listpoduct_discount[i].count_0 > listpoduct_discount[i].count_1) {
          if (listpoduct_discount[i].count_0 > listpoduct_discount[i].count_2)
            listpoduct_discount[i].rating = 0;
          else
            listpoduct_discount[i].rating = 2;
        } else if (listpoduct_discount[i].count_0 <
            listpoduct_discount[i].count_1) {
          if (listpoduct_discount[i].count_1 > listpoduct_discount[i].count_2)
            listpoduct_discount[i].rating = 1;
          else
            listpoduct_discount[i].rating = 2;
        }

        if (listpoduct_discount[i].count_0 ==
            listpoduct_discount[i].count_1) if (listpoduct_discount[i]
                .count_1 ==
            listpoduct_discount[i]
                .count_2) if (listpoduct_discount[i].count_1 != -1)
          listpoduct_discount[i].rating = 1;
      }

      isLoading.value = false;
    } else {
      print("errorrrrrdiscount");
    }
  }

  Future<void> favorite_get() async {
    final response = await http.get(
      Uri.parse('${MyApp.api}/api/Product/Order_favorite'),
    );
    if (response.statusCode == 200) {
      productsModel shopModel =
          productsModel.fromJson(jsonDecode(response.body));
      listpoduct_favorite.assignAll(shopModel.data);
      for (int i = 0; i < listpoduct_favorite.length; i++) {
        if (listpoduct_favorite[i].rating.length != 0)
          for (int j = 0; j < listpoduct_favorite[i].rating.length; j++) {
            if (listpoduct_favorite[i].rating[j]['value'] as int == 0)
              listpoduct_favorite[i].count_0++;
            else if (listpoduct_favorite[i].rating[j]['value'] as int == 1)
              listpoduct_favorite[i].count_1++;
            else if (listpoduct_favorite[i].rating[j]['value'] as int == 2)
              listpoduct_favorite[i].count_2++;
          }
        else {
          listpoduct_favorite[i].count_0 = -1;
          listpoduct_favorite[i].count_1 = -1;
          listpoduct_favorite[i].count_2 = -1;
        }

        if (listpoduct_favorite[i].count_0 > listpoduct_favorite[i].count_1) {
          if (listpoduct_favorite[i].count_0 > listpoduct_favorite[i].count_2)
            listpoduct_favorite[i].rating = 0;
          else
            listpoduct_favorite[i].rating = 2;
        } else if (listpoduct_favorite[i].count_0 <
            listpoduct_favorite[i].count_1) {
          if (listpoduct_favorite[i].count_1 > listpoduct_favorite[i].count_2)
            listpoduct_favorite[i].rating = 1;
          else
            listpoduct_favorite[i].rating = 2;
        }

        if (listpoduct_favorite[i].count_0 ==
            listpoduct_favorite[i].count_1) if (listpoduct_favorite[i]
                .count_1 ==
            listpoduct_favorite[i]
                .count_2) if (listpoduct_favorite[i].count_1 != -1)
          listpoduct_favorite[i].rating = 1;
      }

      isLoading.value = false;
    } else {
      print("errorrrrrfavorite");
    }
  }

  Future<void> salary_get() async {
    final response = await http.get(
      Uri.parse('${MyApp.api}/api/Product/Order_Salary'),
    );
    if (response.statusCode == 200) {
      productsModel shopModel =
          productsModel.fromJson(jsonDecode(response.body));
      listpoduct_salary.assignAll(shopModel.data);
      for (int i = 0; i < listpoduct_salary.length; i++) {
        if (listpoduct_salary[i].rating.length != 0)
          for (int j = 0; j < listpoduct_salary[i].rating.length; j++) {
            if (listpoduct_salary[i].rating[j]['value'] as int == 0)
              listpoduct_salary[i].count_0++;
            else if (listpoduct_salary[i].rating[j]['value'] as int == 1)
              listpoduct_salary[i].count_1++;
            else if (listpoduct_salary[i].rating[j]['value'] as int == 2)
              listpoduct_salary[i].count_2++;
          }
        else {
          listpoduct_salary[i].count_0 = -1;
          listpoduct_salary[i].count_1 = -1;
          listpoduct_salary[i].count_2 = -1;
        }

        if (listpoduct_salary[i].count_0 > listpoduct_salary[i].count_1) {
          if (listpoduct_salary[i].count_0 > listpoduct_salary[i].count_2)
            listpoduct_salary[i].rating = 0;
          else
            listpoduct_salary[i].rating = 2;
        } else if (listpoduct_salary[i].count_0 <
            listpoduct_salary[i].count_1) {
          if (listpoduct_salary[i].count_1 > listpoduct_salary[i].count_2)
            listpoduct_salary[i].rating = 1;
          else
            listpoduct_salary[i].rating = 2;
        }

        if (listpoduct_salary[i].count_0 ==
            listpoduct_salary[i].count_1) if (listpoduct_salary[i]
                .count_1 ==
            listpoduct_salary[i]
                .count_2) if (listpoduct_salary[i].count_1 != -1)
          listpoduct_salary[i].rating = 1;
      }

      isLoading.value = false;
    } else {
      print("errorrrrrsalary");
    }
  }

  Future<void> sales_get() async {////////////////////
    final response = await http.get(
      Uri.parse('${MyApp.api}/api/Product/Order_sales'),
    );
    if (response.statusCode == 200) {
      productsModel shopModel =
          productsModel.fromJson(jsonDecode(response.body));
      listpoduct_sales.assignAll(shopModel.data);
      for (int i = 0; i < listpoduct_sales.length; i++) {
        if (listpoduct_sales[i].rating.length != 0)
          for (int j = 0; j < listpoduct_sales[i].rating.length; j++) {
            if (listpoduct_sales[i].rating[j]['value'] as int == 0)
              listpoduct_sales[i].count_0++;
            else if (listpoduct_sales[i].rating[j]['value'] as int == 1)
              listpoduct_sales[i].count_1++;
            else if (listpoduct_sales[i].rating[j]['value'] as int == 2)
              listpoduct_sales[i].count_2++;
          }
        else {
          listpoduct_sales[i].count_0 = -1;
          listpoduct_sales[i].count_1 = -1;
          listpoduct_sales[i].count_2 = -1;
        }

        if (listpoduct_sales[i].count_0 > listpoduct_sales[i].count_1) {
          if (listpoduct_sales[i].count_0 > listpoduct_sales[i].count_2)
            listpoduct_sales[i].rating = 0;
          else
            listpoduct_sales[i].rating = 2;
        } else if (listpoduct_sales[i].count_0 < listpoduct_sales[i].count_1) {
          if (listpoduct_sales[i].count_1 > listpoduct_sales[i].count_2)
            listpoduct_sales[i].rating = 1;
          else
            listpoduct_sales[i].rating = 2;
        }

        if (listpoduct_sales[i].count_0 ==
            listpoduct_sales[i].count_1) if (listpoduct_sales[i]
                .count_1 ==
            listpoduct_sales[i].count_2) if (listpoduct_sales[i].count_1 != -1)
          listpoduct_sales[i].rating = 1;
      }

      isLoading.value = false;
    } else {
      print("errorrrrrsales");
    }
  }


  @override
  void onInit() {
    get();
    getData2();
    print("كلب");
    classification_get();
    discount_get();
    favorite_get();
    salary_get();
    sales_get();



    super.onInit();
  }

  getData2() async {
    try {
      loading.value = true;
      var result2 = await FetcDhataList_f();

      if (result2 != null) {
        listpoduct_f.assignAll(result2);
      } else
        print("null");
    } finally {
      loading.value = false;
    }
    update();
  }




  void onSelected(String value, id) async {
        print(id);
        selectedValue[id]=value;
        update();
  }
}


