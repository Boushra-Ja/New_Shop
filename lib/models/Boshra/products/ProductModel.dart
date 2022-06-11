
class Product {

  var id , product_name , discription  ,image  , selling_price  ,num_cell ,all_review  , prepration_time , return_or_replace , store_id , store_name , salling_store , similar_product;
  int review =  0;
  bool is_basket = false;


  factory Product.fromJson(Map<String , dynamic> json)
  {

    return Product(id : json['product_id'] ,product_name: json['product_name'],discription: json['discription'],image: json['image']
        ,selling_price: json['selling_price'] ,num_cell: json['num_cell'] , prepration_time: json['prepration_time'] , return_or_replace: json['return_or_replace'] , store_id : json['store_id'] ,
        store_name : json['store_name'], salling_store:json['num_salling_store'] , all_review:json['review']
        );
  }

  Product({required this.id , required this.product_name,required this.discription, required this.image,  required this.selling_price,
    required this.num_cell , required this.prepration_time, required this.return_or_replace ,required this.store_id , required this.store_name ,required this.salling_store , required this.all_review ,  this.similar_product});


}

class ProductModel{

  List<Product>data ;
  ProductModel({required this.data}) ;

  factory ProductModel.fromJson(Map<String , dynamic> json)
  {
    return ProductModel(
        data:List<Product>.from(json['data'].map((p)=>Product.fromJson(p))).toList()
    ) ;
  }
}