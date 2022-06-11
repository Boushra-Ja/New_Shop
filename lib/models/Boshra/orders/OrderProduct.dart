
class OrderProduct{

  int product_id ,status_id ,order_id , order_product_id;



  factory OrderProduct.fromJson(Map<String , dynamic> json)
  {
    return OrderProduct(product_id : json['product_id'] , status_id : json['status_id'] , order_id : json['order_id'] , order_product_id : json['id']);
  }

  OrderProduct({required this.product_id , required this.status_id , required this.order_id , required this.order_product_id });

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