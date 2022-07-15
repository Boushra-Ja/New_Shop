
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:new_shop/models/Boshra/orders/BillModel.dart';
import '../../../main.dart';
import '../../../models/Boshra/orders/OrderProduct.dart';

class BillController extends GetxController{

  int order_id ;
  BillController( this.order_id) ;
  var isLoading = true.obs;
  var total_price = 0 ;
  var price_after_discount = 0.0 ;

  List<Bill> products_bill = <Bill>[].obs;

  Future<void> fetch_bill()async{
    final response = await http.get(Uri.parse('${MyApp.api}/api/bill/${order_id}')) ;

    if(response.statusCode == 200 ) {
      BillModel orderModel = BillModel.fromJson(jsonDecode(response.body));
      products_bill.assignAll(orderModel.data) ;

      for(int i = 0 ;i < products_bill.length ; i++)
        {
          ////يجب ضربه بالكمية
          total_price += (products_bill.elementAt(i).selling_price );
          price_after_discount += (products_bill.elementAt(i).selling_price*products_bill.elementAt(i).discount_value)/100;
        }
      isLoading.value = false;
    }

  }


  @override
  void onInit() async{
    super.onInit();
    await fetch_bill() ;
  }

}