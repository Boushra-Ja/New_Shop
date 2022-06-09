
class productModel{

  List<products>data ;
  productModel({required this.data}) ;

  factory productModel.fromJson(Map<String , dynamic> json)
  {
    return productModel(
        data:List<products>.from(json['data'].map((p)=>products.fromJson(p)))
    ) ;
  }
}



class products {
  late int id;
  late String image;
  late String discription;
  late  String gift;
  late  String name;
  late  int preprationTime;
  late  String party;
  late int age;
  late int sellingPrice;
  late int costPrice;
  late int numberOfSales;
  late int returnOrReplace;
  late int collectionId;
  late int discountProductsId;

  products(
      {
        required this.id,
        required  this.image,
        required  this.discription,
        required  this.gift,
        required  this.name,
        required this.preprationTime,
        required this.party,
        required  this.age,
        required  this.sellingPrice,
        required  this.costPrice,
        required  this.numberOfSales,
        required this.returnOrReplace,
        required  this.collectionId,
        required this.discountProductsId});

  products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    discription = json['discription'];
    gift = json['gift'];
    name = json['name'];
    preprationTime = json['prepration_time'];
    party = json['party'];
    age = json['age'];
    sellingPrice = json['selling_price'];
    costPrice = json['cost_price'];
    numberOfSales = json['number_of_sales'];
    returnOrReplace = json['return_or_replace'];
    collectionId = json['collection_id'];
    discountProductsId = json['discount_products_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['discription'] = this.discription;
    data['gift'] = this.gift;
    data['name'] = this.name;
    data['prepration_time'] = this.preprationTime;
    data['party'] = this.party;
    data['age'] = this.age;
    data['selling_price'] = this.sellingPrice;
    data['cost_price'] = this.costPrice;
    data['number_of_sales'] = this.numberOfSales;
    data['return_or_replace'] = this.returnOrReplace;
    data['collection_id'] = this.collectionId;
    data['discount_products_id'] = this.discountProductsId;
    return data;
  }
}