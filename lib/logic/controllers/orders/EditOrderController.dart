import 'dart:collection';
import 'package:get/get.dart';
import '../../../main.dart';
import '../../../models/Boshra/orders/OrderProduct.dart';
import '../../../models/Boshra/products/Option.dart';
import 'package:http/http.dart' as http;
import 'package:new_shop/models/Boshra/products/Option.dart';
import 'dart:convert';

class EditOrderController extends GetxController{

  int order_id , status_id ;
  var isLoading = true.obs ;
  Map<int, Map<String, List<Option>>> options = HashMap();
  Map<int  , List<Option>> selected_options = <int  , List<Option>>{}.obs;
  List<OrderProduct> order_products = <OrderProduct>[].obs ;

  Future<void> fetch_order_products()async{

    final response = await http.get(Uri.parse(
        '${MyApp.api}/api/all_orderproduct/${order_id}/${status_id}'));
    if (response.statusCode == 200) {
      OrderProductModel orderProductModel = OrderProductModel.fromJson(jsonDecode(response.body));
      order_products.assignAll(orderProductModel.data) ;

      for(int i = 0 ; i < order_products.length ; i++)
        {
          await get_all_options(order_products.elementAt(i).product_id) ;
          await fetchOptions_selected(order_products.elementAt(i).order_product_id) ;
        }
    }
    else
      print("error");

    isLoading.value = false ;

  }

  EditOrderController(this.order_id , this.status_id ) ;

  void change_value(var val , int order_product_id , int index) {
    selected_options[order_product_id]?.elementAt(index).value_id = val.value_id;
  }

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

  }

  Future<void> get_all_options(int product_id) async {

    Map <String, List<Option>>temp = new HashMap();

      temp = new HashMap<String, List<Option>>();
      final response = await http.get(Uri.parse(
          '${MyApp.api}/api/option_for_product/${product_id}'));
      if (response.statusCode == 200) {
        OptionModel optionModel = OptionModel.fromJson(
            jsonDecode(response.body));

        for (int j = 0; j < optionModel.data.length; j++) {
          if (temp.containsKey(optionModel.data[j].name)) {
            temp['${optionModel.data[j].name}']?.add(optionModel.data[j]);
          }
          else {
            temp['${optionModel.data[j].name}'] = [optionModel.data[j]];
          }
        }
        options[product_id] = temp;

      }

        print(options);

  }

  Future<void> edit_options(int order_product_id)async{

    if(selected_options.containsKey(order_product_id)){
      for(int j = 0 ; j < selected_options[order_product_id]!.length ; j++)
      {
        final response = await http.post(
            Uri.parse('${MyApp.api}/api/orderproduct/update/${selected_options[order_product_id]?.elementAt(j).product_options_id}'),
            headers: {'Content-Type': 'application/json' ,
              'Accept' : 'application/json'
            },
            body: jsonEncode(<String, dynamic>{
              'option_values_id' : selected_options[order_product_id]?.elementAt(j).value_id
            }));

        if (response.statusCode == 200) {
          print('success') ;
          Get.snackbar("تم التعديل", "نجحت عملية تعديل خيارات المنتج") ;
          Get.back() ;
        }
      }
    }
  }

  Future<void> delete_product(int order_product_id)async{

    final response = await http.delete(
      Uri.parse('${MyApp.api}/api/order_product/$order_product_id'),);

    if(response.statusCode == 200)
    {
      print('success') ;
      Get.snackbar("تم التعديل", "نجحت عملية حذف خيارات المنتج") ;
      Get.back() ;
    }
  }

  @override
  void onInit() async{
    super.onInit();
    await fetch_order_products() ;


  }
}