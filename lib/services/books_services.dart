import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BookServices {

  static PostData({
    required token,
    required image,
    required publisher_id, required title, required book_name, required price, required languge}) async {
    var response;
    print("++++++++++++++++++++++++++++ppppoooooo++++++++++++++++++++++++++++++++++++++");
    print(token);
    print("++++++++++++++++++++++++++++pppppooooo++++++++++++++++++++++++++++++++++++++");
    print(price);

     response = await http.post(Uri.parse('http://192.168.1.103:8000/api/store'),
        headers: {'Content-Type': 'application/json',
                   'Accept':'application/json',

                   'Authorization':'Bearer '+'${token}'},
        body : jsonEncode(<String, dynamic>{


          "publisher_id": publisher_id,
         // "user_id": user_id,
          "title": title,
          "book_name": book_name,
          "price": price,
          "languge": languge,
          "image":image

        }));
    print(response.statusCode);
    print(publisher_id);
    print(image);
    print(title);
    print(book_name);
    print(price);
    print(languge);




    print("*********************************************************");

    print(response.body);
    //  var book = productsModelFromJson(stringObject);
    print("*********************************************************");
      if (response.statusCode == 200||response.statusCode == 201) {
        var stringObject = response.body;
        print("**********************200||201***********************************");

          print(stringObject);
       //  var book = productsModelFromJson(stringObject);
        print("**********************200||201***********************************");

       // print(book.data.elementAt(0).book_name);
      return "book";
    }else
      return null;
  }



  static PostDataupdate({required id,
    required token,
    required publisher_id, required title, required book_name, required price, required languge}) async {
    var response;
    print("++++++++++++++++++++++++update++++++++++++++++++++++++++++++++++++++++++");
    print(token);
    print("++++++++++++++++++++++++update++++++++++++++++++++++++++++++++++++++++++");
    print(id);

    response = await http.post(Uri.parse('http://192.168.1.103:8000/api/edit/${id}'),
        headers: {'Content-Type': 'application/json',
          'Authorization':'Bearer '+'${token}'},
        body : jsonEncode(<String, dynamic>{


          "publisher_id": publisher_id,
          "user_id": 48,
          "title": title,
          "book_name": book_name,
          "price": price,
          "languge": languge,

        }));
    print(response.statusCode);
    print("********************* response in update ************************************");

    print(response.body);
    //  var book = productsModelFromJson(stringObject);
    print("*********************************************************");
    if (response.statusCode == 200||response.statusCode == 201) {
      var stringObject = response.body;
      print("**********************200||201***********************************");

      print(stringObject);
      //  var book = productsModelFromJson(stringObject);
      print("**********************200||201***********************************");

      // print(book.data.elementAt(0).book_name);
      return "book";
    }else
      return null;
  }




  static imagee({required filepath}) async {
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
      //'Authorization': 'Bearer '+'${token}',
      'X-Requested-With': ' XMLHttpRequest ',
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    var request = http.MultipartRequest('POST', Uri.parse('http://192.168.1.103:8000/api/storebook'));
    request.files.add(http.MultipartFile('image',
        File(filepath).readAsBytes().asStream(), File(filepath).lengthSync(),
        filename: filepath.split("/").last));
    var res = await request.send();

    print(res);
  }


  static addData({ required filepath}
     // Map<String,String > body,

     )
  async {
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
     // 'Authorization': tokenAuthorization,
      'X-Requested-With': ' XMLHttpRequest ',
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };


    var request = http.MultipartRequest('POST', Uri.parse('http://192.168.1.103:8000/api/storebook'))
     // ..fields.addAll(body)
      ..headers.addAll(headers)
      ..files.add(await http.MultipartFile.fromPath('photo', filepath));
    var response = await request.send();


    if (response.statusCode == 200) {
      print("sucss");
      return true;
    } else {
      print("fales");
      return false;
    }
  }




}



