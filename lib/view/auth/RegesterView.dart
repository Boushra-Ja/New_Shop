import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:new_shop/utls/Themes.dart';

class RegisterView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Directionality(
            textDirection: TextDirection.rtl,
            child: ListView(children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
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
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.25,
                      child: Stack(
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: 20),
                              width: MediaQuery.of(context).size.width,
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
                                    Container(
                                      margin: EdgeInsets.only(right: 15),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10.0),
                                            child: Text(
                                              "الاسم الثلاثي  ",
                                              style: Themes.bodyText1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 50,
                                      margin:
                                          EdgeInsets.only(left: 20, right: 15),
                                      child: TextFormField(
                                        style: TextStyle(
                                          //: 40.0,
                                          height: 1.0,
                                        ),
                                        autocorrect: true,
                                        decoration: InputDecoration(
                                          hintText: ' ادخل اسمك....',
                                          hintStyle: Themes.subtitle2,
                                          filled: true,
                                          fillColor: Colors.white70,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(100.0)),
                                            borderSide: BorderSide(
                                                color: Colors.black, width: 1),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50.0)),
                                            borderSide:
                                                BorderSide(color: Colors.red),
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 20, right: 15),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10.0),
                                            child: Text(
                                              "البريد الالكتروني  ",
                                              style: Themes.bodyText1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 20, right: 20, top: 5),
                                      height: 50,
                                      child: TextFormField(
                                        style: TextStyle(
                                          //: 40.0,
                                          height: 1.0,
                                        ),
                                        autocorrect: true,
                                        decoration: InputDecoration(
                                          hintText:
                                              ' ادخل بريدك الالكتروني....',
                                          hintStyle: Themes.subtitle2,
                                          filled: true,
                                          fillColor: Colors.white70,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(100.0)),
                                            borderSide: BorderSide(
                                                color: Colors.black, width: 1),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50.0)),
                                            borderSide: BorderSide(
                                                color: Colors.deepPurple),
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 20, right: 15),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10.0),
                                            child: Text(
                                              "كلمه المرور  ",
                                              style: Themes.bodyText1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 20, right: 20, top: 5),
                                      height: 50,
                                      child: TextFormField(
                                        style: TextStyle(
                                          //: 40.0,
                                          height: 1.0,
                                        ),
                                        autocorrect: true,
                                        decoration: InputDecoration(
                                          hintText: ' ادخل كلمه المرور....',
                                          hintStyle: Themes.subtitle2,
                                          filled: true,
                                          fillColor: Colors.white70,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(100.0)),
                                            borderSide: BorderSide(
                                                color: Colors.black, width: 1),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50.0)),
                                            borderSide: BorderSide(
                                                color: Colors.deepPurple),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    RaisedButton(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 25),
                                      onPressed: () {
                                        Get.toNamed('/HomePage');
                                      },
                                      color: Themes.color,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Text(
                                        "انشاء حساب",
                                        style: Themes.bodyText4,
                                      ),
                                    ),
                                    // InkWell(onTap:(){Get.toNamed('/HomePage'); },child:  CircleAvatar(
                                    //   backgroundColor: Themes.color,
                                    //   radius: 40,
                                    //   child: Text(
                                    //     "  انشاء حساب ",
                                    //     style:
                                    //     TextStyle(fontSize: 12, color: Colors.white),
                                    //   ), //Text
                                    // ),), //,)
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ]),
                                ),
                              )),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Center(
                                  child: RaisedButton(
                                    onPressed: () {},
                                    color: Colors.purple[50],
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text(
                                      "انشاء حساب  ",
                                      style: Themes.headline1,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Center(
                                  child: RaisedButton(
                                    onPressed: () {
                                      Get.offNamed('/login');
                                    },
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text(
                                      "تسجيل دخول ",
                                      style: Themes.bodyText1,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ])));
  }
}
