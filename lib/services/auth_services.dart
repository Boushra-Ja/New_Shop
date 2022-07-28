import 'dart:convert';
import 'package:http/http.dart' as http;
import '../main.dart';
import '../models/batool/user_model.dart';

class AuthServices {

  static register({required name,required email,required password}) async {
    var response = await http.post(Uri.parse('${MyApp.api}/api/Customer/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(<String, String>{
          "name": name,
          "email": email,
          "password": password,

        }));
    if (response.statusCode == 200||response.statusCode == 201) {
      var stringObject = response.body;
      var user = userFromJson(stringObject);
      return user;
    }else{
      print("error");

    return null;

    }
  }
  static login({required email, password}) async {
    var response = await http.post(Uri.parse('${MyApp.api}/api/Customer/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(<String, String>{
          "email": email,
          "password": password,
        }));
    if (response.statusCode == 200||response.statusCode == 201) {
      var stringObject = response.body;
      var user = userFromJson(stringObject);
      return user;
    }else
      return null;
  }
  static doo({required product_id}) async {

print("this dooo");

    var response = await http.post(Uri.parse('${MyApp.api}/api/FavoriteProduct/store/$product_id'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(<String, int>{
          "product_id": product_id,

        }));

    if (response.statusCode == 200||response.statusCode == 201) {
      String stringObject = response.body;
      String b="add_to_favorite";

      if(stringObject==b)
       {  return "add";}
      else
        return "delete";
    }

    else{
      return null;}
  }
  static changeAmount({required product_id,required order_id,required amount}) async {


    var response = await http.post(Uri.parse('${MyApp.api}/api/ChangeAmount/$product_id/$order_id/$amount'),
        headers: {'Content-Type': 'application/json'},);
    print(response.body);
  }
  static Deleverytime({required order_id,required date}) async {


    var response = await http.post(Uri.parse('${MyApp.api}/api/DeleveryTime/$order_id/$date'),
        headers: {'Content-Type': 'application/json'},);
  }
  static ChangeToCommit({required product_id,required order_id}) async {


    var response = await http.post(Uri.parse('${MyApp.api}/api/ChangeToCommit/$order_id/$product_id'),
        headers: {'Content-Type': 'application/json'},);



    if (response.statusCode == 200||response.statusCode == 201) {
      print(response.statusCode);
      print("********************* response in update ************************************");
      print(response.body);
    }

    else {
      return "null";}
  }

   static AddOrder({required store_id,required delivery_time,required delivery_price,required customer_id}) async {


    var response = await http.post(Uri.parse('${MyApp.api}/api/orders'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(<String, String>{
          "store_id": store_id,
          "delivery_time": delivery_time,
          "delivery_price":delivery_price,
          "customer_id":customer_id,


        }));


    print(response.statusCode);
    print(response.body) ;
    if (response.statusCode == 200||response.statusCode == 201) {
         print(response.body) ;
       }else
        return null;
  }
   static AddOrderProduct({required product_id,required order_id,required amount,required gift_order}) async {


    var response = await http.post(Uri.parse('${MyApp.api}/api/order_product'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(<String, dynamic>{
          "product_id": product_id,
          "order_id": 2,
          "amount":amount,
          "gift_order":gift_order,

        }));


    print(response.statusCode);
    print(response.body) ;
    if (response.statusCode == 200||response.statusCode == 201) {
         print(response.body) ;
       }else
        return null;
  }

}
