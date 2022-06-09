import 'dart:convert';
import 'package:get/get.dart';
import 'package:new_shop/models/batool/FavoriteProductModel.dart';
import 'package:http/http.dart' as http;
import '../../main.dart';
import '../../models/batool/FavoriteStore.dart';

class FavoriteController extends GetxController {
  var Tabbar = 1.obs;
  var loading = true.obs;
  var listfavoite = <Favorite_product>[].obs;
  var listfavoitestore = <Favorite_Store>[].obs;
  late List jsonResponse;
  String? selectedValue;
  var isLoading = true.obs;

  void changeTabbar(int index) {
    Tabbar.value = index;
    update();
  }

  FetchData_favorite() async {
    final response =
        await http.get(Uri.parse('${MyApp.api}/api/FavoriteProduct/Show_Favorite'));

    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);

      return jsonResponse
          .map((data) => new Favorite_product.fromJson(data))
          .toList();
    } else
      return null;
  }

  FetchData_favorite_s() async {
    final response =
        await http.get(Uri.parse('${MyApp.api}/api/FavoriteStore/Show_Favorite'));

    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);

      return jsonResponse
          .map((data) => new Favorite_Store.fromJson(data))
          .toList();
    } else
      return null;
  }

  @override
  void onInit() {
    getData();
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
