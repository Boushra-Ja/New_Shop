import 'dart:convert';

import 'package:get/get.dart';
import 'package:new_shop/models/batool/FavoriteProductModel.dart';
import 'package:http/http.dart' as http;

import '../../models/batool/FavoriteStore.dart';




class FavoriteController extends GetxController {
  var Tabbar = 1.obs;
  // var flist = <Favorite_product>[].obs;


  void changeTabbar(int index) {

    Tabbar.value = index;

    update();
  }


  var loading = true.obs;

  var listfavoite = <Favorite_product>[].obs;
  var listfavoitestore = <Favorite_Store>[].obs;
  late List jsonResponse;
  String? selectedValue;
  var isLoading = true.obs;


  FetchData_favorite() async {
    final response =
    await http.get(Uri.parse('http://192.168.137.102:8000/api/FavoriteProduct/Show_Favorite'));

    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);

      return jsonResponse.map((data) => new Favorite_product.fromJson(data)).toList();
    } else
      throw Exception('Unexpected error occured!');
  }
  FetchData_favorite_s() async {
    final response =
    await http.get(Uri.parse('http://192.168.137.102:8000/api/FavoriteStore/Show_Favorite'));

    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);

      return jsonResponse.map((data) => new Favorite_Store.fromJson(data)).toList();
    } else
      throw Exception('Unexpected error occured!');
  }

  @override
  void onInit() {
    getData();
    getDataS();
    print(listfavoitestore.length);
    print("========================================");
    super.onInit();
  }


  getData() async {
    try {
      loading.value = true;

      var result = await FetchData_favorite();

      if (result != null) {
        listfavoite.assignAll(result);
      } else
        print("null");
    } finally {
      loading.value = false;
    }
    update();
  }
  getDataS() async {
    try {
      loading.value = true;

      var result = await FetchData_favorite_s();

      if (result != null) {
        listfavoitestore.assignAll(result);
      } else
        print("null");
    } finally {
      loading.value = false;
    }
    update();
  }
  void dispose() {

    super.dispose();
  }




}
