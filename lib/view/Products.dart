import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_shop/logic/controllers/AppBarController.dart';
import 'package:new_shop/logic/controllers/ProductController.dart';
import 'package:new_shop/view/Seggestions.dart';
import 'ConstantPages/AppBar.dart';
import 'ConstantPages/Drawer.dart';

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

                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                    myAppBar(),
              ])

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
                                color: Colors.grey,
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
                                color: Colors.grey,
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
                                color: Colors.grey,
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
                                color: Colors.grey,
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
                                color: Colors.grey,
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


            Expanded(
                flex:5 ,
                child: ListView(children: [

                  Row(
                    children: [
                      InkWell(
                        child: Container(
                          margin:
                          EdgeInsets.only(right:20),
                          child: Text(
                            "اقتراحات قد تعجبك",
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                        onTap: (){Get.to( ()=>Seggestions());},
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
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Icon(Icons.tag_faces_outlined,
                                        color: Colors.pink[900]),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 50),
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Row(
                                  children: [
                                    Text(" 568.8"),
                                    Text(" ل.س")
                                  ],
                                ),
                              ),

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
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Icon(Icons.tag_faces_outlined,
                                        color: Colors.pink[900]),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 50),
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Row(
                                  children: [
                                    Text(" 568.8"),
                                    Text(" ل.س")
                                  ],
                                ),
                              ),

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
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Icon(Icons.tag_faces_outlined,
                                        color: Colors.pink[900]),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 50),
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Row(
                                  children: [
                                    Text(" 568.8"),
                                    Text(" ل.س")
                                  ],
                                ),
                              ),

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
                      InkWell(
                      child: Container(
                      margin:
                      EdgeInsets.only(right:20),
                      child: Text(
                        "الاقل سعرا ",
                        style: TextStyle(fontSize: 18),
                      ),),onTap: (){},),
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

                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                width: MediaQuery.of(context).size.width * 0.5,
                                height: 180,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: ExactAssetImage('images/2.jpg'),
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
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Icon(Icons.tag_faces_outlined,
                                        color: Colors.pink[900]),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 50),
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Row(
                                  children: [
                                    Text(" 568.8"),
                                    Text(" ل.س")
                                  ],
                                ),
                              ),

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
                                    image: ExactAssetImage('images/4.jpg'),
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
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Icon(Icons.tag_faces_outlined,
                                        color: Colors.pink[900]),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 50),
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Row(
                                  children: [
                                    Text(" 568.8"),
                                    Text(" ل.س")
                                  ],
                                ),
                              ),

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
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Icon(Icons.tag_faces_outlined,
                                        color: Colors.pink[900]),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 50),
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Row(
                                  children: [
                                    Text(" 568.8"),
                                    Text(" ل.س")
                                  ],
                                ),
                              ),

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
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Text(
                          "عروض وحسومات",

                          style: TextStyle(fontSize: 18),
                        ),
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

                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                width: MediaQuery.of(context).size.width * 0.5,
                                height: 180,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: ExactAssetImage('images/100.jpg'),
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
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Icon(Icons.tag_faces_outlined,
                                        color: Colors.pink[900]),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 50),
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Row(
                                  children: [
                                    Text(" 568.8"),
                                    Text(" ل.س")
                                  ],
                                ),
                              ),

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
                                    image: ExactAssetImage('images/44.jpg'),
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
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Icon(Icons.tag_faces_outlined,
                                        color: Colors.pink[900]),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 50),
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Row(
                                  children: [
                                    Text(" 568.8"),
                                    Text(" ل.س")
                                  ],
                                ),
                              ),

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
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Icon(Icons.tag_faces_outlined,
                                        color: Colors.pink[900]),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 50),
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Row(
                                  children: [
                                    Text(" 568.8"),
                                    Text(" ل.س")
                                  ],
                                ),
                              ),

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
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Text(
                        "الاكثر شيوعا",
                        style: TextStyle(fontSize: 18),
                      ),),
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

                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                width: MediaQuery.of(context).size.width * 0.5,
                                height: 180,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: ExactAssetImage('images/9.jpg'),
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
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Icon(Icons.tag_faces_outlined,
                                        color: Colors.pink[900]),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 50),
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Row(
                                  children: [
                                    Text(" 568.8"),
                                    Text(" ل.س")
                                  ],
                                ),
                              ),

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
                                    image: ExactAssetImage('images/11.jpg'),
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
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Icon(Icons.tag_faces_outlined,
                                        color: Colors.pink[900]),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 50),
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Row(
                                  children: [
                                    Text(" 568.8"),
                                    Text(" ل.س")
                                  ],
                                ),
                              ),

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
                                    image: ExactAssetImage('images/66.jpg'),
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
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Icon(Icons.tag_faces_outlined,
                                        color: Colors.pink[900]),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 50),
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Row(
                                  children: [
                                    Text(" 568.8"),
                                    Text(" ل.س")
                                  ],
                                ),
                              ),

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