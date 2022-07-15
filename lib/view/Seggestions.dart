import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_shop/models/Boshra/Store/Product_ClassModel.dart';
import 'package:new_shop/utls/Themes.dart';
import 'package:new_shop/view/ProductDeatil.dart';

import '../main.dart';

class Seggestions extends StatelessWidget
{
  var check_tap;
  final title;
  List<dynamic>products;

  Seggestions({this.title ,required this.products});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            backgroundColor: products.length == 0 ? Colors.white : Themes.color2,
            body: Column(children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                color:  Colors.white,
                child: Container(
                  margin: EdgeInsets.only(top: 40.0, right: 8, bottom: 5),
                  child: Row(
                    children: [
                      Container(
                        child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(Icons.arrow_back),
                        ),
                      ),
                      Container(
                          child: Text("${title}", style: Themes.headline3)),
                    ],
                  ),
                ),
              ),
              products.length == 0 ? Divider(): SizedBox.shrink() ,
              products.length == 0 ? SizedBox(height: 100,) : SizedBox.shrink() ,
              products.length == 0  ?   Center(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/notf.png'),
                            fit: BoxFit.contain),
                      ),
                    ),
                    SizedBox(height: 20,) ,
                    Text('لا يوجد منتجات مطابقة لمواصفاتك المطلوبة' , style: Themes.bodyText3,)
                  ],
                ),
              ) : Expanded(
                flex: 8,
                child: ListView.builder(
                  itemBuilder: (BuildContext, index) {
                    return Column(
                      children: [
                        Container(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: InkWell(
                            onTap:(){
                              Get.to(ProductDeatil(products.elementAt(index).id)) ;
                            },
                            child: Card(
                              shape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 20),
                                child: Row(
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.width * 0.3,
                                      width:
                                          MediaQuery.of(context).size.width * 0.3,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage('${MyApp.api}/uploads/product/${products.elementAt(index).image}'),
                                              fit: BoxFit.fill),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text("${products.elementAt(index).product_name}",
                                                  style: Themes.headline1),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.2,
                                            ),
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: InkWell(
                                                  onTap: () {
                                                    /////Action
                                                  },
                                                  child: CircleAvatar(
                                                    child: Icon(
                                                      Icons.favorite,
                                                      color: products.elementAt(index).isFavourite ? Colors.red : Colors.grey,
                                                      size: 20,
                                                    ),
                                                    backgroundColor:
                                                        Themes.color2,
                                                    radius: 16,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Text(
                                          "${products.elementAt(index).selling_price} ل.س ",
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 12),
                                        ),
                                        Text(""),
                                        Text("")
                                      ],
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )),
                        SizedBox(
                          height: 15,
                        )
                      ],
                    );
                  },
                  itemCount:products.length,
                ),
              )
            ])));
  }
}
