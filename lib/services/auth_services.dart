import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/batool/user_model.dart';

class AuthServices {


  static register({required name,required email,required password}) async {
    var response = await http.post(Uri.parse('http://192.168.137.102:8000/api/Customer/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(<String, String>{
          "name": name,
          "email": email,
          "password": password,

        }));
    if (response.statusCode == 200||response.statusCode == 201) {
      var stringObject = response.body;
      var user = userFromJson(stringObject);
      print("(((((((((((((((((((((((((((((((((((((");
      print(user.token);
      return user;
    }else{
      print("((((_________null____________(((((((((((((((((((((((((((((((((");

    return null;}
  }
  static login({required email, password}) async {
    var response = await http.post(Uri.parse('http://192.168.137.102:8000/api/Customer/login'),
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
    var response = await http.post(Uri.parse('http://192.168.137.102:8000/api/FavoriteProduct/Add_Favorite/$product_id'),
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
   //   print("((((_________null____________(((((((((((((((((((((((((((((((((");

      return null;}
  }

}
