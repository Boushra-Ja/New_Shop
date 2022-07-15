import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_shop/logic/controllers/AppBarController.dart';
import 'package:new_shop/logic/controllers/DrawerController/SettingPageController.dart';
import 'package:new_shop/logic/controllers/ProductController.dart';
import 'package:new_shop/view/ProductDeatil.dart';
import '../logic/controllers/CartController.dart';
import '../models/batool/FavoriteProduct2Model.dart';
import '../services/auth_services.dart';
import '../utls/Themes.dart';
import 'ConstantPages/AppBar.dart';
import 'ConstantPages/Drawer.dart';
import 'Seggestions.dart';

class Product extends GetView<ProductController> {
  final sampleController1 = Get.put(AppBarController(), permanent: true);
  final sampleController2 = Get.put(ProductController(),permanent: true);
  final sampleController3 = Get.put(SettingPageController(),permanent: true);
  final sampleController4= Get.put(CartController(),permanent: true);

  String api = "http://192.168.1.104:8000/" ;
  @override
  Widget build(BuildContext context) {
    Get.put(ProductController( ));
    controller.onInit();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.rtl,
        child:  GetX<SettingPageController>(
            builder: (c) =>  Scaffold(

              backgroundColor: sampleController3.col==0?
              Colors.white:
              Colors.black,
              key: sampleController1.getscaffoldKey2(),
              drawer: myDrawer(),
              endDrawerEnableOpenDragGesture: true,
              body:
              GetX<ProductController>(
                  builder: (c) =>  Center(
                      child:
                      c.listpoduct_classification.isEmpty && c.listpoduct_sales.isEmpty && c.listpoduct_salary.isEmpty
                          ? Center(child: CircularProgressIndicator())
                          : GetX<ProductController>(
                          builder: (c) =>
                              Center(
                                  child:  c.listpoduct_classification.isEmpty && c.listpoduct_sales.isEmpty && c.listpoduct_salary.isEmpty
                                      ? CircularProgressIndicator()
                                      : GetBuilder<ProductController>(
                                      builder: (controller) {
                                        return
                                          Column(children: <Widget>[
                                            myAppBar(),
                                            SizedBox(height: 20,),
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
                                                          padding: EdgeInsets.only(right:10,left: 20,bottom: 1),
                                                          margin: EdgeInsets.only(top:10,bottom: 50,left: 10,right: 5),
                                                          child:  DecoratedBox(
                                                              decoration: BoxDecoration(
                                                                  color:Colors.white, //background color of dropdown button
                                                                  border: Border.all(
                                                                    color: sampleController3.col==0?
                                                                    Themes.color:
                                                                    Colors.white,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius: BorderRadius.circular(20), //border raiuds of dropdown button
                                                                  boxShadow: <BoxShadow>[ //apply shadow on Dropdown button
                                                                    BoxShadow(
                                                                        color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                                                                        blurRadius: 5) //blur radius of shadow
                                                                  ]),

                                                              child:Padding(
                                                                  padding: EdgeInsets.only(left:30, right:30),
                                                                  child:

                                                                  DropdownButton<String>(

                                                                      borderRadius:BorderRadius.circular(20),
                                                                      isExpanded: false,

                                                                      style: Themes.subtitle1,
                                                                      alignment: Alignment.center,
                                                                      dropdownColor: sampleController3.col==0?
                                                                      Colors.grey:
                                                                      Colors.white,
                                                                      hint: Text(

                                                                        "${controller.listpoduct_classification.elementAt(index).title}",
                                                                        style: TextStyle(color: sampleController3.col==0?Colors.black:Colors.black,fontWeight: FontWeight.bold),),
                                                                      value:
                                                                      controller.listpoduct_classification.elementAt(index).id == 1 ? controller.selectedValue1 : controller.listpoduct_classification.elementAt(index).id == 2 ?
                                                                      controller.selectedValue2 : controller.listpoduct_classification.elementAt(index).id == 3 ?
                                                                      controller.selectedValue3 : controller.listpoduct_classification.elementAt(index).id == 4 ?
                                                                      controller.selectedValue4 : controller.listpoduct_classification.elementAt(index).id == 5 ?
                                                                      controller.selectedValue5 : controller.listpoduct_classification.elementAt(index).id == 6 ?
                                                                      controller.selectedValue6 : controller.listpoduct_classification.elementAt(index).id == 7 ?
                                                                      controller.selectedValue7 : controller.listpoduct_classification.elementAt(index).id == 8 ?
                                                                      controller.selectedValue8 : controller.listpoduct_classification.elementAt(index).id == 9 ?
                                                                      controller.selectedValue9 : controller.selectedValue10,
                                                                      onChanged: (newValue) {
                                                                        print(newValue);
                                                                        controller.call_drops(1, newValue);
                                                                        controller.call_drops(2, newValue);
                                                                        controller.call_drop(3, newValue);
                                                                        controller.call_drop(4, newValue);

                                                                        if (controller.listpoduct_classification.elementAt(index).id == 1)
                                                                          controller.onSelected(newValue!, 1);
                                                                        else if (controller.listpoduct_classification.elementAt(index).id == 2)
                                                                          controller.onSelected(newValue!, 2);
                                                                        else if (controller.listpoduct_classification.elementAt(index).id == 3)
                                                                          controller.onSelected(newValue!, 3);
                                                                        else if (controller.listpoduct_classification.elementAt(index).id == 4)
                                                                          controller.onSelected(newValue!, 4);
                                                                        else if (controller.listpoduct_classification.elementAt(index).id == 5)
                                                                          controller.onSelected(newValue!, 5);
                                                                        else if (controller.listpoduct_classification.elementAt(index).id == 6)
                                                                          controller.onSelected(newValue!, 6);
                                                                        else if (controller.listpoduct_classification.elementAt(index).id == 7)
                                                                          controller.onSelected(newValue!, 7);
                                                                        else if (controller.listpoduct_classification.elementAt(index).id == 8)
                                                                          controller.onSelected(newValue!, 8);
                                                                        else if (controller.listpoduct_classification.elementAt(index).id == 9)
                                                                          controller.onSelected(newValue!, 9);
                                                                        else if (controller.listpoduct_classification.elementAt(index).id == 10)
                                                                          controller.onSelected(newValue!, 10);
                                                                      },
                                                                      elevation: 10,
                                                                      items: [


                                                                        for (var data in
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
                                                                            child: Text("${data.title}",),
                                                                            value: "${data.title}",)
                                                                      ]
                                                                  )))
                                                      );

                                                  }
                                              ),
                                            ),
                                            Expanded(
                                                flex: 5,
                                                child:
                                                ListView(children: [
//////////////////////////////////listpoduct_discount
                                                  c.listpoduct_discount.isEmpty   ? Text('') :
                                                  Column(

                                                    children: [

                                                      Container(

                                                          height: 298, child:
                                                      ListView.builder(
                                                          scrollDirection: Axis.horizontal,
                                                          itemCount: controller.listpoduct_discount.length,
                                                          itemBuilder: (context, index) {
                                                            var item = controller.listpoduct_discount;
                                                            return

                                                              Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [

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
                                                                                style:
                                                                                TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color:
                                                                                sampleController3.col==1?Colors.white:Colors.black,)
                                                                            ),
                                                                          ),
                                                                          onTap: () {
                                                                            Get.to(
                                                                                Seggestions(
                                                                                  title: "عروض وحسومات",products: [],
                                                                                ));
                                                                          },
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.only(right: 8, bottom: 8),
                                                                          child: IconButton(
                                                                              onPressed: () {Get.to(
                                                                                  Seggestions(title: "عروض وحسومات",products: [],));
                                                                              },
                                                                              icon: Icon(
                                                                                Icons.arrow_forward,
                                                                                color: sampleController3.col==1?Colors.white:
                                                                                Colors.black,
                                                                                size: 25,
                                                                              )),
                                                                        )
                                                                      ],
                                                                    ) :
                                                                    Row(
                                                                      children: [
                                                                        InkWell(child:
                                                                        Container(
                                                                            margin: EdgeInsets.only(right: 28, bottom: 40),
                                                                            child: Text("    ")
                                                                        ),
                                                                        ),

                                                                      ],
                                                                    ),
                                                                    Column(
                                                                        children: [
                                                                          SingleChildScrollView(
                                                                            scrollDirection: Axis.horizontal,
                                                                            child: Row(
                                                                                children: <
                                                                                    Widget>[
                                                                                  Column(
                                                                                      children: [
                                                                                        Column(
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Stack(children: [
                                                                                              InkWell(
                                                                                                onTap:(){
                                                                                                  Get.to(ProductDeatil(controller.listpoduct_discount.elementAt(index).id));
                                                                                                },
                                                                                                child: Container(
                                                                                                  margin: EdgeInsets.only(right: 10),
                                                                                                  width: MediaQuery.of(context).size.width * 0.6,
                                                                                                  height: 180,
                                                                                                  child: ClipRRect(
                                                                                                    borderRadius: BorderRadius.circular(20),
                                                                                                    child:
                                                                                                    Image.network("${api}uploads/product/${item.elementAt(index).image}",
                                                                                                      fit: BoxFit.cover,
                                                                                                    ),),

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
                                                                                                    await AuthServices.doo(
                                                                                                        product_id: controller.listpoduct_discount.elementAt(index).id);
                                                                                                    if(data=="add")
                                                                                                    {

                                                                                                      print("************************before add*************************************");
                                                                                                      print(controller.listpoduct_f.length);

                                                                                                      Favorite_product2 g= new Favorite_product2(product_id: controller.listpoduct_discount.elementAt(index).id, id: 9);
                                                                                                      controller.listpoduct_f.add(g);

                                                                                                      print(controller.listpoduct_f.length);
                                                                                                      print("************************after add*************************************");



                                                                                                      print(controller.listpoduct_discount.elementAt(index).isfavorite);
                                                                                                      print("::::::::::::::::::::::::if::::::::::::::::::::");
                                                                                                      controller.listpoduct_discount.elementAt(index).isfavorite = true;
                                                                                                      print(controller.listpoduct_discount.elementAt(index).isfavorite);
                                                                                                      controller.changeCol(data,1,controller.listpoduct_discount.elementAt(index).id);}

                                                                                                    else{

                                                                                                      controller.listpoduct_discount.elementAt(index).isfavorite = false;




                                                                                                      print("************************before remove*************************************");
                                                                                                      print(controller.listpoduct_f.length);


                                                                                                      for(int i=0;i<controller.listpoduct_f.length;i++){
                                                                                                        if(controller.listpoduct_discount.elementAt(index).id==controller.listpoduct_f.elementAt(i).product_id)
                                                                                                          controller.listpoduct_f.removeAt(i);

                                                                                                      }

                                                                                                      print(controller.listpoduct_f.length);
                                                                                                      print("************************after remove*************************************");


                                                                                                      controller.changeCol(data,2,controller.listpoduct_discount.elementAt(index).id);
                                                                                                    }



                                                                                                  },
                                                                                                  child: CircleAvatar(
                                                                                                    backgroundColor: Themes.color2,
                                                                                                    child: Icon(
                                                                                                      Icons.favorite,
                                                                                                      color:
                                                                                                      controller.check( controller.listpoduct_discount.elementAt(index).id)
                                                                                                          ? Colors.red:Colors.black,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),

                                                                                              )
                                                                                            ],),



                                                                                            Row(children:[
                                                                                              Container(

                                                                                                margin: EdgeInsets.only(right: 20),
                                                                                                child:
                                                                                                Row(
                                                                                                  children: [
                                                                                                    Text(
                                                                                                        "${controller.listpoduct_discount.elementAt(index).name} ",
                                                                                                        style: TextStyle( color: controller.col==1?Colors.white: Colors.black,fontWeight: FontWeight.normal,fontSize: 16)
                                                                                                    ),
                                                                                                    SizedBox(width: 5,),
                                                                                                    Icon(
                                                                                                      controller.listpoduct_discount[index].rating==0?
                                                                                                      Icons.tag_faces_outlined:
                                                                                                      Icons.tag_faces_outlined,
                                                                                                      color: sampleController3.col==1?Colors.white: Colors.green, ),
                                                                                                    Container(
                                                                                                        margin: EdgeInsets.only(
                                                                                                          right: MediaQuery.of(context).size.width * 0.2,),
                                                                                                        child: Text(
                                                                                                            "${controller.listpoduct_discount.elementAt(index).costPrice}" +" ل.س ",
                                                                                                            style: TextStyle( color: sampleController3.col==1?Colors.white: Colors.red,)
                                                                                                        )),
                                                                                                  ],
                                                                                                ),),
                                                                                            ]),
                                                                                          ],),

                                                                                      ]),
                                                                                  SizedBox(
                                                                                    width: 25,
                                                                                  ),
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
                                                                  style:
                                                                  TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color:
                                                                  sampleController3.col==1?Colors.white:Colors.black,)

                                                              ),
                                                              onPressed: () {
                                                                Get.to(
                                                                    Seggestions(
                                                                        title: "عروض وحسومات",products: [],));
                                                              },
                                                            ))
                                                      ]),],),

//////////////////////////////////listpoduct_favorite
                                                  c.listpoduct_favorite.isEmpty   ? Text('') :
                                                  Column(children: [
                                                    Container(

                                                        height: 298, child:
                                                    ListView.builder(
                                                        scrollDirection: Axis.horizontal,
                                                        itemCount: controller.listpoduct_favorite.length,
                                                        itemBuilder: (context, index) {
                                                          var item = controller.listpoduct_favorite;
                                                          return

                                                            Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [

                                                                  index == 0 ?
                                                                  Row(
                                                                    children: [
                                                                      InkWell(child: Container(
                                                                        margin: EdgeInsets.only(right: 28, bottom: 10),
                                                                        child: Text("اقتراحات قد تعجبك",
                                                                            style:   TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color:
                                                                            sampleController3.col==1?Colors.white:Colors.black,)

                                                                        ),
                                                                      ),
                                                                        onTap: () {
                                                                          Get.to(Seggestions(title: "اقتراحات قد تعجبك",products: [],));
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
                                                                                    "اقتراحات قد تعجبك ",products: [],
                                                                                  ));
                                                                            },
                                                                            icon: Icon(
                                                                              Icons
                                                                                  .arrow_forward, color:
                                                                            sampleController3.col==1?Colors.white:
                                                                            Colors
                                                                                .black,
                                                                              size: 25,
                                                                            )),
                                                                      )
                                                                    ],
                                                                  ) :
                                                                  Row(
                                                                    children: [InkWell(
                                                                      child: Container(
                                                                          margin: EdgeInsets.only(right: 28, bottom: 40),
                                                                          child: Text(
                                                                              " ")
                                                                      ),

                                                                    ),

                                                                    ],
                                                                  ),
                                                                  Column(
                                                                      children: [
                                                                        SingleChildScrollView(
                                                                          scrollDirection: Axis.horizontal,
                                                                          child: Row(
                                                                              children: <Widget>[
                                                                                Column(
                                                                                    children: [
                                                                                      Column(
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Stack(children: [  InkWell(
                                                                                            onTap:(){
                                                                                              Get.to(ProductDeatil(controller.listpoduct_favorite.elementAt(index).id));

                                                                                            } ,
                                                                                            child: Container(
                                                                                              margin: EdgeInsets.only(right: 10),
                                                                                              width: MediaQuery.of(context).size.width * 0.6,
                                                                                              height: 180,
                                                                                              child: ClipRRect(
                                                                                                  borderRadius: BorderRadius.circular(20),
                                                                                                  child: Image
                                                                                                      .network(
                                                                                                    "${api}uploads/product/${item.elementAt(index).image}",
                                                                                                    fit:BoxFit.cover ,
                                                                                                  )),

                                                                                            ),
                                                                                          ),
                                                                                            Positioned(
                                                                                              left:10,
                                                                                              top:20,

                                                                                              child:
                                                                                              InkWell(
                                                                                                onTap: () async{
                                                                                                  print(controller.listpoduct_favorite.elementAt(index).id);
                                                                                                  var data =
                                                                                                  await AuthServices.doo(
                                                                                                      product_id: controller.listpoduct_favorite.elementAt(index).id);  if(data=="add")
                                                                                                  {

                                                                                                    print("************************before add*************************************");
                                                                                                    print(controller.listpoduct_f.length);

                                                                                                    Favorite_product2 g= new Favorite_product2(product_id: controller.listpoduct_favorite.elementAt(index).id, id: 9);
                                                                                                    controller.listpoduct_f.add(g);

                                                                                                    print(controller.listpoduct_f.length);
                                                                                                    print("************************after add*************************************");



                                                                                                    print(controller.listpoduct_favorite.elementAt(index).isfavorite);
                                                                                                    print("::::::::::::::::::::::::if::::::::::::::::::::");
                                                                                                    controller.listpoduct_favorite.elementAt(index).isfavorite = true;
                                                                                                    print(controller.listpoduct_favorite.elementAt(index).isfavorite);
                                                                                                    controller.changeCol(data,1,controller.listpoduct_favorite.elementAt(index).id);}

                                                                                                  else{

                                                                                                    controller.listpoduct_favorite.elementAt(index).isfavorite = false;




                                                                                                    print("************************before remove*************************************");
                                                                                                    print(controller.listpoduct_f.length);


                                                                                                    for(int i=0;i<controller.listpoduct_f.length;i++){
                                                                                                      if(controller.listpoduct_favorite.elementAt(index).id==controller.listpoduct_f.elementAt(i).product_id)
                                                                                                        controller.listpoduct_f.removeAt(i);

                                                                                                    }

                                                                                                    print(controller.listpoduct_f.length);
                                                                                                    print("************************after remove*************************************");


                                                                                                    controller.changeCol(data,2,controller.listpoduct_favorite.elementAt(index).id);
                                                                                                  }



                                                                                                },
                                                                                                child: CircleAvatar(
                                                                                                  backgroundColor: Themes.color2,
                                                                                                  child: Icon(
                                                                                                    Icons.favorite,
                                                                                                    color:
                                                                                                    controller.check( controller.listpoduct_favorite.elementAt(index).id)
                                                                                                        ? Colors.red:
                                                                                                    Colors.black,
                                                                                                  ),
                                                                                                ),
                                                                                              ),

                                                                                            ),],),

                                                                                          Row(children:[
                                                                                            Container(

                                                                                              margin: EdgeInsets.only(right: 20),
                                                                                              child:
                                                                                              Row(
                                                                                                children: [
                                                                                                  Text(
                                                                                                      "${controller.listpoduct_favorite.elementAt(index).name} ",
                                                                                                      style: TextStyle( color: controller.col==1?Colors.white: Colors.black,fontWeight: FontWeight.normal,fontSize: 16)
                                                                                                  ),
                                                                                                  SizedBox(width: 5,),
                                                                                                  Icon(
                                                                                                    Icons.tag_faces_outlined,
                                                                                                    color: sampleController3.col==1?Colors.white: Colors.green, ),
                                                                                                  Container(
                                                                                                      margin: EdgeInsets.only(
                                                                                                        right: MediaQuery.of(context).size.width * 0.2,),
                                                                                                      child: Text(
                                                                                                          "${controller.listpoduct_favorite.elementAt(index).costPrice}" +" ل.س ",
                                                                                                          style: TextStyle( color: sampleController3.col==1?Colors.white: Colors.red,)
                                                                                                      )),
                                                                                                ],
                                                                                              ),),
                                                                                          ]),
                                                                                        ],),

                                                                                    ]),
                                                                                SizedBox(width: 25,),
                                                                              ]),
                                                                        ),

                                                                      ]),

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
                                                                style:
                                                                TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color:
                                                                sampleController3.col==1?Colors.white:Colors.black,)

                                                            ),
                                                            onPressed: () {
                                                              Get.to(
                                                                  Seggestions(
                                                                    title: "اقتراحات قد تعجبك",products: [],
                                                                  ));
                                                            },
                                                          ))
                                                    ]),]),

//////////////////////////////////listpoduct_sales
                                                  Container(

                                                      height: 298, child:
                                                  ListView.builder(
                                                      scrollDirection: Axis.horizontal,
                                                      itemCount: controller.listpoduct_sales.length,
                                                      itemBuilder: (context, index) {
                                                        var item = controller.listpoduct_sales;
                                                        return

                                                          Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
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
                                                                            style:
                                                                            TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color:
                                                                            sampleController3.col==1?Colors.white:Colors.black,)
                                                                        ),
                                                                      ),
                                                                      onTap: () {
                                                                        Get.to(
                                                                            Seggestions(
                                                                              title: "الأكثر شيوعاً",products: [],
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
                                                                                  title: "الأكثر شيوعاً",products: [],
                                                                                ));
                                                                          },
                                                                          icon: Icon(
                                                                            Icons
                                                                                .arrow_forward ,color:

                                                                          sampleController3.col==1?Colors.white:
                                                                          Colors
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
                                                                        scrollDirection: Axis.horizontal,
                                                                        child: Row(
                                                                            children: <Widget>[
                                                                              Column(
                                                                                  children: [
                                                                                    Column(
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Stack(
                                                                                          children: [InkWell(
                                                                                            onTap:(){
                                                                                              Get.to(ProductDeatil(controller.listpoduct_sales.elementAt(index).id));
                                                                                            },
                                                                                            child:Container(
                                                                                              margin: EdgeInsets.only(right: 10),
                                                                                              width: MediaQuery.of(context).size.width * 0.6,
                                                                                              height: 180,
                                                                                              child: ClipRRect(
                                                                                                borderRadius: BorderRadius.circular(20),
                                                                                                child: Image.network("${api}uploads/product/${item.elementAt(index).image}",
                                                                                                  fit: BoxFit.cover,


                                                                                                ),),

                                                                                            ),
                                                                                          ), Positioned(
                                                                                            left:10,
                                                                                            top:20,
                                                                                            // alignment :Alignment(-1.0, -1.0),// Alignment.topLeft,

                                                                                            child:
                                                                                            InkWell(
                                                                                              onTap: () async{
                                                                                                print(controller.listpoduct_sales.elementAt(index).id);
                                                                                                var data =
                                                                                                await AuthServices.doo(
                                                                                                    product_id: controller.listpoduct_sales.elementAt(index).id);
                                                                                                if(data=="add")
                                                                                                {

                                                                                                  print("************************before add*************************************");
                                                                                                  print(controller.listpoduct_f.length);

                                                                                                  Favorite_product2 g= new Favorite_product2(product_id: controller.listpoduct_sales.elementAt(index).id, id: 9);
                                                                                                  controller.listpoduct_f.add(g);

                                                                                                  print(controller.listpoduct_f.length);
                                                                                                  print("************************after add*************************************");



                                                                                                  print(controller.listpoduct_sales.elementAt(index).isfavorite);
                                                                                                  print("::::::::::::::::::::::::if::::::::::::::::::::");
                                                                                                  controller.listpoduct_sales.elementAt(index).isfavorite = true;
                                                                                                  print(controller.listpoduct_sales.elementAt(index).isfavorite);
                                                                                                  controller.changeCol(data,1,controller.listpoduct_sales.elementAt(index).id);}

                                                                                                else{

                                                                                                  controller.listpoduct_sales.elementAt(index).isfavorite = false;




                                                                                                  print("************************before remove*************************************");
                                                                                                  print(controller.listpoduct_f.length);

                                                                                                  Favorite_product2 g= new Favorite_product2(product_id: controller.listpoduct_sales.elementAt(index).id, id: 9);

                                                                                                  for(int i=0;i<controller.listpoduct_f.length;i++){
                                                                                                    if(controller.listpoduct_sales.elementAt(index).id==controller.listpoduct_f.elementAt(i).product_id)
                                                                                                      controller.listpoduct_f.removeAt(i);

                                                                                                  }

                                                                                                  print(controller.listpoduct_f.length);
                                                                                                  print("************************after remove*************************************");


                                                                                                  controller.changeCol(data,2,controller.listpoduct_sales.elementAt(index).id);
                                                                                                }



                                                                                              },
                                                                                              child: CircleAvatar(
                                                                                                backgroundColor: Themes.color2,
                                                                                                child: Icon(
                                                                                                  Icons.favorite,
                                                                                                  color:
                                                                                                  controller.check( controller.listpoduct_sales.elementAt(index).id)
                                                                                                      ? Colors.red:Colors.black,
                                                                                                ),
                                                                                              ),
                                                                                            ),

                                                                                          ),],),
                                                                                        Row(children:[
                                                                                          Container(
                                                                                            margin: EdgeInsets.only(right: 20),
                                                                                            child:
                                                                                            Row(
                                                                                              children: [
                                                                                                Text(
                                                                                                    "${controller.listpoduct_sales.elementAt(index).name} ",
                                                                                                    style: TextStyle( color: controller.col==1?Colors.white: Colors.black,fontWeight: FontWeight.normal,fontSize: 16)
                                                                                                ),
                                                                                                SizedBox(width: 5,),
                                                                                                Icon(
                                                                                                  Icons.tag_faces_outlined,
                                                                                                  color: sampleController3.col==1?Colors.white: Colors.green, ),
                                                                                                Container(
                                                                                                    margin: EdgeInsets.only(
                                                                                                      right: MediaQuery.of(context).size.width * 0.2,),
                                                                                                    child: Text(
                                                                                                        "${controller.listpoduct_sales.elementAt(index).costPrice}" +" ل.س ",
                                                                                                        style: TextStyle( color: sampleController3.col==1?Colors.white: Colors.red,)
                                                                                                    )),
                                                                                              ],
                                                                                            ),),
                                                                                        ]
                                                                                        ),
                                                                                      ],),

                                                                                  ]),
                                                                              SizedBox(width: 25,),
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

                                                              style:
                                                              TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color:
                                                              sampleController3.col==1?Colors.white:Colors.black,)
                                                          ),
                                                          onPressed: () {
                                                            Get.to(
                                                                Seggestions(
                                                                  title: "الأكثر شيوعاً",products: [],
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
                                                      itemCount: controller.listpoduct_salary.length,
                                                      itemBuilder: (context, index) {
                                                        var item = controller.listpoduct_salary;
                                                        return

                                                          Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [

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
                                                                            style:
                                                                            TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color:
                                                                            sampleController3.col==1?Colors.white:Colors.black,)
                                                                        ),
                                                                      ),
                                                                      onTap: () {
                                                                        Get.to(
                                                                            Seggestions(
                                                                              title:
                                                                              "الأقل سعراً",products: [],
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
                                                                                  "الأقل سعراً",products: [],
                                                                                ));
                                                                          },
                                                                          icon: Icon(
                                                                            Icons
                                                                                .arrow_forward, color:
                                                                          sampleController3.col==1?Colors.white:
                                                                          Colors
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
                                                                        scrollDirection: Axis.horizontal,
                                                                        child: Row(

                                                                            children: <Widget>[
                                                                              Column(
                                                                                  children: [
                                                                                    Column(
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Stack(children: [
                                                                                          InkWell(
                                                                                            onTap:(){Get.to(ProductDeatil(controller.listpoduct_salary.elementAt(index).id));},
                                                                                            child: Container(
                                                                                              margin: EdgeInsets.only(right: 10),
                                                                                              width: MediaQuery.of(context).size.width * 0.6,
                                                                                              height: 180,
                                                                                              child: ClipRRect(
                                                                                                borderRadius: BorderRadius.circular(20),
                                                                                                child: Image.network("${api}uploads/product/${item.elementAt(index).image}",
                                                                                                  fit: BoxFit.cover,


                                                                                                ),),

                                                                                            ),),
                                                                                          Positioned(
                                                                                            left:10,
                                                                                            top:20,
                                                                                            // alignment :Alignment(-1.0, -1.0),// Alignment.topLeft,

                                                                                            child:
                                                                                            InkWell(
                                                                                              onTap: () async{
                                                                                                print(controller.listpoduct_salary.elementAt(index).id);
                                                                                                var data =
                                                                                                await AuthServices.doo(
                                                                                                    product_id: controller.listpoduct_salary.elementAt(index).id);
                                                                                                if(data=="add")
                                                                                                {
                                                                                                  controller.listpoduct_salary.elementAt(index).isfavorite = true;


                                                                                                  print("************************before add*************************************");
                                                                                                  print(controller.listpoduct_f.length);

                                                                                                  Favorite_product2 g= new Favorite_product2(product_id: controller.listpoduct_salary.elementAt(index).id, id: 9);
                                                                                                  controller.listpoduct_f.add(g);

                                                                                                  print(controller.listpoduct_f.length);
                                                                                                  print("************************after add*************************************");


                                                                                                  //controller.changeCol(data,1,controller.listpoduct_salary.elementAt(index).id);
                                                                                                }

                                                                                                else{

                                                                                                  controller.listpoduct_salary.elementAt(index).isfavorite = false;




                                                                                                  print("************************before remove*************************************");
                                                                                                  print(controller.listpoduct_f.length);

                                                                                                  for(int i=0;i<controller.listpoduct_f.length;i++){
                                                                                                    if(controller.listpoduct_salary.elementAt(index).id==controller.listpoduct_f.elementAt(i).product_id)
                                                                                                      controller.listpoduct_f.removeAt(i);

                                                                                                  }

                                                                                                  print(controller.listpoduct_f.length);
                                                                                                  print("************************after remove*************************************");


                                                                                                  controller.changeCol(data,2,controller.listpoduct_salary.elementAt(index).id);
                                                                                                }



                                                                                              },
                                                                                              child: CircleAvatar(
                                                                                                backgroundColor: Themes.color2,
                                                                                                child: Icon(
                                                                                                  Icons.favorite,
                                                                                                  color:
                                                                                                  controller.check( controller.listpoduct_salary.elementAt(index).id)
                                                                                                      ? Colors.red:Colors.black,
                                                                                                ),
                                                                                              ),
                                                                                            ),

                                                                                          ),],),
                                                                                        Row(children:[
                                                                                          Container(

                                                                                            margin: EdgeInsets.only(right: 20),
                                                                                            child:
                                                                                            Row(
                                                                                              children: [
                                                                                                Text(
                                                                                                    "${controller.listpoduct_salary.elementAt(index).name} ",
                                                                                                    style: TextStyle( color: controller.col==1?Colors.white: Colors.black,fontWeight: FontWeight.normal,fontSize: 16)
                                                                                                ),
                                                                                                SizedBox(width: 5,),
                                                                                                Icon(
                                                                                                  Icons.tag_faces_outlined,
                                                                                                  color: sampleController3.col==1?Colors.white: Colors.green, ),
                                                                                                Container(
                                                                                                    margin: EdgeInsets.only(
                                                                                                      right: MediaQuery.of(context).size.width * 0.2,),
                                                                                                    child: Text(
                                                                                                        "${controller.listpoduct_salary.elementAt(index).costPrice}" +" ل.س ",
                                                                                                        style: TextStyle( color: sampleController3.col==1?Colors.white: Colors.red,)
                                                                                                    )),
                                                                                              ],
                                                                                            ),),
                                                                                        ]
                                                                                        ),
                                                                                      ],),
                                                                                  ]),
                                                                              SizedBox(width: 25,),
                                                                            ]),
                                                                      ),
                                                                    ]),
                                                                SizedBox(height: 25,),
                                                              ]);
                                                      })
                                                  ),
                                                  Row(children: [
                                                    Container(
                                                        margin: EdgeInsets.only(right: 150, top: 1, bottom: 1),
                                                        child: TextButton(
                                                          child: Text(
                                                              "عرض المزيد",
                                                              style:
                                                              TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color:
                                                              sampleController3.col==1?Colors.white:Colors.black,)
                                                          ),
                                                          onPressed: () {Get.to(
                                                              Seggestions(
                                                                title:
                                                                "الأقل سعراً", products: [],
                                                              ));},
                                                        ))
                                                  ]),


                                                ],)),


                                          ]);
                                      })
                              )
                      )
                  )
              ),

            )
        ),
      ),
    );

  }
}
