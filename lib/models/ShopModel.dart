
class Shop {

  final String shop_name , review ;
  final int num_cell ;

  Shop({required this.shop_name, required this.review, required this.num_cell});

  factory Shop.fromJson(Map<String , dynamic> json)
  {

    return Shop(shop_name: json['shop_name'], review: json['review'], num_cell: json['num_cell']);
  }

}

class ShopModel{

  List<Shop>data ;
  ShopModel({required this.data}) ;

  factory ShopModel.fromJson(Map<String , dynamic> json)
  {
    return ShopModel(
        data:List<Shop>.from(json['data'].map((p)=>Shop.fromJson(p)))
    ) ;
  }
}