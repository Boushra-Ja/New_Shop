import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:new_shop/models/Boshra/orders/DiscountModel.dart';
import '../../../main.dart';

class DiscountController  extends GetxController{

  var isApplied = false.obs ;
  var isLoading = false.obs ;
  var user_id  , code;
  final storage=const FlutterSecureStorage();
  List<DiscountCode> discount_list = <DiscountCode>[].obs ;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();


  void set_applied(val , ind){
    discount_list.elementAt(ind).isApplied = val ;
    update() ;
  }

  void set_code(val ){
    code = val ;
    update() ;
  }

  Future<void>fetch_discounts()async{
    user_id  = await storage.read(key: 'id') ;

    final response = await http.get(Uri.parse(
        '${MyApp.api}/api/discounts_codes/${user_id}'));

    if(response.statusCode == 200)
      {
        DiscountCodeModel discountCodeModel = DiscountCodeModel.fromJson(jsonDecode(response.body));
        discount_list.assignAll(discountCodeModel.data) ;
      }
    isLoading.value = true ;


  }

  Future<void> apply_discount(var ind)async {
    ////500 replace with all_price of order from batool
    var price_after_disc = 500 * discount_list.elementAt(ind).value ;
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();

      final response = await http.post(
          Uri.parse('${MyApp.api}/api/apply_disount'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(<String, dynamic>{
            "store_id": discount_list
                .elementAt(ind)
                .store_id,
            "customer_id": user_id,
            "discount_codes_id": discount_list
                .elementAt(ind)
                .discount_codes_id,
            "delivery_price" : price_after_disc

          }));

      if (response.statusCode == 200) {
        print("success");
        Get.snackbar("", "تم استخدام الخصم بنجاح");
        delete_discount(ind);
        discount_list
            .elementAt(ind)
            .isApplied = false;
        discount_list
            .elementAt(ind)
            .check_ = true;
        update();
      }
    }
  }

  Future<void>delete_discount(int ind)async{

    print(discount_list.elementAt(ind).discount_customer_id) ;
    final response = await http.delete(
      Uri.parse('${MyApp.api}/api/delete_discount/${discount_list.elementAt(ind).discount_customer_id}'),);


    if(response.statusCode == 200)
    {
      print('success delete') ;
    }
  }



  @override
  void onInit()async {
    super.onInit();
    await fetch_discounts() ;
  }

}