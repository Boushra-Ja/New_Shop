import 'dart:collection';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
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

  Map<String , List<String>> options = HashMap() ;
  List<String>selected_values = [];

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

  void change_selectvalue(int index , var val)
  {
    selected_values[index] = val ;
    update( );
  }

  String? validate_material(String val) {
    if (val == "") {
      return ' مطلوب';
    }
    return null;
  }

  String? validate_color(String val) {
    if (val == "") {
      return ' مطلوب';
    }
    return null;
  }
  String? validate_size(String val) {
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
            options['${optionModel.data[i].name}']?.add(optionModel.data[i].value);
          }
        else{
          options['${optionModel.data[i].name}'] =  [optionModel.data[i].value] ;
          selected_values.add(optionModel.data[i].value) ;
        }
      }

    }
  }

  @override
  void onInit() async{
    super.onInit();
    await fetchProductInfo(product_id) ;
  }
}