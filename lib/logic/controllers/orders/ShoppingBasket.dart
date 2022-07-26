
import 'dart:convert';

class ShoppingBasket{


  int product_id   , store_id ;
  String store_name , store_image , delivery_time , order_time , product_name , product_image;
  var gift_order , amount , selling_price , discount_id , discount_value;



  factory ShoppingBasket.fromJson(Map<String , dynamic> json)
  {
    return ShoppingBasket(product_id : json['product_id'] , store_id : json['store_id'] ,store_name : json['store_name'] , store_image:json['store_image'] , delivery_time:json['delivery_time'] ,order_time:json['order_time'] , product_name: json['product_name'] , product_image: json['product_image'] ,  gift_order: json['gift_order'] , amount: json['amount'] );
  }

  ShoppingBasket({required this.product_id , required this.store_id , required this.store_name , required this.store_image ,required this.delivery_time , required  this.order_time , required this.product_name , required this.product_image , required this.gift_order , required this.amount ,  this.selling_price , this.discount_id , this.discount_value});

  static Map<String, dynamic> toMap(ShoppingBasket model) => {
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

  static String serialize(ShoppingBasket model) => json.encode(ShoppingBasket.toMap(model));

  static ShoppingBasket deserialize(Map<String , dynamic> json) => ShoppingBasket.fromJson(json);
}

