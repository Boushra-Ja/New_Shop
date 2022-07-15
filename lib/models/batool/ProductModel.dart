
class productsModel{

  List<products>data ;
  productsModel({required this.data}) ;

  factory productsModel.fromJson(Map<String , dynamic> json)
  {
    return productsModel(
        data:List<products>.from(json['data'].map((p)=>products.fromJson(p)))
    ) ;
  }
}



class products {
  late var id;
  late var image;
  late var discription;
  late  var gift;
  late var updated_at;
  late var created_at;
  late  var name;
  late  var rating;
  late  var preprationTime;
  late  var party;
  late var age;
  late var sellingPrice;
  late var costPrice;
  late var numberOfSales;
  late var returnOrReplace;
  late var collectionId;
  late var discountProductsId;
  late var  product_id;
  late var secondary_id;
   bool isfavorite=false;
   int count_0=0,count_1=0,count_2=0;

  products(
      {
        required this.id,
        required this.created_at,
        required this.updated_at,
        required  this.image,
        required  this.discription,
        required  this.gift,
        required  this.name,
        required  this.product_id,
        required  this.rating,
        required  this.secondary_id,

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
    updated_at = json['updated_at'];
    created_at = json['created_at'];
    //if(json['secondary_id']!=null)
    secondary_id = json['secondary_id'];
  //  if(json['product_id']!=null)
    product_id = json['product_id'];
    image = json['image'];
    rating = json['rating'];
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
    data['product_id'] = this.product_id;
    data['secondary_id'] = this.secondary_id;
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