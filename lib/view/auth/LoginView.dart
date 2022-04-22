import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:new_shop/utls/Themes.dart';

class LoginView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Directionality(
            textDirection: TextDirection.rtl,
            child: ListView(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('images/login.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).size.width,
                    // width: MediaQuery.of(context).size.width ,

                    // width: 100,

                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      color: Themes.color2,
                      elevation: 10,
                      child: Form(
                        child: Column(children: <Widget>[
                          SizedBox(
                            height: 40,
                          ),
                          // SizedBox(
                          //   height: 30,
                          // ),
                          Container(
                            margin: EdgeInsets.only(left: 20, right: 15),
                            child: Row(
                              children: [
                                Text("     البريد الالكتروني  "),
                              ],
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(left: 20, right: 20, top: 5),
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
                                  borderSide:
                                      BorderSide(color: Colors.deepPurple),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20, right: 15),
                            child: Row(
                              children: [
                                Text("     كلمه المرور  "),
                              ],
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(left: 20, right: 20, top: 5),
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
                                  borderSide:
                                      BorderSide(color: Colors.deepPurple),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          // RaisedButton(
                          //   onPressed: () {
                          //     Get.toNamed('/HomePage');
                          //   },
                          //   color: Colors.pink[900],
                          //   shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(20)),
                          //   child: Text(
                          //     " تسجيل الدخول ",
                          //     style:
                          //         TextStyle(fontSize: 20, color: Colors.white),
                          //   ),
                          // ),
                        InkWell(onTap:(){Get.toNamed('/HomePage'); },child: CircleAvatar(
                            backgroundColor: Themes.color,
                            radius: 40,
                            child: Text(
                              " تسجيل الدخول ",
                              style:
                              TextStyle(fontSize: 12, color: Colors.white),
                            ), //Text
                          ),), //CircleAvatar
                          SizedBox(
                            height: 30,
                          ),
                        ]),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Center(
                          child: RaisedButton(
                            onPressed: () {
                              Get.toNamed('/regester');
                            },
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "  انشاء حساب  ",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Center(
                          child: RaisedButton(
                            onPressed: () {},
                            color: Colors.purple[50],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              " تسجيل دخول ",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),


                  // Divider(
                  //   color: Colors.black,
                  //   height: 20,
                  //   thickness: 1,
                  //   indent: 10,
                  //   endIndent: 10,
                  // ),
                ],
              )
            ])));
  }
}
