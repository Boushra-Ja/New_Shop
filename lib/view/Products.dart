import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_shop/logic/controllers/AppBarController.dart';
import 'package:new_shop/logic/controllers/ProductController.dart';
import '../services/auth_services.dart';
import '../utls/Themes.dart';
import 'ConstantPages/AppBar.dart';
import 'ConstantPages/Drawer.dart';
import 'Seggestions.dart';

class Product extends GetView<ProductController> {
  final sampleController = Get.put(AppBarController(), permanent: true);
  final sampleControllerr = Get.put(ProductController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
         key: sampleController.getscaffoldKey2(),
         drawer: myDrawer(),
         endDrawerEnableOpenDragGesture: true,
         body: GetX<ProductController>(
            builder: (c) =>
              Center(
                child: c.listpoduct_salary.isEmpty &&
                    c.listpoduct_sales.isEmpty &&
                    c.listpoduct_favorite.isEmpty &&
                    c.listpoduct_discount.isEmpty &&
                    c.listpoduct_classification.isEmpty

                    ? Center(child: CircularProgressIndicator())
                    : GetX<ProductController>(
                        builder: (c) =>
                         Center(
                          child: c.listpoduct_salary.isEmpty &&
                             c.listpoduct_sales.isEmpty &&
                              c.listpoduct_favorite.isEmpty &&
                              c.listpoduct_discount.isEmpty &&
                              c.listpoduct_classification.isEmpty
                              ? CircularProgressIndicator()
                              : GetBuilder<ProductController>(
                                   builder: (controller) {
                                    return
                                        Column(children: <Widget>[
                                          SizedBox(
                                            height: 2,
                                          ),
                                          myAppBar(),
                                          SizedBox(height: 30,),

                                          Expanded(
                                            flex: 1,
                                            child:
                                            ListView.builder(
                                                scrollDirection:
                                                Axis.horizontal,
                                                itemCount: controller.listpoduct_classification.length,
                                                itemBuilder: (context, index) {
                                                  return
                                                    Container(
                                                      padding: EdgeInsets.only(right:6),
                                                      //  width: 100,
                                                        height: 10,
                                                        margin: EdgeInsets.only(left: 20,right: 20,bottom: 60),
                                                        decoration: BoxDecoration(
                                                          border: Border.all(
                                                            color: Colors.grey.shade600,
                                                            width: 2,
                                                          ),
                                                          borderRadius: BorderRadius.circular(20),
                                                        ),
                                                        child:
                                                        DropdownButton<
                                                            String>(
                                                            hint: Text(
                                                              "${controller.listpoduct_classification.elementAt(index).title}",),
                                                            value: controller.listpoduct_classification.elementAt(index).id == 1 ?
                                                            controller.selectedValue1 : controller.listpoduct_classification.elementAt(index).id == 2 ?
                                                            controller.selectedValue2 :
                                                            controller.listpoduct_classification.elementAt(index).id == 3 ?
                                                            controller.selectedValue3 :
                                                            controller.listpoduct_classification.elementAt(index).id == 4 ?
                                                            controller.selectedValue4 :
                                                            controller.listpoduct_classification.elementAt(index).id == 5 ?
                                                            controller.selectedValue5 :
                                                            controller.listpoduct_classification.elementAt(index).id == 6 ?
                                                            controller.selectedValue6 :
                                                            controller.listpoduct_classification.elementAt(index).id == 7 ?
                                                            controller.selectedValue7 :
                                                            controller.listpoduct_classification.elementAt(index).id == 8 ?
                                                            controller.selectedValue8 :
                                                            controller.listpoduct_classification.elementAt(index).id == 9 ?
                                                            controller.selectedValue9 :
                                                            controller.selectedValue10,
                                                            onChanged: (newValue) {
                                                              print(newValue);
                                                              if (controller.listpoduct_classification.elementAt(index).id == 1)
                                                                controller.onSelected(newValue!, 1);
                                                              else
                                                              if (controller.listpoduct_classification.elementAt(index).id == 2)
                                                                   controller.onSelected(newValue!, 2);
                                                              else
                                                              if (controller.listpoduct_classification.elementAt(index).id == 3)
                                                                controller.onSelected(newValue!, 3);
                                                              else
                                                              if (controller.listpoduct_classification.elementAt(
                                                                  index)
                                                                  .id == 4)
                                                                controller
                                                                    .onSelected(
                                                                    newValue!,
                                                                    4);
                                                              else
                                                              if (controller
                                                                  .listpoduct_classification
                                                                  .elementAt(
                                                                  index)
                                                                  .id == 5)
                                                                controller
                                                                    .onSelected(
                                                                    newValue!,
                                                                    5);
                                                              else
                                                              if (controller
                                                                  .listpoduct_classification
                                                                  .elementAt(
                                                                  index)
                                                                  .id == 6)
                                                                controller
                                                                    .onSelected(
                                                                    newValue!,
                                                                    6);
                                                              else
                                                              if (controller
                                                                  .listpoduct_classification
                                                                  .elementAt(
                                                                  index)
                                                                  .id == 7)
                                                                controller
                                                                    .onSelected(
                                                                    newValue!,
                                                                    7);
                                                              else
                                                              if (controller
                                                                  .listpoduct_classification
                                                                  .elementAt(
                                                                  index)
                                                                  .id == 8)
                                                                controller
                                                                    .onSelected(
                                                                    newValue!,
                                                                    8);
                                                              else
                                                              if (controller
                                                                  .listpoduct_classification
                                                                  .elementAt(
                                                                  index)
                                                                  .id == 9)
                                                                controller
                                                                    .onSelected(
                                                                    newValue!,
                                                                    9);
                                                              else
                                                              if (controller
                                                                  .listpoduct_classification
                                                                  .elementAt(
                                                                  index)
                                                                  .id == 10)
                                                                controller
                                                                    .onSelected(
                                                                    newValue!,
                                                                    10);
                                                            },
                                                            elevation: 10,
                                                            items: [


                                                              for (var data
                                                              in
                                                              controller.listpoduct_classification.elementAt(index).id == 1 ?
                                                              controller.list1_Secondary.value :
                                                              controller.listpoduct_classification.elementAt(index).id == 2 ?
                                                              controller.list2_Secondary :
                                                              controller.listpoduct_classification.elementAt(index).id == 3 ?
                                                              controller.list3_Secondary :
                                                              controller.listpoduct_classification.elementAt(index).id == 4 ?
                                                              controller.list4_Secondary :
                                                              controller.listpoduct_classification.elementAt(index).id == 5 ?
                                                              controller.list5_Secondary :
                                                              controller.listpoduct_classification.elementAt(index).id == 6 ?
                                                              controller.list6_Secondary :
                                                              controller.listpoduct_classification.elementAt(index).id == 7 ?
                                                              controller.list7_Secondary :
                                                              controller.listpoduct_classification.elementAt(index).id == 8 ?
                                                              controller.list8_Secondary :
                                                              controller.listpoduct_classification.elementAt(index).id == 9 ?
                                                              controller.list9_Secondary :
                                                              controller.list10_Secondary


                                                              )
                                                                DropdownMenuItem(
                                                                  child: Text(
                                                                    "${data
                                                                        .title}",
                                                                  ),
                                                                  value: "${data
                                                                      .title}",
                                                                )
                                                            ]));
                                                }),



                                          ),

                                          Expanded(
                                              flex: 5,
                                              child: ListView(children: [
//////////////////////////////////listpoduct_discount
                                                Container(

                                                    height: 298, child:
                                                ListView.builder(
                                                    scrollDirection:
                                                    Axis.horizontal,
                                                    itemCount: controller
                                                        .listpoduct_discount
                                                        .length,
                                                    itemBuilder: (context,
                                                        index) {
                                                      var item =
                                                          controller
                                                              .listpoduct_discount;
                                                      return

                                                        Column(children: [

                                                          index == 0 ?
                                                          Row(
                                                            children: [
                                                              InkWell(
                                                                child: Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                      right: 28,
                                                                      bottom: 10),
                                                                  child: Text(
                                                                    "عروض وحسومات",
                                                                    style: Themes
                                                                        .headline3,
                                                                  ),
                                                                ),
                                                                onTap: () {
                                                                  Get.to(
                                                                      Seggestions(
                                                                        title: "عروض وحسومات",
                                                                      ));
                                                                },
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets
                                                                    .only(
                                                                    right: 8,
                                                                    bottom: 8),
                                                                child: IconButton(
                                                                    onPressed: () {
                                                                      Get
                                                                          .to(
                                                                          Seggestions(
                                                                            title: "عروض وحسومات",
                                                                          ));
                                                                    },
                                                                    icon: Icon(
                                                                      Icons
                                                                          .arrow_forward,
                                                                      color: Colors
                                                                          .black,
                                                                      size: 25,
                                                                    )),
                                                              )
                                                            ],
                                                          ) :
                                                          Row(
                                                            children: [
                                                              InkWell(
                                                                child: Container(
                                                                    margin:
                                                                    EdgeInsets
                                                                        .only(

                                                                        right: 28,
                                                                        bottom: 40),
                                                                    child: Text(
                                                                        "    ")
                                                                ),

                                                              ),

                                                            ],
                                                          ),
                                                          Column(
                                                              children: [
                                                                SingleChildScrollView(
                                                                  scrollDirection:
                                                                  Axis
                                                                      .horizontal,
                                                                  child: Row(
                                                                      children: <
                                                                          Widget>[
                                                                        Column(
                                                                            children: [
                                                                              Column(
                                                                                children: [
                                                                                  Stack(children: [
                                                                                    Container(
                                                                                      margin: EdgeInsets.only(right: 10),
                                                                                      width: MediaQuery.of(context).size.width * 0.5, height: 180,
                                                                                      decoration:
                                                                                      BoxDecoration(

                                                                                        border: Border.all(color: Colors.grey, width: 1,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(25),
                                                                                      ),
                                                                                      child:

                                                                                      Image.network("http://192.168.137.102:8000/uploads/product/${item.elementAt(index).image}",
                                                                                        fit:BoxFit
                                                                                            .fill ,
                                                                                      ),

                                                                                    ),
                                                                                    Positioned(
                                                                                      left:10,
                                                                                      top:20,
                                                                                      // alignment :Alignment(-1.0, -1.0),// Alignment.topLeft,

                                                                                      child:
                                                                                      InkWell(

                                                                                        onTap: () async{
                                                                                          print(controller.listpoduct_discount.elementAt(index).id);
                                                                                          var data =
                                                                                              await   AuthServices.doo(
                                                                                              product_id: controller.listpoduct_discount.elementAt(index).id);
                                                                                          print("::::::::::::::::::::::::::::::::::::::::::::");
                                                                                          //print(data);
                                                                                          if(data=="add")
{
print("addd")    ;                                                                                      controller.changeCol(data,1,controller.listpoduct_discount.elementAt(index).id);
}


                                                                                          else
                                                                                            controller.changeCol(data,2,controller.listpoduct_discount.elementAt(index).id);


                                                                                          print("::::::::::::::::::::::::::::::::::::::::::::");

                                                                                        },
                                                                                        child: CircleAvatar(
                                                                                          backgroundColor: Themes.color2,
                                                                                          child: Icon(
                                                                                            Icons.favorite,
                                                                                            color:
                                                                                            controller.Col==2 ?
                                                                                            Colors.black:
                                                                                            Colors.red,
                                                                                          ),
                                                                                        ),
                                                                                      ),

                                                                                    )
                                                                                  ],),

                                                                                  Container(margin: EdgeInsets.only(right: 40), width: MediaQuery.of(context).size.width * 0.5,
                                                                                    child: Row(
                                                                                      children: [
                                                                                        Text(
                                                                                          "${controller
                                                                                              .listpoduct_discount
                                                                                              .elementAt(
                                                                                              index)
                                                                                              .name} ",
                                                                                          style:
                                                                                          Themes
                                                                                              .headline1,
                                                                                        ),
                                                                                        Icon(
                                                                                            Icons
                                                                                                .tag_faces_outlined,
                                                                                            color: Colors
                                                                                                .green),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Container(
                                                                                      margin: EdgeInsets
                                                                                          .only(
                                                                                          right:
                                                                                          40),
                                                                                      width: MediaQuery
                                                                                          .of(
                                                                                          context)
                                                                                          .size
                                                                                          .width *
                                                                                          0.5,
                                                                                      child:
                                                                                      Text(
                                                                                        "${controller
                                                                                            .listpoduct_discount
                                                                                            .elementAt(
                                                                                            index)
                                                                                            .costPrice} ",
                                                                                        style:
                                                                                        Themes
                                                                                            .subtitle2,
                                                                                      )),
                                                                                ],
                                                                              ),

                                                                            ]),
                                                                      ]),
                                                                ),
                                                              ]),

                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                        ]);
                                                    })
//////////////////////////////////////////////////////////////////////////////////////////
                                                ),
                                                Row(children: [
                                                  Container(
                                                      margin:
                                                      EdgeInsets.only(
                                                          right: 150,
                                                          top: 25,
                                                          bottom: 10),
                                                      child: TextButton(
                                                        child: Text(
                                                          "عرض المزيد",
                                                          style: Themes
                                                              .bodyText3,
                                                        ),
                                                        onPressed: () {
                                                          Get.to(
                                                              Seggestions(
                                                                  title: "عروض وحسومات"));
                                                        },
                                                      ))
                                                ]),

//////////////////////////////////listpoduct_favorite
                                                Container(

                                                    height: 298, child:
                                                ListView.builder(
                                                    scrollDirection:
                                                    Axis.horizontal,
                                                    itemCount: controller
                                                        .listpoduct_favorite
                                                        .length,
                                                    itemBuilder: (context,
                                                        index) {
                                                      var item =
                                                          controller
                                                              .listpoduct_favorite;
                                                      return

                                                        Column(children: [

                                                          index == 0 ? Row(
                                                            children: [
                                                              InkWell(
                                                                child: Container(
                                                                  margin:
                                                                  EdgeInsets
                                                                      .only(
                                                                      right: 28,
                                                                      bottom: 10),
                                                                  child: Text(
                                                                    "اقتراحات قد تعجبك",
                                                                    style: Themes
                                                                        .headline3,
                                                                  ),
                                                                ),
                                                                onTap: () {
                                                                  Get.to(
                                                                      Seggestions(
                                                                        title:
                                                                        "اقتراحات قد تعجبك",
                                                                      ));
                                                                },
                                                              ),
                                                              Padding(
                                                                padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    right: 8,
                                                                    bottom: 8),
                                                                child: IconButton(
                                                                    onPressed: () {
                                                                      Get
                                                                          .to(
                                                                          Seggestions(
                                                                            title:
                                                                            "اقتراحات قد تعجبك ",
                                                                          ));
                                                                    },
                                                                    icon: Icon(
                                                                      Icons
                                                                          .arrow_forward,
                                                                      color: Colors
                                                                          .black,
                                                                      size: 25,
                                                                    )),
                                                              )
                                                            ],
                                                          ) : Row(
                                                            children: [
                                                              InkWell(
                                                                child: Container(
                                                                    margin:
                                                                    EdgeInsets
                                                                        .only(

                                                                        right: 28,
                                                                        bottom: 40),
                                                                    child: Text(
                                                                        "  mjjjjjjjj  ")
                                                                ),

                                                              ),

                                                            ],
                                                          ),
                                                          Column(
                                                              children: [
                                                                SingleChildScrollView(
                                                                  scrollDirection:
                                                                  Axis
                                                                      .horizontal,
                                                                  child: Row(
                                                                      children: <
                                                                          Widget>[
                                                                        Column(
                                                                            children: [
                                                                              Column(
                                                                                children: [
                                                                                  Stack(children: [  Container(
                                                                                    margin: EdgeInsets
                                                                                        .only(
                                                                                        right:
                                                                                        10),
                                                                                    width: MediaQuery
                                                                                        .of(
                                                                                        context)
                                                                                        .size
                                                                                        .width *
                                                                                        0.5,
                                                                                    height:
                                                                                    180,
                                                                                    decoration:
                                                                                    BoxDecoration(

                                                                                      border:
                                                                                      Border
                                                                                          .all(
                                                                                        color:
                                                                                        Colors
                                                                                            .grey,
                                                                                        width:
                                                                                        1,
                                                                                      ),
                                                                                      borderRadius:
                                                                                      BorderRadius
                                                                                          .circular(
                                                                                          25),
                                                                                    ),
                                                                                    child: Image
                                                                                        .network(
                                                                                      "http://192.168.137.102:8000/uploads/product/${item
                                                                                          .elementAt(
                                                                                          index)
                                                                                          .image}",
                                                                                      fit:BoxFit
                                                                                          .fill ,
                                                                                    ),

                                                                                  ),
                                                                                    Positioned(
                                                                                      left:10,
                                                                                      top:20,

                                                                                      child:
                                                                                      InkWell(

                                                                                        onTap: () {},
                                                                                        child: CircleAvatar(
                                                                                          backgroundColor: Themes.color2,
                                                                                          child: Icon(
                                                                                            Icons.favorite,
                                                                                            color: Colors.red,
                                                                                          ),
                                                                                        ),
                                                                                      ),

                                                                                    ),],),

                                                                                  Container(
                                                                                    margin: EdgeInsets
                                                                                        .only(
                                                                                        right:
                                                                                        40),
                                                                                    width: MediaQuery
                                                                                        .of(
                                                                                        context)
                                                                                        .size
                                                                                        .width *
                                                                                        0.5,
                                                                                    child:
                                                                                    Row(
                                                                                      children: [
                                                                                        Text(
                                                                                          "${controller
                                                                                              .listpoduct_favorite
                                                                                              .elementAt(
                                                                                              index)
                                                                                              .name} ",
                                                                                          style:
                                                                                          Themes
                                                                                              .headline1,
                                                                                        ),
                                                                                        Icon(
                                                                                            Icons
                                                                                                .tag_faces_outlined,
                                                                                            color: Colors
                                                                                                .green),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Container(
                                                                                      margin: EdgeInsets
                                                                                          .only(
                                                                                          right:
                                                                                          40),
                                                                                      width: MediaQuery
                                                                                          .of(
                                                                                          context)
                                                                                          .size
                                                                                          .width *
                                                                                          0.5,
                                                                                      child:
                                                                                      Text(
                                                                                        "${controller
                                                                                            .listpoduct_favorite
                                                                                            .elementAt(
                                                                                            index)
                                                                                            .costPrice} ",
                                                                                        style:
                                                                                        Themes
                                                                                            .subtitle2,
                                                                                      )),
                                                                                ],
                                                                              ),

                                                                            ]),
                                                                      ]),
                                                                ),
                                                              ]),

                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                        ]);
                                                    })

                                                ),
                                                Row(children: [
                                                  Container(
                                                      margin:
                                                      EdgeInsets.only(
                                                          right: 150,
                                                          top: 25,
                                                          bottom: 10),
                                                      child: TextButton(
                                                        child: Text(
                                                          "عرض المزيد",
                                                          style: Themes
                                                              .bodyText3,
                                                        ),
                                                        onPressed: () {
                                                          Get.to(
                                                              Seggestions(
                                                                title: "اقتراحات قد تعجبك",
                                                              ));
                                                        },
                                                      ))
                                                ]),

//////////////////////////////////listpoduct_sales
                                                Container(

                                                    height: 298, child:
                                                ListView.builder(
                                                    scrollDirection:
                                                    Axis.horizontal,
                                                    itemCount: controller
                                                        .listpoduct_sales
                                                        .length,
                                                    itemBuilder: (context,
                                                        index) {
                                                      var item =
                                                          controller
                                                              .listpoduct_sales;
                                                      return

                                                        Column(children: [

                                                          index == 0 ?
                                                          Row(
                                                            children: [
                                                              InkWell(
                                                                child: Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                     right: 10,
                                                                      bottom: 10),
                                                                  child: Text(
                                                                    " الأكثر شيوعا  ",
                                                                    style: Themes
                                                                        .headline3,
                                                                  ),
                                                                ),
                                                                onTap: () {
                                                                  Get.to(
                                                                      Seggestions(
                                                                        title: "الأكثر شيوعاً",
                                                                      ));
                                                                },
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets
                                                                    .only(
                                                                    right: 40,
                                                                    bottom: 8),
                                                                child: IconButton(
                                                                    onPressed: () {
                                                                      Get
                                                                          .to(
                                                                          Seggestions(
                                                                            title: "الأكثر شيوعاً",
                                                                          ));
                                                                    },
                                                                    icon: Icon(
                                                                      Icons
                                                                          .arrow_forward,
                                                                      color: Colors
                                                                          .black,
                                                                      size: 20,
                                                                    )),
                                                              )
                                                            ],
                                                          ) :
                                                          Row(
                                                            children: [
                                                              InkWell(
                                                                child: Container(
                                                                    margin:
                                                                    EdgeInsets
                                                                        .only(

                                                                        right: 30,
                                                                        bottom: 40),
                                                                    child: Text(
                                                                        "    ")
                                                                ),

                                                              ),

                                                            ],
                                                          ),
                                                          Column(
                                                              children: [
                                                                SingleChildScrollView(
                                                                  scrollDirection:
                                                                  Axis
                                                                      .horizontal,
                                                                  child: Row(
                                                                      children: <
                                                                          Widget>[
                                                                        Column(
                                                                            children: [
                                                                              Column(
                                                                                children: [
                                                                                  Stack(children: [Container(
                                                                                    margin: EdgeInsets
                                                                                        .only(
                                                                                        right:
                                                                                        10),
                                                                                    width: MediaQuery
                                                                                        .of(
                                                                                        context)
                                                                                        .size
                                                                                        .width *
                                                                                        0.5,
                                                                                    height:
                                                                                    180,
                                                                                    decoration:
                                                                                    BoxDecoration(

                                                                                      border:
                                                                                      Border
                                                                                          .all(
                                                                                        color:
                                                                                        Colors
                                                                                            .grey,
                                                                                        width:
                                                                                        1,
                                                                                      ),
                                                                                      borderRadius:
                                                                                      BorderRadius
                                                                                          .circular(
                                                                                          25),
                                                                                    ),
                                                                                    child: Image
                                                                                        .network(
                                                                                      "http://192.168.137.102:8000/uploads/product/${item
                                                                                          .elementAt(
                                                                                          index)
                                                                                          .image}",
                                                                                      fit:BoxFit
                                                                                          .fill ,
                                                                                    ),

                                                                                  ),
                                                                                    Positioned(
                                                                                      left:10,
                                                                                      top:20,
                                                                                      // alignment :Alignment(-1.0, -1.0),// Alignment.topLeft,

                                                                                      child:
                                                                                      InkWell(

                                                                                        onTap: () {},
                                                                                        child: CircleAvatar(
                                                                                          backgroundColor: Themes.color2,
                                                                                          child: Icon(
                                                                                            Icons.favorite,
                                                                                            color: Colors.red,
                                                                                          ),
                                                                                        ),
                                                                                      ),

                                                                                    ),],),
                                                                                  Container(
                                                                                    margin: EdgeInsets
                                                                                        .only(
                                                                                        right:
                                                                                        40),
                                                                                    width: MediaQuery
                                                                                        .of(
                                                                                        context)
                                                                                        .size
                                                                                        .width *
                                                                                        0.5,
                                                                                    child:
                                                                                    Row(
                                                                                      children: [
                                                                                        Text(
                                                                                          "${controller
                                                                                              .listpoduct_sales
                                                                                              .elementAt(
                                                                                              index)
                                                                                              .name} ",
                                                                                          style:
                                                                                          Themes
                                                                                              .headline1,
                                                                                        ),
                                                                                        Icon(
                                                                                            Icons
                                                                                                .tag_faces_outlined,
                                                                                            color: Colors
                                                                                                .green),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Container(
                                                                                      margin: EdgeInsets
                                                                                          .only(
                                                                                          right:
                                                                                          40),
                                                                                      width: MediaQuery
                                                                                          .of(
                                                                                          context)
                                                                                          .size
                                                                                          .width *
                                                                                          0.5,
                                                                                      child:
                                                                                      Text(
                                                                                        "${controller
                                                                                            .listpoduct_sales
                                                                                            .elementAt(
                                                                                            index)
                                                                                            .costPrice} ",
                                                                                        style:
                                                                                        Themes
                                                                                            .subtitle2,
                                                                                      )),
                                                                                ],
                                                                              ),

                                                                            ]),
                                                                      ]),
                                                                ),
                                                              ]),

                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                        ]);
                                                    })

                                                ),
                                                Row(children: [
                                                  Container(
                                                      margin:
                                                      EdgeInsets.only(
                                                          right: 150,
                                                          top: 25,
                                                          bottom: 10),
                                                      child: TextButton(
                                                        child: Text(
                                                          "عرض المزيد",
                                                          style: Themes
                                                              .bodyText3,
                                                        ),
                                                        onPressed: () {
                                                          Get.to(
                                                              Seggestions(
                                                                title: "الأكثر شيوعاً",
                                                              ));
                                                        },
                                                      ))
                                                ]),
//////////////////////////////////listpoduct_salary
                                                Container(

                                                    height: 298, child:
                                                ListView.builder(
                                                    scrollDirection:
                                                    Axis.horizontal,
                                                    itemCount: controller
                                                        .listpoduct_salary
                                                        .length,
                                                    itemBuilder: (context,
                                                        index) {
                                                      var item =
                                                          controller
                                                              .listpoduct_salary;
                                                      return

                                                        Column(children: [

                                                          index == 0 ?
                                                          Row(
                                                            children: [
                                                              InkWell(
                                                                child: Container(
                                                                  margin:
                                                                  EdgeInsets
                                                                      .only(
                                                                      right: 22,
                                                                      bottom: 10),
                                                                  child: Text(
                                                                    "الأقل سعرا",
                                                                    style: Themes
                                                                        .headline3,
                                                                  ),
                                                                ),
                                                                onTap: () {
                                                                  Get.to(
                                                                      Seggestions(
                                                                        title:
                                                                        "الأقل سعراً",
                                                                      ));
                                                                },
                                                              ),
                                                              Padding(
                                                                padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    right: 30,
                                                                    bottom: 8),
                                                                child: IconButton(
                                                                    onPressed: () {
                                                                      Get
                                                                          .to(
                                                                          Seggestions(
                                                                            title:
                                                                            "الأقل سعراً",
                                                                          ));
                                                                    },
                                                                    icon: Icon(
                                                                      Icons
                                                                          .arrow_forward,
                                                                      color: Colors
                                                                          .black,
                                                                      size: 25,
                                                                    )),
                                                              )
                                                            ],
                                                          ) :
                                                          Row(
                                                            children: [
                                                              InkWell(
                                                                child: Container(
                                                                    margin:
                                                                    EdgeInsets
                                                                        .only(

                                                                        right: 28,
                                                                        bottom: 40),
                                                                    child: Text(
                                                                        "    ")
                                                                ),

                                                              ),

                                                            ],
                                                          ),
                                                          Column(
                                                              children: [
                                                                SingleChildScrollView(
                                                                  scrollDirection:
                                                                  Axis
                                                                      .horizontal,
                                                                  child: Row(
                                                                      children: <
                                                                          Widget>[
                                                                        Column(
                                                                            children: [
                                                                              Column(
                                                                                children: [
                                                                                  Stack(children: [  Container(
                                                                                    margin: EdgeInsets
                                                                                        .only(
                                                                                        right:
                                                                                        10),
                                                                                    width: MediaQuery
                                                                                        .of(
                                                                                        context)
                                                                                        .size
                                                                                        .width *
                                                                                        0.5,
                                                                                    height:
                                                                                    180,
                                                                                    decoration:
                                                                                    BoxDecoration(

                                                                                      border:
                                                                                      Border
                                                                                          .all(
                                                                                        color:
                                                                                        Colors
                                                                                            .grey,
                                                                                        width:
                                                                                        1,
                                                                                      ),
                                                                                      borderRadius:
                                                                                      BorderRadius
                                                                                          .circular(
                                                                                          25),
                                                                                    ),
                                                                                    child: Image
                                                                                        .network(
                                                                                      "http://192.168.137.102:8000/uploads/product/${item.elementAt(index).image}",
                                                                                      fit:BoxFit
                                                                                          .fill ,
                                                                                    ),

                                                                                  ),
                                                                                    Positioned(
                                                                                      left:10,
                                                                                      top:20,
                                                                                      // alignment :Alignment(-1.0, -1.0),// Alignment.topLeft,

                                                                                      child:
                                                                                      InkWell(

                                                                                        onTap: () {
                                                                                          // c.flist.add(item.elementAt(index).id)  ;
                                                                                          // c.changeCol(1, item.elementAt(index).id);

                                                                                        },
                                                                                        child: CircleAvatar(
                                                                                          backgroundColor: Themes.color2,
                                                                                          child: Icon(
                                                                                            Icons.favorite,
                                                                                            color: Colors.black,
                                                                                          ),
                                                                                        ),
                                                                                      ),

                                                                                    ),],),
                                                                                  Container(
                                                                                    margin: EdgeInsets
                                                                                        .only(
                                                                                        right:
                                                                                        40),
                                                                                    width: MediaQuery
                                                                                        .of(
                                                                                        context)
                                                                                        .size
                                                                                        .width *
                                                                                        0.5,
                                                                                    child:
                                                                                    Row(
                                                                                      children: [
                                                                                        Text(
                                                                                          "${controller
                                                                                              .listpoduct_salary
                                                                                              .elementAt(
                                                                                              index)
                                                                                              .name} ",
                                                                                          style:
                                                                                          Themes
                                                                                              .headline1,
                                                                                        ),
                                                                                        Icon(
                                                                                            Icons
                                                                                                .tag_faces_outlined,
                                                                                            color: Colors
                                                                                                .green),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Container(
                                                                                      margin: EdgeInsets
                                                                                          .only(
                                                                                          right:
                                                                                          40),
                                                                                      width: MediaQuery
                                                                                          .of(
                                                                                          context)
                                                                                          .size
                                                                                          .width *
                                                                                          0.5,
                                                                                      child:
                                                                                      Text(
                                                                                        "${controller
                                                                                            .listpoduct_salary
                                                                                            .elementAt(
                                                                                            index)
                                                                                            .costPrice} ",
                                                                                        style:
                                                                                        Themes
                                                                                            .subtitle2,
                                                                                      )),
                                                                                ],
                                                                              ),

                                                                            ]),
                                                                      ]),
                                                                ),
                                                              ]),

                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                        ]);
                                                    })

                                                ),
                                                Row(children: [
                                                  Container(
                                                      margin:
                                                      EdgeInsets.only(
                                                          right: 150,
                                                          top: 1,
                                                          bottom: 1),
                                                      child: TextButton(
                                                        child: Text(
                                                          "عرض المزيد",
                                                          style: Themes
                                                              .bodyText3,
                                                        ),
                                                        onPressed: () {
                                                          Get.to(
                                                              Seggestions(
                                                                title:
                                                                "الأقل سعراً",
                                                              ));
                                                        },
                                                      ))
                                                ]),


                                              ],)),


                                            ]);
                                        })))))),
      ),
    );
  }
}
