/*

        "id": 2,
        "created_at": "0000-00-00 00:00:00",
        "updated_at": "0000-00-00 00:00:00",
        "image": "1654252750.jpg",
        "discription": "bbbbnnbn",
        "gift": "22",
        "name": "batool",
        "prepration_time": 2022,
        "party": "jjjy",
        "age": 33,
        "selling_price": 300,
        "cost_price": 40,
        "number_of_sales": 100,
        "return_or_replace": 1,
        "collection_id": 1,
        "discount_products_id": 2,
        "customer_id": 1,
        "product_id": 9,
        "value": 34,
        "notes": "hhhhhhhh"*/



class Favorite_productModel{

  List<Favorite_product>data ;
  Favorite_productModel({required this.data}) ;

  factory Favorite_productModel.fromJson(Map<String , dynamic> json)
  {
    return Favorite_productModel(
        data:List<Favorite_product>.from(json['data'].map((p)=>Favorite_product.fromJson(p)))
    ) ;
  }
}



class Favorite_product {
  late int id;
  late String image ;
  late String name;
  late int product_id;
  late int value;
  // late String prepration_time;
  // late int party ;
  // late int age ;
  // late int selling_price;
  // late int cost_price;
  // late int number_of_sales;
  // late int return_or_replace;
  // late int collection_id;
  // late int discount_products_id;
  // late int customer_id;
  // late String discription;
  // late int gift;
  // late String notes;


  Favorite_product(
      {
        required this.id,
        required this.value,
        required this.name,
        required this.product_id,
        required this.image,
        // required this.collection_id,
        // required this.age,
        // required this.cost_price,
        // required this.customer_id,
        // required this.discount_products_id,
        // required this.discription,
        // required this.gift,
        // required this.notes,
        // required this.number_of_sales,
        // required this.party,
        // required this.prepration_time,
        // required this.return_or_replace,
        // required this.selling_price,

      });

  Favorite_product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    name = json['name'];
    image = json['image'];
    product_id = json['product_id'];

    // selling_price = json['title'];
    // return_or_replace = json['title'];
    // discription = json['title'];
    // discount_products_id = json['title'];
    // number_of_sales = json['title'];
    // notes = json['title'];
    //
    // party = json['title'];
    // prepration_time = json['title'];
    // product_id = json['title'];
    // customer_id = json['title'];
    // collection_id = json['title'];
    // age = json['title'];
    // cost_price = json['title'];
    // gift = json['classification_id'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    // data['title'] = this.cost_price;
    // data['title'] = this.age;
    // data['title'] = this.collection_id;
    // data['title'] = this.customer_id;
    // data['title'] = this.product_id;
    // data['title'] = this.prepration_time;
    // data['title'] = this.party;
    // data['title'] = this.discription;
    // data['title'] = this.notes;
    // data['title'] = this.number_of_sales;
    // data['title'] = this.discount_products_id;
    // data['title'] = this.return_or_replace;
    // data['title'] = this.selling_price;
    // data['classification_id'] = this.gift;
    data['name'] = this.name;
    data['product_id'] = this.product_id;
    data['id'] = this.id;
    data['image'] = this.image;
    data['value'] = this.value;

    return data;
  }
}