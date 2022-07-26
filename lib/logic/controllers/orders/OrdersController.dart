import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:new_shop/models/Boshra/orders/OrderModel.dart';
import 'package:new_shop/models/Boshra/orders/OrderProduct.dart';
import 'dart:convert';
import '../../../main.dart';

class OrdersController extends GetxController{

  var index = 0.obs ;
  var user_id ;
  Map<int , Order>acceptence_orders = <int ,Order>{}.obs;
  Map<int , Order> wating_orders = <int , Order>{}.obs;
  Map<int , Order >recieved_orders = <int ,Order>{}.obs;
  final storage=const FlutterSecureStorage();

  var isLoading = true.obs ;

  void setindex(int val){
    index.value = val ;
  }

  Future<void> Fetch_AcceptOrders()async{
    //////////customer_id
    final response = await http.get(Uri.parse('${MyApp.api}/api/accept_orders/${user_id}')) ;

    if(response.statusCode == 200 ) {
      OrderModel orderModel = OrderModel.fromJson(jsonDecode(response.body));

      for(int i = 0 ; i < orderModel.data.length ; i++)
        {
          if(!acceptence_orders.containsKey(orderModel.data[i].order_id))
            {
              acceptence_orders[orderModel.data[i].order_id] =  orderModel.data[i] ;
            }

        }
    }

  }

  Future<void> Fetch_WaitingOrders()async{
    //////////customer_id
    final response = await http.get(Uri.parse('${MyApp.api}/api/waiting_orders/${user_id}')) ;

    if(response.statusCode == 200 ) {
      OrderModel orderModel = OrderModel.fromJson(jsonDecode(response.body));

      for(int i = 0 ; i < orderModel.data.length ; i++)
      {
        if(!wating_orders.containsKey(orderModel.data[i].order_id))
        {
          wating_orders[orderModel.data[i].order_id] =  orderModel.data[i] ;
        }

      }
    }

  }

  Future<void> Fetch_RecievedOrders()async{
    //////////customer_id
    final response = await http.get(Uri.parse('${MyApp.api}/api/received_orders/${user_id}')) ;

    if(response.statusCode == 200 ) {
      OrderModel orderModel = OrderModel.fromJson(jsonDecode(response.body));

      for(int i = 0 ; i < orderModel.data.length ; i++)
      {
        if(!recieved_orders.containsKey(orderModel.data[i].order_id))
        {
          recieved_orders[orderModel.data[i].order_id] =  orderModel.data[i] ;
        }

      }
      isLoading.value = false;
    }

  }

  @override
  void onInit() async{
    super.onInit();
    user_id  = await storage.read(key: 'id') ;
    await Fetch_WaitingOrders() ;
    await Fetch_AcceptOrders() ;
    await Fetch_RecievedOrders() ;

  }
}