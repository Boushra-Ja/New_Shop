import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:new_shop/models/Boshra/orders/OrderProduct.dart';
import 'package:new_shop/models/Boshra/products/Option.dart';
import 'dart:convert';
import '../../../main.dart';

class OrderDetailController extends GetxController {

  int order_id , status_id;
  var isLoading = true.obs;
  Map<int  , List<Option>> selected_options = <int  , List<Option>>{}.obs;
  List<OrderProduct> order_products = <OrderProduct>[].obs ;

  OrderDetailController(this.order_id , this.status_id);

  Future<void> fetchOptions_selected(int order_product_id) async {

        final response = await http.get(Uri.parse(
            '${MyApp.api}/api/order_product/options/${order_product_id}'));
        if (response.statusCode == 200) {
          OptionModel optionModel = OptionModel.fromJson(jsonDecode(response.body));
          for(int k =  0 ; k < optionModel.data.length ; k++)
          {
            if(selected_options.containsKey(order_product_id))
              selected_options[order_product_id]?.add(optionModel.data[k]);
            else
              selected_options[order_product_id] =  [optionModel.data[k]] ;

          }
        }
        else
          print("error");

  }

  Future<void> fetch_order_products()async{

    final response = await http.get(Uri.parse(
        '${MyApp.api}/api/all_orderproduct/${order_id}/${status_id}'));
    if (response.statusCode == 200) {
      OrderProductModel orderProductModel = OrderProductModel.fromJson(jsonDecode(response.body));
      order_products.assignAll(orderProductModel.data) ;

      for(int i = 0 ; i < order_products.length ; i++)
      {
        await fetchOptions_selected(order_products.elementAt(i).order_product_id) ;
      }
    }
    else
      print("error");

    isLoading.value = false;

  }

  @override
  void onInit() async{
    super.onInit();
    await fetch_order_products() ;
  }
}