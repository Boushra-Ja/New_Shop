
import 'dart:convert';

class OrderProduct{

  int product_id   , store_id ;
  String store_name , store_image , delivery_time , order_time , product_name , product_image;
  var gift_order , amount , selling_price , discount_id , discount_value;



  factory OrderProduct.fromJson(Map<String , dynamic> json)
  {
    return OrderProduct(product_id : json['product_id'] , store_id : json['store_id'] ,store_name : json['store_name'] , store_image:json['store_image'] , delivery_time:json['delivery_time'] ,order_time:json['order_time'] , product_name: json['product_name'] , product_image: json['product_image'] ,  gift_order: json['gift_order'] , amount: json['amount'] );
  }

  OrderProduct({required this.product_id , required this.store_id , required this.store_name , required this.store_image ,required this.delivery_time , required  this.order_time , required this.product_name , required this.product_image , required this.gift_order , required this.amount ,  this.selling_price , this.discount_id , this.discount_value});

  static Map<String, dynamic> toMap(OrderProduct model) => {
    'product_id': model.product_id,
    'store_id': model.store_id,
    'store_name': model.store_name,
    'store_image': model.store_image,
    'delivery_time': model.delivery_time,
    'product_name': model.product_name,
    'product_image': model.product_image,
    'gift_order': model.gift_order,
    'amount': model.amount,
    'discount_value': model.discount_value,
    'discount_id': model.discount_id,
    'selling_price': model.selling_price,


  };

  static String serialize(OrderProduct model) => json.encode(OrderProduct.toMap(model));

  static OrderProduct deserialize(Map<String , dynamic> json) => OrderProduct.fromJson(json);
}


class OrderProductModel{

  List<OrderProduct>data ;
  OrderProductModel({required this.data}) ;

  factory OrderProductModel.fromJson(Map<String , dynamic> json)
  {
    return OrderProductModel(
        data:List<OrderProduct>.from(json['data'].map((p)=>OrderProduct.fromJson(p))).toList()
    ) ;
  }

}