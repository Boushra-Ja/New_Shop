import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_shop/logic/controllers/AppBarController.dart';
import 'package:new_shop/logic/controllers/ProductController.dart';
import 'package:new_shop/view/AppBar.dart';
import 'package:new_shop/view/Seggestions.dart';

import 'Drawer.dart';

class Product extends GetView<ProductController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final sampleController = Get.put(AppBarController(),permanent: true);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(

          key: sampleController.getscaffoldKey2(),
          drawer: myDrawer()
       ,
        //  endDrawerEnableOpenDragGesture: true,

          body: Column(children: <Widget>[
            Expanded(
              flex: 1,
              child:  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                    myAppBar(),
              ])),
              // Stack(children: [
              //   Positioned(
              //     top: 5,
              //     child: IconButton(
              //         onPressed: () {
              //           _scaffoldKey.currentState!.openDrawer();
              //         },
              //         icon: Icon(
              //           Icons.menu,
              //           size: 50,
              //         )),
              //   ),
              //   Positioned(
              //     top: 20,
              //     right: 80,
              //     child: Container(
              //       width: 250,
              //       height: 45,
              //       decoration: BoxDecoration(
              //         border: Border.all(
              //           color: Colors.black,
              //           width: 3,
              //         ),
              //         borderRadius: BorderRadius.circular(20),
              //       ),
              //       child: Row(children: [
              //         IconButton(
              //           onPressed: () {
              //             print("search");
              //           },
              //           icon: const Icon(Icons.search),
              //         ),
              //         Text(" انقر هنا للبحث ..."),
              //       ]),
              //     ),
              //   ),
              //   Positioned(
              //     top: 5,
              //     left: 20,
              //     child: IconButton(
              //         onPressed: () {},
              //         icon: Icon(
              //           Icons.shopping_cart_outlined,
              //           size: 50,
              //           color: Colors.black,
              //         )),
              //   ),
              // ]), // ListView
            ),
            Expanded(
                flex: 1,
                child: Container(
                  child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        Row(children: <Widget>[
                          SizedBox(
                            // height: 300,
                            width: 22,
                          ),
                          Container(
                            width: 130,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xFFAF3A88),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: DropdownButton(
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
                                  "     خياطه ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            width: 130,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xFFAF3A88),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: DropdownButton(
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
                                  "     مواد تجميل ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                          ),
                          SizedBox(
                            width: 30,
                          ),

                          Container(
                            width: 130,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xFFAF3A88),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: DropdownButton(
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
                                  "     تطريز ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                          ),
                          SizedBox(
                            width: 30,
                          ),

                          Container(
                            width: 130,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xFFAF3A88),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: DropdownButton(
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
                                  "     صوف ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                          ),
                          SizedBox(
                            width: 30,
                          ),

                          Container(
                            width: 130,
                            height: 30,
                            decoration: BoxDecoration(

                              border: Border.all(
                                color: Color(0xFFAF3A88),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: DropdownButton(
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
                                hint: Text("     خياطه ")),
                          ),
                          SizedBox(
                            width: 30,
                          ),

                        ]),
                      ]),
                )), // ListView
            Row(
              children: [
                Text(
                  "    اقتراحات قد تعجبك  ",
                  style: TextStyle(fontSize: 22, color: Colors.black),
                ),
                IconButton(
                    onPressed: () {Get.to( ()=>Seggestions());},
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Colors.pink[900],
                      size: 30,
                    ))
              ],
            ),

            Expanded(
                flex:5 ,
                child: ListView(children: [

                  Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 20),
                                width: 358,
                                height: 180,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  image: DecorationImage(
                                    image: ExactAssetImage('images/66.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  border: Border.all(
                                    width: 4,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 170),
                                    child: Row(
                                      children: [
                                        Text(
                                          "      اسم المنتج  ",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Icon(
                                          Icons.face,
                                          color: Colors.pink[900],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "568.8sp  ",
                                    style: TextStyle(
                                      color: Colors.pink[900],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 20),
                                width: 358,
                                height: 180,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: ExactAssetImage('images/1.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 4,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 170),
                                    child: Row(
                                      children: [
                                        Text(
                                          "      اسم المنتج  ",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Icon(Icons.face,
                                            color: Colors.pink[900]),
                                      ],
                                    ),
                                  ),
                                  Text("568.8sp  "),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 20),
                                width: 358,
                                height: 180,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: ExactAssetImage('images/2.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 4,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 170),
                                    child: Row(
                                      children: [
                                        Text(
                                          "      اسم المنتج  ",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Icon(Icons.face),
                                      ],
                                    ),
                                  ),
                                  Text("568.8sp  "),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
//padding: EdgeInsets.all(0.5),
                                margin: EdgeInsets.only(right: 20),
                                width: 358,
                                height: 180,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: ExactAssetImage('images/55.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  border: Border.all(
//  color: Colors.pink[900],
                                    width: 4,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
//   child: Text("kkkkkkkkkkkkkkkk"),
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 170),
                                    child: Row(
                                      children: [
                                        Text(
                                          "      اسم المنتج  ",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Icon(Icons.face),
                                      ],
                                    ),
                                  ),
                                  Text("568.8sp  "),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            width: 30,
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
                            " عرض المزيد ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.pink[900]),
                          ),
                          onPressed: () {},
                        ))
                  ]),
                  Container(
                    margin: EdgeInsets.only(right: 80, left: 80, bottom: 10),
                    child: Divider(
                      color: Colors.black12,
                      height: 20,
                      thickness: 1,
                      indent: 5,
                      endIndent: 5,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "       الاقل سعرا   ",
                        style: TextStyle(fontSize: 22),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward,
                            color: Colors.pink[900],
                            size: 30,
                          ))
                    ],
                  ),
                  Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
//padding: EdgeInsets.all(0.5),
                                margin: EdgeInsets.only(right: 20),
                                width: 358,
                                height: 180,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: ExactAssetImage('images/2.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  border: Border.all(
//  color: Colors.pink[900],
                                    width: 4,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
//   child: Text("kkkkkkkkkkkkkkkk"),
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 170),
                                    child: Row(
                                      children: [
                                        Text(
                                          "      اسم المنتج  ",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Icon(Icons.face),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "568.8sp  ",
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
//padding: EdgeInsets.all(0.5),
                                margin: EdgeInsets.only(right: 20),
                                width: 358,
                                height: 180,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: ExactAssetImage('images/3.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  border: Border.all(
// color: Colors.pink[900],
                                    width: 4,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
//   child: Text("kkkkkkkkkkkkkkkk"),
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 170),
                                    child: Row(
                                      children: [
                                        Text(
                                          "      اسم المنتج  ",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Icon(Icons.face),
                                      ],
                                    ),
                                  ),
                                  Text("568.8sp  "),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
//padding: EdgeInsets.all(0.5),
                                margin: EdgeInsets.only(right: 20),
                                width: 358,
                                height: 180,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: ExactAssetImage('images/4.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  border: Border.all(
//  color: Colors.pink[900],
                                    width: 4,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
//   child: Text("kkkkkkkkkkkkkkkk"),
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 170),
                                    child: Row(
                                      children: [
                                        Text(
                                          "      اسم المنتج  ",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Icon(Icons.face),
                                      ],
                                    ),
                                  ),
                                  Text("568.8sp  "),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
//padding: EdgeInsets.all(0.5),
                                margin: EdgeInsets.only(right: 20),
                                width: 358,
                                height: 180,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: ExactAssetImage('images/8.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  border: Border.all(
//  color: Colors.pink[900],
                                    width: 4,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
//   child: Text("kkkkkkkkkkkkkkkk"),
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 170),
                                    child: Row(
                                      children: [
                                        Text(
                                          "      اسم المنتج  ",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Icon(Icons.face),
                                      ],
                                    ),
                                  ),
                                  Text("568.8sp  "),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            width: 30,
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
                            " عرض المزيد ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.pink[900]),
                          ),
                          onPressed: () {},
                        ))
                  ]),
                  Container(
                    margin: EdgeInsets.only(right: 80, left: 80, bottom: 10),
                    child: Divider(
                      color: Colors.black12,
                      height: 20,
                      thickness: 1,
                      indent: 5,
                      endIndent: 5,
                    ),
                  ),
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                  Row(
                    children: [
                      Text(
                        "       عروص وحسومات  "
                            "   ",
                        style: TextStyle(fontSize: 22),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward,
                            color: Colors.pink[900],
                            size: 30,
                          ))
                    ],
                  ),
                  Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
//padding: EdgeInsets.all(0.5),
                                margin: EdgeInsets.only(right: 20),
                                width: 358,
                                height: 180,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: ExactAssetImage('images/5.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  border: Border.all(
//   color: Colors.pink[900],
                                    width: 4,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
//   child: Text("kkkkkkkkkkkkkkkk"),
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 170),
                                    child: Row(
                                      children: [
                                        Text(
                                          "      اسم المنتج  ",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Icon(Icons.face),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "568.8sp  ",
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
//padding: EdgeInsets.all(0.5),
                                margin: EdgeInsets.only(right: 20),
                                width: 358,
                                height: 180,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: ExactAssetImage('images/55.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  border: Border.all(
//  color: Colors.pink[900],
                                    width: 4,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
//   child: Text("kkkkkkkkkkkkkkkk"),
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 170),
                                    child: Row(
                                      children: [
                                        Text(
                                          "      اسم المنتج  ",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Icon(Icons.face),
                                      ],
                                    ),
                                  ),
                                  Text("568.8sp  "),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
//padding: EdgeInsets.all(0.5),
                                margin: EdgeInsets.only(right: 20),
                                width: 358,
                                height: 180,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: ExactAssetImage('images/44.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  border: Border.all(
//  color: Colors.pink[900],
                                    width: 4,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
//   child: Text("kkkkkkkkkkkkkkkk"),
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 170),
                                    child: Row(
                                      children: [
                                        Text(
                                          "      اسم المنتج  ",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Icon(Icons.face),
                                      ],
                                    ),
                                  ),
                                  Text("568.8sp  "),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
//padding: EdgeInsets.all(0.5),
                                margin: EdgeInsets.only(right: 20),
                                width: 358,
                                height: 180,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: ExactAssetImage('images/100.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  border: Border.all(
//  color: Colors.pink[900],
                                    width: 4,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
//   child: Text("kkkkkkkkkkkkkkkk"),
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 170),
                                    child: Row(
                                      children: [
                                        Text(
                                          "      اسم المنتج  ",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Icon(Icons.face),
                                      ],
                                    ),
                                  ),
                                  Text("568.8sp  "),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            width: 30,
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
                            " عرض المزيد ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.pink[900]),
                          ),
                          onPressed: () {},
                        ))
                  ]),
                  Container(
                    margin: EdgeInsets.only(right: 80, left: 80, bottom: 10),
                    child: Divider(
                      color: Colors.black12,
                      height: 20,
                      thickness: 1,
                      indent: 5,
                      endIndent: 5,
                    ),
                  ),

                  Row(
                    children: [
                      Text(
                        "       الاكثر شيوعا   ",
                        style: TextStyle(fontSize: 22),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward,
                            color: Colors.pink[900],
                            size: 30,
                          ))
                    ],
                  ),
                  Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
//padding: EdgeInsets.all(0.5),
                                margin: EdgeInsets.only(right: 20),
                                width: 358,
                                height: 180,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: ExactAssetImage('images/11.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  border: Border.all(
//color: Colors.pink[900],
                                    width: 4,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
//   child: Text("kkkkkkkkkkkkkkkk"),
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 170),
                                    child: Row(
                                      children: [
                                        Text(
                                          "      اسم المنتج  ",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Icon(Icons.face),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "568.8sp  ",
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
//padding: EdgeInsets.all(0.5),
                                margin: EdgeInsets.only(right: 20),
                                width: 358,
                                height: 180,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: ExactAssetImage('images/9.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  border: Border.all(
//  color: Colors.pink[900],
                                    width: 4,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
//   child: Text("kkkkkkkkkkkkkkkk"),
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 170),
                                    child: Row(
                                      children: [
                                        Text(
                                          "      اسم المنتج  ",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Icon(Icons.face),
                                      ],
                                    ),
                                  ),
                                  Text("568.8sp  "),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
//padding: EdgeInsets.all(0.5),
                                margin: EdgeInsets.only(right: 20),
                                width: 358,
                                height: 180,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: ExactAssetImage('images/11.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  border: Border.all(
// color: Colors.pink[900],
                                    width: 4,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
//   child: Text("kkkkkkkkkkkkkkkk"),
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 170),
                                    child: Row(
                                      children: [
                                        Text(
                                          "      اسم المنتج  ",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Icon(Icons.face),
                                      ],
                                    ),
                                  ),
                                  Text("568.8sp  "),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
//padding: EdgeInsets.all(0.5),
                                margin: EdgeInsets.only(right: 20),
                                width: 358,
                                height: 180,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: ExactAssetImage('images/1.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  border: Border.all(
// color: Colors.pink[900],
                                    width: 4,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 170),
                                    child: Row(
                                      children: [
                                        Text(
                                          "      اسم المنتج  ",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Icon(Icons.face),
                                      ],
                                    ),
                                  ),
                                  Text("568.8sp  "),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            width: 30,
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
                            " عرض المزيد ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.pink[900]),
                          ),
                          onPressed: () {},
                        ))
                  ]),
                  Container(
                    margin: EdgeInsets.only(right: 80, left: 80, bottom: 10),
                    child: Divider(
                      color: Colors.black12,
                      height: 20,
                      thickness: 1,
                      indent: 5,
                      endIndent: 5,
                    ),
                  ),
                ])),
          ]),
        ),
      ),
    );
  }

  Widget buildCircleImage6() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Container(
          height: 75,
          width: 75,
          padding: EdgeInsets.all(0.5),
          decoration: new BoxDecoration(
              border: new Border.all(
                color: Colors.black54,
              ), // Border.all
              borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(40.0),
                  topRight: const Radius.circular(40.0),
                  bottomLeft: const Radius.circular(40.0),
                  bottomRight: const Radius.circular(40.0))),
// BorderRadius.only, BoxDecoration
          child: ClipOval(
            child: Image.asset(
              "images/22.jpg",
              fit: BoxFit.cover,
            ), // Image.network
          ),
        )); // Padding

// Scrollbar(child: Container(
//              // fit: StackFit.expand,
//              child:
//              Stack(
//
//                  children: <Widget>[
//
//
//
//                    Positioned(
//                      top: 50,
//                      child:
//                      IconButton(onPressed:(){
//                        _scaffoldKey.currentState.openDrawer();
//                      } , icon: Icon(Icons.menu,size: 40,)),),
//                    Positioned(
//                      top: 60,
//                      right: 80,
//                      child:
//                      Container(
//                        width: 250,
//                        height: 40,
//                        decoration: BoxDecoration(border: Border.all(
//                          color: Colors.black,
//                          width: 2,
//                        ),
//                          borderRadius: BorderRadius.circular(20),),
//                        child:Row(children: [
//                          IconButton(
//                            onPressed: () {print("search");},
//                            icon: const Icon(Icons.search),
//                          ),
//                          Text(" انقر هنا للبحث ..."),
//
//
//                        ]), ),),
//                    Positioned(
//                      top: 50,
//                      left: 20,
//                      child:
//                      IconButton(onPressed:(){
//                      } , icon: Icon(Icons.shopping_cart_outlined,size: 40,)),),
//
//                    IndexedStack(
//                      index: _currentIndex,
//                      children: [
//                        // for (final i in koko) i,
//                      ],
//                    ),
//
//                  ]),),),
  }

  Widget buildText6() {
    return Text(
      "Cundies",
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    );
  }
}
//  Row(
//   mainAxisAlignment: MainAxisAlignment.end,
//   crossAxisAlignment:CrossAxisAlignment.center ,
//   children: [
//   Column(
//   children: [
//     buildCircleImage6(),
//    buildText6(),
// ]),
//
//     Column(
//         children: [
//           buildCircleImage6(),
//           buildText6(),
//         ]),
//
//
//     Column(
//         children: [
//           buildCircleImage6(),
//           buildText6(),
//         ]),
//
//     Column(
//         children: [
//           buildCircleImage6(),
//           buildText6(),
//         ]),
//
//     Column(
//         children: [
//           buildCircleImage6(),
//           buildText6(),
//         ]),
//
//     Column(
//         children: [
//           buildCircleImage6(),
//           buildText6(),
//         ]),
//
//   ]),