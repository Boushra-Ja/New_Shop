import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:new_shop/utls/Themes.dart';

import '../ConstantPages/MyCustomCLipper.dart';

class Chat extends StatelessWidget {
  Color? colorh = Themes.color;
  Color colorh8 = Colors.grey.shade300;

  List<String> images = [
    "images/5w.jpg",
    "images/6w.jpg",
    "images/7w.jpg",
    "images/8w.jpg",
    "images/9w.jpg",
    "images/10w.jpg",

  ];
  List<String> title = [
    "متجر بيان",
    "متجر تسنيم",
    "بتول",
    "بشرى",
    "هدى",
    "متجر الالعاب",

  ];
  List<String> subtitle = [
    "سلام",
    "اي",
    "مع السلامه",
    "كيفك",
    "باي",
    "ماشي"
  ];
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Column(
            children: [
             // SizedBox(height: 1,),
              ClipPath(
                child: Container(
                  color: colorh,
                  height: 60.0,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                      child: Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.white,
                                  child: Center(
                                    child: IconButton(
                                      onPressed: () {Get.back();},
                                      icon: Icon(
                                        Icons.arrow_back,
                                        color: colorh,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ]))

                      ),
                ),
                clipper: MyCustomCLipper(),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: colorh8,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child:
                Form(
                 // key: ,
                  child: TextField(

                    decoration: InputDecoration(
                      hintText: "ابحث...",
                      hintStyle: TextStyle(color: Colors.grey.shade600),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey.shade600,
                        size: 20,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      contentPadding: EdgeInsets.all(8),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.grey.shade50)),
                    ),
                  ),
                ),

              ),
              SizedBox(height: 20,),
              Expanded(flex: 1,
           child:
            Container(child:

            ListView.builder(

              itemBuilder: (BuildContext, index){


                return  Card(
                child: TextButton(
                onPressed: () => {

                     Get.toNamed('/ChatDetails', arguments: {
                            "Title":
                            title[index],
                            "SubTitle":
                            subtitle[index],
                            "Image":
                            images[index],
                          })
                        },




                child: ListTile(
                  trailing: Text( "4/7/2022"),

                    leading:
                    CircleAvatar(radius:40,backgroundImage: AssetImage(images[index]),),
                    title: Text(title[index],style: TextStyle(color: Colors.black,fontSize: 20)),
                    subtitle: Text(subtitle[index],style: TextStyle(color: Colors.grey,fontSize: 15),),
                  ),
                ));
              },
              itemCount: images.length,

            )










































              ), )
            ],
          ),
        )); // ClipPath
  }
}
