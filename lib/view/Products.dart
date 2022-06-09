import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_shop/logic/controllers/AppBarController.dart';
import 'package:new_shop/logic/controllers/ProductController.dart';
import '../utls/Themes.dart';
import 'ConstantPages/AppBar.dart';
import 'ConstantPages/Drawer.dart';
import 'Seggestions.dart';

class Product extends GetView<ProductController> {
  final sampleController = Get.put(AppBarController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          key: sampleController.getscaffoldKey2(),
          drawer: myDrawer(),
          //  endDrawerEnableOpenDragGesture: true,

          body: Column(children: <Widget>[
            SizedBox(
              height: 2,
            ),
            Expanded(
              flex: 2,
              child: myAppBar(),
            ),
            Expanded(
                flex: 1,
                child: Container(
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: [
                        Row(children: <Widget>[
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 130,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Themes.color3,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: DropdownButton(

                              iconEnabledColor: Themes.color3 ,
                              items: [
                                DropdownMenuItem(
                                  child: Text("First Item"),
                                  value: 1,
                                ),
                                DropdownMenuItem(
                                  child: Text("Second Item"),
                                  value: 2,
                                )
                              ],
                              onChanged: (value) {},
                              hint: Text(
                                "خياطه",
                                style: Themes.subtitle2,
                              ),
                              alignment: Alignment.center,
                            ),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Container(
                            width: 130,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Themes.color3,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: DropdownButton(
                              iconEnabledColor: Themes.color3 ,
                              items: [
                                DropdownMenuItem(
                                  child: Text("First Item"),
                                  value: 1,
                                ),
                                DropdownMenuItem(
                                  child: Text("Second Item"),
                                  value: 2,
                                )
                              ],
                              onChanged: (value) {},
                              hint: Text(
                                "مواد تجميل",
                                style: Themes.subtitle2,
                              ),
                              alignment: Alignment.center,
                            ),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Container(
                            width: 130,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Themes.color3,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: DropdownButton(
                              iconEnabledColor: Themes.color3 ,
                              items: [
                                DropdownMenuItem(
                                  child: Text("First Item"),
                                  value: 1,
                                ),
                                DropdownMenuItem(
                                  child: Text("Second Item"),
                                  value: 2,
                                )
                              ],
                              onChanged: (value) {},
                              hint: Text(
                                "تطريز",
                                style: Themes.subtitle2,
                              ),
                              alignment: Alignment.center,
                            ),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Container(
                            width: 130,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Themes.color3,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: DropdownButton(
                              iconEnabledColor: Themes.color3 ,
                              items: [
                                DropdownMenuItem(
                                  child: Text("First Item"),
                                  value: 1,
                                ),
                                DropdownMenuItem(
                                  child: Text("Second Item"),
                                  value: 2,
                                )
                              ],
                              onChanged: (value) {},
                              hint: Text(
                                "صوف",
                                style: Themes.subtitle2,
                              ),
                              alignment: Alignment.center,
                            ),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Container(
                            width: 130,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Themes.color3,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: DropdownButton(
                              iconEnabledColor: Themes.color3 ,
                              items: [
                                DropdownMenuItem(
                                  child: Text("First Item"),
                                  value: 1,
                                ),
                                DropdownMenuItem(
                                  child: Text("Second Item"),
                                  value: 2,
                                )
                              ],
                              onChanged: (value) {},
                              hint: Text(
                                "ماغات",
                                style: Themes.subtitle2,
                              ),
                              alignment: Alignment.center,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                        ]),
                      ]),
                )), // ListView
            Expanded(
                flex: 8,
                child: ListView(children: [
                  Row(
                    children: [
                      InkWell(
                        child: Container(
                          margin: EdgeInsets.only(right: 28, bottom: 10),
                          child: Text(
                            "عروض وحسومات",
                            style: Themes.headline3,
                          ),
                        ),
                        onTap: () {
                          Get.to(Seggestions(
                            title: "عروض وحسومات",
                          ));
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8, bottom: 8),
                        child: IconButton(
                            onPressed: () {
                              Get.to(Seggestions(
                                title: "عروض وحسومات",
                              ));
                            },
                            icon: Icon(
                              Icons.arrow_forward,
                              color: Themes.color3,
                              size: 25,
                            )),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(children: <Widget>[
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                width: MediaQuery.of(context).size.width * 0.5,
                                height: 180,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: ExactAssetImage('images/tt.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 40),
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Row(
                                  children: [
                                    Text(
                                      "اسم المنتج ",
                                      style: Themes.headline1,
                                    ),
                                    Icon(Icons.tag_faces_outlined,
                                        color: Colors.deepOrangeAccent),
                                  ],
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Text(
                                    "2990 ل.س",
                                    style: Themes.subtitle2,
                                  )),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                width: MediaQuery.of(context).size.width * 0.5,
                                height: 180,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: ExactAssetImage('images/8.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 40),
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Row(
                                  children: [
                                    Text(
                                      "اسم المنتج ",
                                      style: Themes.headline1,
                                    ),
                                    Icon(Icons.tag_faces_outlined,
                                        color: Colors.green),
                                  ],
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Text(
                                    "2990 ل.س",
                                    style: Themes.subtitle2,
                                  )),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                width: MediaQuery.of(context).size.width * 0.5,
                                height: 180,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: ExactAssetImage('images/shop2.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 40),
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Row(
                                  children: [
                                    Text(
                                      "اسم المنتج ",
                                      style: Themes.headline1,
                                    ),
                                    Icon(Icons.tag_faces_outlined,
                                        color: Colors.green),
                                  ],
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Text(
                                    "2990 ل.س",
                                    style: Themes.subtitle2,
                                  )),
                            ],
                          ),
                        ]),
                      ),
                    ],
                  ),
                  Row(children: [
                    Container(
                        margin:
                            EdgeInsets.only(right: 150, top: 25, bottom: 10),
                        child: TextButton(
                          child: Text(
                            "عرض المزيد",
                            style: Themes.bodyText3,
                          ),
                          onPressed: () {
                            Get.to(Seggestions(title: "عروض وحسومات"));
                          },
                        ))
                  ]),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      InkWell(
                        child: Container(
                          margin: EdgeInsets.only(right: 28, bottom: 10),
                          child: Text(
                            "اقتراحات قد تعجبك",
                            style: Themes.headline3,
                          ),
                        ),
                        onTap: () {
                          Get.to(Seggestions(
                            title: "اقتراحات قد تعجبك",
                          ));
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8, bottom: 8),
                        child: IconButton(
                            onPressed: () {
                              Get.to(Seggestions(
                                title: "اقتراحات قد تعجبك",
                              ));
                            },
                            icon: Icon(
                              Icons.arrow_forward,
                              color: Themes.color3,
                              size: 25,
                            )),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(children: <Widget>[
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                width: MediaQuery.of(context).size.width * 0.5,
                                height: 180,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: ExactAssetImage('images/tt.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 40),
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Row(
                                  children: [
                                    Text(
                                      "اسم المنتج ",
                                      style: Themes.headline1,
                                    ),
                                    Icon(Icons.tag_faces_outlined,
                                        color: Colors.orange),
                                  ],
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Text(
                                    "2990 ل.س",
                                    style: Themes.subtitle2,
                                  )),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                width: MediaQuery.of(context).size.width * 0.5,
                                height: 180,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: ExactAssetImage('images/8.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 40),
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Row(
                                  children: [
                                    Text(
                                      "اسم المنتج ",
                                      style: Themes.headline1,
                                    ),
                                    Icon(Icons.tag_faces_outlined,
                                        color: Colors.green),
                                  ],
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Text(
                                    "2990 ل.س",
                                    style: Themes.subtitle2,
                                  )),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                width: MediaQuery.of(context).size.width * 0.5,
                                height: 180,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: ExactAssetImage('images/shop2.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 40),
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Row(
                                  children: [
                                    Text(
                                      "اسم المنتج ",
                                      style: Themes.headline1,
                                    ),
                                    Icon(Icons.tag_faces_outlined,
                                        color: Colors.green),
                                  ],
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Text(
                                    "2990 ل.س",
                                    style: Themes.subtitle2,
                                  )),
                            ],
                          ),
                        ]),
                      ),
                    ],
                  ),
                  Row(children: [
                    Container(
                        margin:
                            EdgeInsets.only(right: 150, top: 25, bottom: 10),
                        child: TextButton(
                          child: Text(
                            "عرض المزيد",
                            style: Themes.bodyText3,
                          ),
                          onPressed: () {
                            Get.to(Seggestions(
                              title: "اقتراحات قد تعجبك",
                            ));
                          },
                        ))
                  ]),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      InkWell(
                        child: Container(
                          margin: EdgeInsets.only(right: 28, bottom: 10),
                          child: Text(
                            "الأكثر شيوعاً",
                            style: Themes.headline3,
                          ),
                        ),
                        onTap: () {
                          Get.to(Seggestions(
                            title: "الأكثر شيوعاً",
                          ));
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8, bottom: 8),
                        child: IconButton(
                            onPressed: () {
                              Get.to(Seggestions(
                                title: "الأكثر شيوعاً",
                              ));
                            },
                            icon: Icon(
                              Icons.arrow_forward,
                              color: Themes.color3,
                              size: 25,
                            )),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(children: <Widget>[
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                width: MediaQuery.of(context).size.width * 0.5,
                                height: 180,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: ExactAssetImage('images/tt.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 40),
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Row(
                                  children: [
                                    Text(
                                      "اسم المنتج ",
                                      style: Themes.headline1,
                                    ),
                                    Icon(Icons.tag_faces_outlined,
                                        color: Colors.orange),
                                  ],
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Text(
                                    "2990 ل.س",
                                    style: Themes.subtitle2,
                                  )),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                width: MediaQuery.of(context).size.width * 0.5,
                                height: 180,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: ExactAssetImage('images/8.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 40),
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Row(
                                  children: [
                                    Text(
                                      "اسم المنتج ",
                                      style: Themes.headline1,
                                    ),
                                    Icon(Icons.tag_faces_outlined,
                                        color: Colors.green),
                                  ],
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Text(
                                    "2990 ل.س",
                                    style: Themes.subtitle2,
                                  )),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                width: MediaQuery.of(context).size.width * 0.5,
                                height: 180,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: ExactAssetImage('images/shop2.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 40),
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Row(
                                  children: [
                                    Text(
                                      "اسم المنتج ",
                                      style: Themes.headline1,
                                    ),
                                    Icon(Icons.tag_faces_outlined,
                                        color: Colors.green),
                                  ],
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Text(
                                    "2990 ل.س",
                                    style: Themes.subtitle2,
                                  )),
                            ],
                          ),
                        ]),
                      ),
                    ],
                  ),
                  Row(children: [
                    Container(
                        margin:
                            EdgeInsets.only(right: 150, top: 25, bottom: 10),
                        child: TextButton(
                          child: Text(
                            "عرض المزيد",
                            style: Themes.bodyText3,
                          ),
                          onPressed: () {
                            Get.to(Seggestions(
                              title: "الأكثر شيوعاً",
                            ));
                          },
                        ))
                  ]),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      InkWell(
                        child: Container(
                          margin: EdgeInsets.only(right: 28, bottom: 10),
                          child: Text(
                            "الأقل سعراً",
                            style: Themes.headline3,
                          ),
                        ),
                        onTap: () {
                          Get.to(Seggestions(
                            title: "الأقل سعراً",
                          ));
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8, bottom: 8),
                        child: IconButton(
                            onPressed: () {
                              Get.to(Seggestions(
                                title: "الأقل سعراً",
                              ));
                            },
                            icon: Icon(
                              Icons.arrow_forward,
                              color: Themes.color3,
                              size: 25,
                            )),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(children: <Widget>[
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                width: MediaQuery.of(context).size.width * 0.5,
                                height: 180,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: ExactAssetImage('images/tt.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 40),
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Row(
                                  children: [
                                    Text(
                                      "اسم المنتج ",
                                      style: Themes.headline1,
                                    ),
                                    Icon(Icons.tag_faces_outlined,
                                        color: Colors.orange),
                                  ],
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Text(
                                    "2990 ل.س",
                                    style: Themes.subtitle2,
                                  )),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                width: MediaQuery.of(context).size.width * 0.5,
                                height: 180,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: ExactAssetImage('images/8.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 40),
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Row(
                                  children: [
                                    Text(
                                      "اسم المنتج ",
                                      style: Themes.headline1,
                                    ),
                                    Icon(Icons.tag_faces_outlined,
                                        color: Colors.green),
                                  ],
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Text(
                                    "2990 ل.س",
                                    style: Themes.subtitle2,
                                  )),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                width: MediaQuery.of(context).size.width * 0.5,
                                height: 180,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: ExactAssetImage('images/shop2.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 40),
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Row(
                                  children: [
                                    Text(
                                      "اسم المنتج ",
                                      style: Themes.headline1,
                                    ),
                                    Icon(Icons.tag_faces_outlined,
                                        color: Colors.green),
                                  ],
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Text(
                                    "2990 ل.س",
                                    style: Themes.subtitle2,
                                  )),
                            ],
                          ),
                        ]),
                      ),
                    ],
                  ),
                  Row(children: [
                    Container(
                        margin:
                            EdgeInsets.only(right: 150, top: 25, bottom: 10),
                        child: TextButton(
                          child: Text(
                            "عرض المزيد",
                            style: Themes.bodyText3,
                          ),
                          onPressed: () {
                            Get.to(Seggestions(
                              title: "الأقل سعراً",
                            ));
                          },
                        ))
                  ]),
                  SizedBox(
                    height: 20,
                  ),
                ])),
          ]),
        ),
      ),
    );
  }
}
