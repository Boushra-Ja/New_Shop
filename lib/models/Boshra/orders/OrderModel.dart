

class Order{

  int store_id , customer_id ,order_id ;


  factory Order.fromJson(Map<String , dynamic> json)
  {
    return Order(store_id : json['store_id'] , customer_id : json['customer_id'] , order_id : json['order_id'] );
  }

  Order({required this.store_id , required this.customer_id , required this.order_id });

}


class OrderModel{

  List<Order>data ;
  OrderModel({required this.data}) ;

  factory OrderModel.fromJson(Map<String , dynamic> json)
  {
    return OrderModel(
        data:List<Order>.from(json['data'].map((p)=>Order.fromJson(p))).toList()
    ) ;
  }
}