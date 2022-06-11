import 'dart:collection';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:new_shop/models/Boshra/orders/OrderModel.dart';
import 'package:new_shop/models/Boshra/orders/OrderProduct.dart';
import 'dart:convert';
import 'package:new_shop/models/Boshra/products/ProductModel.dart';
import '../../main.dart';
import '../../models/Boshra/products/Option.dart';


class ProductDeatilController extends GetxController{

  late Product product ;
  var product_id  , isLoading = true.obs , loading_option = true.obs;
  var chexkboxValue = "yes".obs;
  var report_of_product = '' ;
  var size_list = 0.obs ;
  var new_size = 0.obs ;
  int count = 0 ;
  int order_product_id =  0 ;

  Map<String , List<Option>> options = HashMap() ;
  List<int>selected_values = [];

  ProductDeatilController(this.product_id) ;

  void increment_size(){
    size_list.value += ( new_size.value) % 4 ;
    new_size.value = product.all_review.length  - size_list.value ;
  }

  void setchexkboxValue(String val){
    chexkboxValue.value = val ;
  }

  void set_reportofproduct(String val){
    report_of_product  = val ;
    update() ;
  }

  void change_selectvalue(int index , var val) {
    selected_values[index] = val;
    update();
  }

  String? validate_value(String val) {
    if (val == "") {
      return ' مطلوب';
    }
    return null;
  }

  String? validate_reportofproduct(String val) {
    if (val == "") {
      return ' مطلوب';
    }
    return null;
  }

  Future<void> fetchProductInfo(var id)async{
    final response = await http.get(Uri.parse('${MyApp.api}/api/products/$id')) ;
    final response2= await http.get(Uri.parse('${MyApp.api}/api/similar_products/$id')) ;

    if(response.statusCode == 200 && response2.statusCode == 200)
    {
      ProductModel productModel = ProductModel.fromJson(jsonDecode(response.body)) ;
      ProductModel productModel2 = ProductModel.fromJson(jsonDecode(response2.body)) ;

      product = Product(id: productModel.data[0].id, product_name: productModel.data[0].product_name,
          discription: productModel.data[0].discription, image: productModel.data[0].image,
          selling_price: productModel.data[0].selling_price, num_cell: productModel.data[0].num_cell,
          prepration_time: productModel.data[0].prepration_time, return_or_replace: productModel.data[0].return_or_replace ,
          store_id:productModel.data[0].store_id ,store_name:productModel.data[0].store_name ,
          salling_store:productModel.data[0].salling_store , all_review: productModel.data[0].all_review , similar_product: productModel2.data )   ;

      new_size.value = product.all_review.length ;


      if(product.all_review.length > 0) {
        size_list.value = ( new_size.value) % 10 ;
        new_size.value = product.all_review.length  - size_list.value ;
      }

      await get_options(id) ;
      await check_is_favourite() ;
      isLoading.value = false ;

    }else{
      print("errorrrrr") ;
    }

  }

  Future<void> get_options(var id)async{
    final response= await http.get(Uri.parse('${MyApp.api}/api/option_for_product/$id')) ;
    if(response.statusCode == 200) {
      OptionModel optionModel = OptionModel.fromJson(jsonDecode(response.body)) ;

      for(int  i = 0 ; i < optionModel.data.length ; i++)
      {
        if(options.containsKey(optionModel.data[i].name))
          {
            options['${optionModel.data[i].name}']?.add(optionModel.data[i]);

          }
        else{
          options['${optionModel.data[i].name}'] =  [optionModel.data[i]] ;
          selected_values.add(optionModel.data[i].value_id) ;
        }
      }
      print(options) ;

    }
  }

  Future<void> addToBasket()async{
    final response = await http.post(
        Uri.parse('${MyApp.api}/api/orders'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(<String, int>{
          "store_id": product.store_id,
          "customer_id": 1,
        }));

    if(response.statusCode == 200)
      {

        OrderModel orderModel = OrderModel.fromJson(jsonDecode(response.body)) ;
         Order order = Order(store_id: orderModel.data[0].store_id, customer_id: orderModel.data[0].customer_id, order_id: orderModel.data[0].order_id);

         final response2 = await http.post(
             Uri.parse('${MyApp.api}/api/order_product'),
             headers: {'Content-Type': 'application/json',},
             body: jsonEncode(<String, int>{
               "product_id": product.store_id,
               "order_id": order.order_id,
             }));

         if(response2.statusCode == 200)
         {
           product.is_basket = true ;

           OrderProductModel orderProductModel = OrderProductModel.fromJson(jsonDecode(response2.body)) ;
           OrderProduct orderProduct = OrderProduct(product_id: orderProductModel.data[0].product_id, status_id:  orderProductModel.data[0].status_id, order_id:  orderProductModel.data[0].order_id, order_product_id:  orderProductModel.data[0].order_product_id);

           order_product_id = orderProduct.order_product_id ;
           for(int i = 0 ; i < selected_values.length ; i++)
             {
               final response3 = await http.post(
                   Uri.parse('${MyApp.api}/api/option_product'),
                   headers: {'Content-Type': 'application/json',},
                   body: jsonEncode(<String, int>{
                     "order_product_id": orderProduct.order_product_id,
                     "option_values_id": selected_values[i],
                   }));

               if(response3.statusCode == 200)
                 {
                   print('successs') ;
                 }

             }
           update() ;
         }

      }

  }

  Future<void> check_is_favourite()async{
    final response = await http.get(
        Uri.parse('${MyApp.api}/api/orders/check/1/${product.store_id}'));

    if(response.statusCode == 200) {

      //////found
      if(response.body == '0')
        {
          product.is_basket = false;
        }
      else {
        print(response.body);
        final response2 = await http.get(
            Uri.parse('${MyApp.api}/api/product_orders/check/${product_id}/${response.body}'));

        if(response2.statusCode == 200)
          {
            /////found
            if(response2.body == '1')
               product.is_basket = true;
            else
              product.is_basket = false;

          }
      }
    }
    print('basket   ${ product.is_basket}' ) ;
  }

  Future<void> delete_from_basket()async{

    final response = await http.delete(
        Uri.parse('${MyApp.api}/api/order_product/$order_product_id'),);

    if(response.statusCode == 200)
    {
      print('success') ;
      product.is_basket = false ;
      update() ;
    }
  }

  @override
  void onInit() async{
    super.onInit();
    await fetchProductInfo(product_id) ;
  }
}