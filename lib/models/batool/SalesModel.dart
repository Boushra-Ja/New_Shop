
class SaleModel{

  List<Sales>data ;
  SaleModel({required this.data}) ;

  factory SaleModel.fromJson(Map<String , dynamic> json)
  {
    return SaleModel(
        data:List<Sales>.from(json['data'].map((p)=>Sales.fromJson(p)))
    ) ;
  }
}



class Sales {
  late var id;
  late var image;
  late var discription;
  late  var gift;
  late var updated_at;
  late var created_at;
  late  var name;
  late  var preprationTime;
  late  var party;
  late var age;
  late var sellingPrice;
  late var costPrice;
  late var numberOfSales;
  late var returnOrReplace;
  late var collectionId;
  late var discountProductsId;

   bool isfavorite=false;

  Sales(
      {
        required this.id,
        required this.created_at,
        required this.updated_at,
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

  Sales.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    updated_at = json['updated_at'];
    created_at = json['created_at'];


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
    data['created_at'] = this.created_at;
    data['updated_at'] = this.updated_at;

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