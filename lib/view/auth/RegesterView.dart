import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';


class RegisterView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Directionality(
            textDirection: TextDirection.rtl,
            child:    SingleChildScrollView(
                child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child:
                    Stack(
                      children: [
                        Positioned(
                            top: 50,
                            bottom: 540,
                            left: 10,
                            right: 10,
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: ExactAssetImage('images/ss.jpg'),
                                  fit: BoxFit.fill,
                                ),

                              ),


                            )
                        ),
                        Positioned(
                          top: 280,
                          bottom: 110,
                          left: 1,
                          right: 1,
                          child: Container(
                            // width: 100,

                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                color: Colors.purple[50],
                                elevation: 10,
                                child: Form(
                                  child: Column(children: <Widget>[
                                    SizedBox(
                                      height: 40,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 20,right: 15),

                                      child:Row(
                                        children: [
                                          Text("     الاسم الثلاثي  "),
                                        ],
                                      ),),
                                    Container(
                                      height: 50,

                                      margin: EdgeInsets.only(left: 20,right: 15),

                                      child: TextFormField(
                                        style: TextStyle(
                                          //: 40.0,
                                          height: 1.0,
                                        ),
                                        autocorrect: true,
                                        decoration: InputDecoration(
                                          hintText: ' ادخل اسمك....',
                                          hintStyle: TextStyle(color: Colors.grey),
                                          filled: true,
                                          fillColor: Colors.white70,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(100.0)),
                                            borderSide:
                                            BorderSide(color: Colors.black, width: 1),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(50.0)),
                                            borderSide: BorderSide(color: Colors.red),
                                          ),
                                        ),
                                      ),),


                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 20,right: 15),
                                      child: Row(
                                        children: [
                                          Text("     البريد الالكتروني  "),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 20,right: 20,top: 5),
                                      height: 50,
                                      child: TextFormField(
                                        style: TextStyle(
                                          //: 40.0,
                                          height: 1.0,
                                        ),
                                        autocorrect: true,
                                        decoration: InputDecoration(
                                          hintText: ' ادخل بريدك الالكتروني....',
                                          hintStyle: TextStyle(color: Colors.grey),
                                          filled: true,
                                          fillColor: Colors.white70,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(100.0)),
                                            borderSide:
                                            BorderSide(color: Colors.black, width: 1),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(50.0)),
                                            borderSide: BorderSide(color: Colors.deepPurple),
                                          ),
                                        ),
                                      ),
                                    ),


                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 20,right: 15),                              child: Row(
                                      children: [
                                        Text("     كلمه المرور  "),
                                      ],
                                    ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 20,right: 20,top: 5),
                                      height: 50,
                                      child: TextFormField(
                                        style: TextStyle(
                                          //: 40.0,
                                          height: 1.0,
                                        ),
                                        autocorrect: true,
                                        decoration: InputDecoration(
                                          hintText: ' ادخل كلمه المرور....',
                                          hintStyle: TextStyle(color: Colors.grey),
                                          filled: true,
                                          fillColor: Colors.white70,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(100.0)),
                                            borderSide:
                                            BorderSide(color: Colors.black, width: 1),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(50.0)),
                                            borderSide: BorderSide(color: Colors.deepPurple),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20,),
                                    RaisedButton(
                                      onPressed: () {Get.toNamed('/HomePage');},
                                      color: Colors.pink[900],
                                      shape: RoundedRectangleBorder(

                                          borderRadius: BorderRadius.circular(20)),
                                      child: Text(
                                        "  انشاء حساب  ",
                                        style: TextStyle(fontSize: 20,color: Colors.white),
                                      ),
                                    ),
                                    SizedBox(height: 20,),

                                  ]),
                                ),
                              )),
                        ),
                        Positioned(
                          top: 260,
                          //bottom: 80,
                          left: 30,
                          right: 20,
                          child: Row(
                            children: [
                              RaisedButton(
                                onPressed: () {},
                                color: Colors.purple[50],
                                shape: RoundedRectangleBorder(

                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  "  انشاء حساب  ",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              SizedBox(
                                width: 70,
                              ),
                              RaisedButton(
                                onPressed: () {Get.toNamed('/login');},
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  " تسجيل دخول ",
                                  style: TextStyle(fontSize: 20),
                                ),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          //top: 260,
                          bottom: 80,
                          left: 50,
                          right: 50,
                          child: Divider(
                            color: Colors.black,
                            height: 20,
                            thickness: 1,
                            indent: 10,
                            endIndent: 10,
                          ),),
                        Positioned(
                          //top: 260,
                          bottom: 40,
                          left: 150,
                          right: 150,
                          child: Row(children: [
                            IconButton(onPressed: (){},icon:Icon(Icons.facebook), ),
                            IconButton(onPressed: (){},icon:Icon(Icons.face), )

                          ],

                          ),)

                      ],


                    )



                )) ));

    //SizedBox(height: 50),
  }
}
