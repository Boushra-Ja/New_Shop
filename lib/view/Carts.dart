
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:new_shop/logic/controllers/CartController.dart';
import 'package:new_shop/utls/Themes.dart';
import 'package:slimy_card/slimy_card.dart';
import '../logic/controllers/DrawerController/SettingPageController.dart';
import '../logic/controllers/FavoriteController.dart';
import '../main.dart';
import '../services/auth_services.dart';

class Carts extends GetView<CartController> {
  final sampleControllerr = Get.put(CartController(), permanent: true);
  final sampleController3 = Get.put(SettingPageController(), permanent: true);

  static int  i=1;


  @override
  Widget build(BuildContext context) {

    return GetBuilder<CartController>(builder: (controller) {
      return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
              backgroundColor:sampleController3.col==0? Themes.color2:
              Colors.black,

              body: GetX<CartController>(
                  builder: (c) => Center(
                      child: c.ListCArt.isEmpty
                          ? Center(child: CircularProgressIndicator())
                          : GetX<CartController>(
                              builder: (c) => Center(
                                  child: c.ListCArt.isEmpty
                                      ? CircularProgressIndicator()
                                      : GetBuilder<CartController>(
                                          builder: (controller) {
                                          return

                                            StreamBuilder(
                                                initialData: false,
                                                stream: slimyCard.stream,
                                                builder: ((BuildContext context, AsyncSnapshot snapshot) {
                                                  return
                                                    ListView(


                                                    padding: EdgeInsets.zero,
                                                    children: <Widget>[

                                                      Container(
                                                        margin: EdgeInsets.only(top: 30, right: 20),
                                                        child: Row(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            InkWell(
                                                              onTap: () {
                                                                Get.back();
                                                              },
                                                              child:const  CircleAvatar(
                                                                radius: 20,
                                                                child: Icon(
                                                                  Icons.arrow_back_rounded,
                                                                  color: Themes.color,
                                                                ),
                                                                backgroundColor:
                                                                Colors.white,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),


                                                      Container(
                                                        margin: EdgeInsets.only(top: 1),
                                                        padding: new EdgeInsets.all(5.0),
                                                        child:

                                                        ListView.builder(
                                                            itemCount: controller.ListCArt.length,
                                                            shrinkWrap: true,
                                                            physics:
                                                            NeverScrollableScrollPhysics(),
                                                            itemBuilder: (BuildContextcontext, int index) {
                                                              return

                                                                Column(
                                                                  children: [

                                                                    index>=1?


                                                                    controller.ListCArt.elementAt(index).order_id!=controller.ListCArt.elementAt(index-1).order_id?
                                                                    Container(
                                                                      width: MediaQuery.of(context).size.width*0.5,
                                                                      height: 50,
                                                                      child:
                                                                       Card(child:   Center(
                                                                          child:Text(" الطلب ${controller.ListCArt.elementAt(index).order_id}",
                                                                            style: TextStyle(fontSize: 20),)),
                                                                      )
                                                                    ):Text("")











                                                                        :Text(""),





                                                                    Container(
                                                                      width: MediaQuery.of(context).size.width*0.5,
                                                                      height: 50,
                                                                      child:
                                                                      index==0? Card(child:   Center(
                                                                          child:Text(" الطلب ${controller.ListCArt.elementAt(index).order_id}",
                                                                            style: TextStyle(fontSize: 20),)),
                                                                      ):Text(""),
                                                                    ),
                                                                    SizedBox(height: 30,),

                                                                    Container(
                                                                       // height: MediaQuery.of(context).size.height,
                                                                     // color : Colors.black,
                                                                      child:
                                                                     Card(
                                                                       elevation: 10,
                                                                    shape:
                                                                    RoundedRectangleBorder(
                                                                      borderRadius:
                                                                      BorderRadius
                                                                          .circular(40),),
                                                                    //   color : Colors.white,

                                                                       child:
                                                                       Container(
                                                                        // height: MediaQuery.of(context).size.height,
                                                                         child: SlimyCard(
                                                                           //
                                                                           width: MediaQuery.of(context).size.width/1.2,

                                                                           color : sampleController3.col==0? Colors.purpleAccent.withOpacity(0.2):
                                                                           Colors.black12,

                                                                           //Themes.color2,
                                                                          // Colors.greenAccent.withOpacity(0.2),
                                                                           //  width: 200,
                                                                           topCardHeight: 600,
                                                                           bottomCardHeight: 240,
                                                                           borderRadius: 30,
                                                                           slimeEnabled: true,
                                                                           topCardWidget: topCardWidget(index,context,(snapshot.data)
                                                                                     ?"http://192.168.43.117:8000/uploads/product/${controller.ListCArt.elementAt(index).myProducts.elementAt(0).image}"
                                                                                      : "http://192.168.43.117:8000/uploads/product/${controller.ListCArt.elementAt(index).myProducts.elementAt(0).image}"),
                                                                           bottomCardWidget: bottomCardWidget(index, context),
                                                                         ),
                                                                       ),
                                                                     )),

                                                                    SizedBox(height: 30,)
                                                                  ],
                                                                );
                                                            }),

                                                        ///////////////////////////////////

                                                      ),
                                                      SizedBox(height: 30,)


                                                    ],
                                                  );
                                                }),

                                            );




                                      })
                              )
                      )
                  )

          )));
    });


}


  Widget topCardWidget(index,context,String imagePath) {
    return

      Column(
          children: [

              Padding(
              padding:  EdgeInsets.only(top: 10, bottom: 10),
              child:  Center(
                    child:
                    CircleAvatar(
                      radius:65,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(

                            radius:60,
                            backgroundImage: NetworkImage(imagePath),
                      ),
                    )),),

           Container(
          //  height: MediaQuery.of(context).size.height,
             child: Card(
               color: sampleController3.col==0? Colors.white:
               Colors.black12,
                 child:Column(children: [


               Padding(
                   padding: const EdgeInsets.only(right: 30.0, top: 1, bottom: 10),
                   child: Row(
                     children: [
                       Icon(Icons.circle_rounded,color: Colors.black,size: 8,),
                       Flexible(child: Text("   المتجر   ", style: Themes.subtitlebat),),
                   Flexible(child:    Text("${controller.ListCArt.elementAt(index).myProducts.elementAt(0).storeName}", style: Themes.subtitlebat),),
                       //    Text("${controller.ListCArt.elementAt(1).myProducts.elementAt(0).storeName}", style: Themes.headline1),
                     ],
                   )),
                   Divider(color: sampleController3.col==0? Colors.black12: Colors.white,
                     thickness: 1,
                     indent: 10,
                     endIndent: 10,),
               Padding(
                   padding: const EdgeInsets.only(right: 30.0, bottom: 10),
                   child: Row(children: [
                     Icon(Icons.circle_rounded,color: Colors.black,size: 8,),
                     Flexible(child:   Text(" اسم المنتج:   ", style: Themes.subtitlebat),),
    Flexible(child: Text("${controller.ListCArt.elementAt(index).myProducts.elementAt(0).productName}", style: Themes.subtitlebat),),
                   ])),
                   Divider(color: sampleController3.col==0? Colors.black12: Colors.white,
                     thickness: 1,
                     indent: 10,
                     endIndent: 10,),
               Padding(
                   padding: const EdgeInsets.only(right: 30.0, bottom: 10),
                   child: Row(
                       children: [
                         Icon(Icons.circle_rounded,color: Colors.black,size: 8,),                   Flexible(child:  Text(" تقييم المنتج :  ", style: Themes.subtitlebat),),
                   Flexible(child:  Text("${controller.ListCArt.elementAt(index).myProducts.elementAt(0).review}", style: Themes.subtitlebat),),
                       ])),
                   Divider(color: sampleController3.col==0? Colors.black12: Colors.white,
                     thickness: 1,
                     indent: 10,
                     endIndent: 10,),
               const  SizedBox(height: 10,),
               Padding(padding: const EdgeInsets.only(right: 30.0),
                 child: Row(
                     children: [
                       Icon(Icons.circle_rounded,color: Colors.black,size: 8,),                 Flexible(child:   Text("  العدد المطلوب  :", style: Themes.subtitlebat),),
                       const SizedBox(width: 10,),



                       Container(child: Text("${controller.ListCArt.elementAt(index).amount}")),




                     ]),
               ),Divider(color: sampleController3.col==0? Colors.black12: Colors.white,
                     thickness: 1,
                     indent: 10,
                     endIndent: 10,),
               Padding(
                   padding: const EdgeInsets.only(right: 30.0, top: 20),
                   child:
                   Row(
                     children: [
                       Icon(Icons.circle_rounded,color: Colors.black,size: 8,),
                       Flexible(child: Text("السعر الاصلي : ", style: Themes.subtitlebat),),
                    Flexible(child: Text(" ${controller.ListCArt.elementAt(index).myProducts.elementAt(0).cost_price}", style: Themes.subtitlebat),),
                       Text(" ل.س  ", style: Themes.subtitlebat),
                     ],
                   )), Divider(color: sampleController3.col==0? Colors.black12: Colors.white,
                 thickness: 1,
                 indent: 10,
                 endIndent: 10,),
               Padding(
                   padding: const EdgeInsets.only(right: 30.0, top: 20),
                   child:
                   Row(
                     children: [
                       Icon(Icons.circle_rounded,color: Colors.black,size: 8,),                     Flexible(child:
                     Text(" السعر بعد الخصم:   ", style: Themes.subtitlebat),),
                   Flexible(child:
                   Text("  ${(controller.ListCArt.elementAt(index).myProducts.elementAt(0).cost_price *controller.ListCArt.elementAt(index).myProducts.elementAt(0).value_discount)/100}", style: Themes.subtitlebat)),
                       Text(" ل.س  ", style: Themes.subtitlebat),
                     ],
                   )),
                   Divider(color: sampleController3.col==0? Colors.black12: Colors.white,
                     thickness: 1,
                     indent: 10,
                     endIndent: 10,),
               Padding(padding: const EdgeInsets.only(right: 30.0, top: 20),
                   child:
                   Row(
                     children: [
                   Flexible(child:   Text("  تم تقديم الطلب في ${controller.ListCArt.elementAt(index).created_at}  ", style: Themes.subtitlebat)),
                     ],
                   )),
               const SizedBox(height: 10,),
             ],)),
           ),





          ]);
  }

  Widget bottomCardWidget(index, context ) {


    return
      Column(
        children: [

              Container(
                  child: controller.ListCArt.elementAt(index).myProducts.elementAt(0).reviews==0?
                         Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      Text("تم تقييم المتجر ب"),
                       Row(
                            children: const [
                              Icon(
                                Icons.star,
                                color: Colors.pink,
                                size: 15,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.pink,
                                size: 15,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.pink,
                                size: 15,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.pink,
                                size: 15,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.pink,
                                size: 15,
                              )],)

                    ],):
                         controller.ListCArt.elementAt(index).myProducts.elementAt(0).reviews==1?
                         Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children:  [
                               Text("تم تقييم المتجر ب"), Row(
                    children: const [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 15,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.pink,
                        size: 15,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.pink,
                        size: 15,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.pink,
                        size: 15,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.pink,
                        size: 15,
                      )
                    ],
                  )]):
                         controller.ListCArt.elementAt(index).myProducts.elementAt(0).reviews==2?
                         Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children:  [
                               Text("تم تقييم المتجر ب"),  Row(
                           children: const [
                             Icon(
                               Icons.star,
                               color: Colors.yellow,
                               size: 15,
                             ),
                             Icon(
                               Icons.star,
                               color: Colors.yellow,
                               size: 15,
                             ),
                             Icon(
                               Icons.star,
                               color: Colors.pink,
                               size: 15,
                             ),
                             Icon(
                               Icons.star,
                               color: Colors.pink,
                               size: 15,
                             ),
                             Icon(
                               Icons.star,
                               color: Colors.pink,
                               size: 15,
                             )
                           ],
                         )]):
                         controller.ListCArt.elementAt(index).myProducts.elementAt(0).reviews==3?
                         Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children:  [
                               Text("تم تقييم المتجر ب"), Row(
                           children: const [
                             Icon(
                               Icons.star,
                               color: Colors.yellow,
                               size: 15,
                             ),
                             Icon(
                               Icons.star,
                               color: Colors.yellow,
                               size: 15,
                             ),
                             Icon(
                               Icons.star,
                               color: Colors.yellow,
                               size: 15,
                             ),
                             Icon(
                               Icons.star,
                               color: Colors.pink,
                               size: 15,
                             ),
                             Icon(
                               Icons.star,
                               color: Colors.pink,
                               size: 15,
                             )
                           ],
                         )]):
                         controller.ListCArt.elementAt(index).myProducts.elementAt(0).reviews==4?
                         Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children:  [
                               Text("تم تقييم المتجر ب"), Row(
                           children: const [
                             Icon(
                               Icons.star,
                               color: Colors.yellow,
                               size: 15,
                             ),
                             Icon(
                               Icons.star,
                               color: Colors.yellow,
                               size: 15,
                             ),
                             Icon(
                               Icons.star,
                               color: Colors.yellow,
                               size: 15,
                             ),
                             Icon(
                               Icons.star,
                               color: Colors.yellow,
                               size: 15,
                             ),
                             Icon(
                               Icons.star,
                               color: Colors.pink,
                               size: 15,
                             )
                           ],
                         )]):
                         Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children:  [
                               Text("تم تقييم المتجر ب"), Row(
                           children: const [
                             Icon(
                               Icons.star,
                               color: Colors.yellow,
                               size: 15,
                             ),
                             Icon(
                               Icons.star,
                               color: Colors.pink,
                               size: 15,
                             ),
                             Icon(
                               Icons.star,
                               color: Colors.pink,
                               size: 15,
                             ),
                             Icon(
                               Icons.star,
                               color: Colors.pink,
                               size: 15,
                             ),
                             Icon(
                               Icons.star,
                               color: Colors.pink,
                               size: 15,
                             )
                           ],
                         )])



              ),
                   Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Container(
                width: 60.0,
                foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                    color: Colors.blueGrey,
                    width: 2.0,
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        initialValue: controller.ListCArt.elementAt(index).myamount==0?
                        "${controller.ListCArt.elementAt(index).amount}":
                        "${controller.ListCArt.elementAt(index).myamount}",

                        onChanged: (text) => {

                          print(text),

                          controller.ListCArt.elementAt(index).myamount  = int.parse(text)
                        },
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                       // controller: I['controller{$index}'].text,
                        keyboardType: TextInputType.numberWithOptions(
                          decimal: false,
                          signed: true,
                        ),

                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
                   Row(children: [ Text("اضغط لتعديل العدد "),


                IconButton(
                    icon: Icon(Icons.edit),
                    color:Colors.deepPurple,onPressed: ()async{

                  print("+++++++++++++++++++++++++++++++++++++++++");
                  print( controller.ListCArt.elementAt(index).myProducts.elementAt(0).productId);
                  print( controller.ListCArt.elementAt(index).order_id);
                  print("+++++++++++++++++++++++++++++++++++++++++");

                  await AuthServices.changeAmount(
                      product_id:controller.ListCArt.elementAt(index).myProducts.elementAt(0).productId,

                      order_id: controller.ListCArt.elementAt(index).order_id,
                      amount: controller.ListCArt.elementAt(index).myamount
                  ).then(
                     controller.onInit(),
                      Get.snackbar("تم تعديل العدد", "بنجاح"));


                  //controller.ListCArt.elementAt(index).amount);
                })


              ],),
                   Row(children: [ Text("التحويل للارسال"),

            // IconButton(onPressed: () {  }, icon: Icon(Icons.send)),
            IconButton(color:Colors.deepPurple,
              icon: Icon(Icons.send),
                    onPressed: ()async{


                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.QUESTION,
                        borderSide: BorderSide(color: Colors.green, width: 2),
                        buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
                        headerAnimationLoop: false,
                        animType: AnimType.BOTTOMSLIDE,
                        title: ' تحويل الطلب ',
                        desc: 'هل تريد تحويل الطلب للمشرفين',
                        showCloseIcon: true,
                        btnCancelOnPress: () {
                        //  Navigator.of(context).pop();

                        },

                        btnOkOnPress: () async{

                          await AuthServices.ChangeToCommit(
                            product_id:controller.ListCArt.elementAt(index).myProducts.elementAt(0).productId,

                            order_id: controller.ListCArt.elementAt(index).order_id,

                          ) .then(controller.onInit(),);
                        },
                      ).show();





                  //controller.ListCArt.elementAt(index).amount);
                },

               )],),





        ],
      )



















      // Container(
      //   height: 100,
      //   child: Text(
      //   'It doesn\'t matter \nwhat your name is.',
      //   style: TextStyle(
      //     color: Colors.black,
      //     fontSize: 12,
      //     fontWeight: FontWeight.w500,
      //   ),
      //   textAlign: TextAlign.center,),
      // )

    ;}

}











/*  Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20),
                                        child: RichText(
                                          text:  TextSpan(
                                            style:
                                            TextStyle(color: Colors.black),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text:
                                                  "السعر بعد الخصم : ",
                                                  style: Themes.headline1),
                                              TextSpan(
                                                  text: "20000 ل.س ",
                                                  style: Themes.headline1)
                                              //  TextSpan(text: 'com', style: TextStyle(decoration: TextDecoration.underline))
                                            ],
                                          ),
                                        )),


                                         Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 20),
                                                            child: Center(
                                                              child: Container(
                                                                width: 150,
                                                                height: 40,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade600,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30),
                                                                ),
                                                                child: Center(
                                                                  child:
                                                                      TextButton(
                                                                    onPressed:
                                                                        () {},
                                                                    child: Text(
                                                                        "معالجه الطلب",
                                                                        style: Themes
                                                                            .headline1),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),


                                        */


/*
                                                                    // Card(
                                                                    //     elevation: 100,
                                                                    //     shape:
                                                                    //     RoundedRectangleBorder(
                                                                    //       borderRadius:
                                                                    //       BorderRadius
                                                                    //           .circular(40),
                                                                    //     ),
                                                                    //     child:
                                                                    //
                                                                    //     Column(
                                                                    //         children: [
                                                                    //           SizedBox(
                                                                    //             height: 30,
                                                                    //           ),
                                                                    //
                                                                    //
                                                                    //
                                                                    //           Padding(
                                                                    //               padding:
                                                                    //               const EdgeInsets.only(top: 20),
                                                                    //               child: Row(
                                                                    //                   children: [
                                                                    //                     SizedBox(
                                                                    //                       width: 30,
                                                                    //                     ),
                                                                    //                     Center(
                                                                    //                       child: Container(
                                                                    //                         width: MediaQuery.of(context).size.width / 2,
                                                                    //                         height: 150,
                                                                    //                         child: Image.network('http://192.168.1.106:8000/uploads/product/1655592582.jpg'
                                                                    //                           //${api}uploads/product/${controller.ListCArt.elementAt(0).myProducts.elementAt(0).image} "
                                                                    //                         ),
                                                                    //                       ),
                                                                    //                     ),
                                                                    //                   ])),
                                                                    //           Padding(
                                                                    //               padding: const EdgeInsets.only(
                                                                    //                   right:
                                                                    //                   30.0,
                                                                    //                   top:
                                                                    //                   20,
                                                                    //                   bottom:
                                                                    //                   30),
                                                                    //               child:
                                                                    //               Row(
                                                                    //                 children: [
                                                                    //                   Text("  اسم المتجر :  ",
                                                                    //                       style: Themes.headline1),
                                                                    //                   Text("${controller.ListCArt.elementAt(0).myProducts.elementAt(0).storeName}",
                                                                    //                       style: Themes.headline1),
                                                                    //                 ],
                                                                    //               )),
                                                                    //           Padding(
                                                                    //               padding: const EdgeInsets.only(
                                                                    //                   right:
                                                                    //                   30.0,
                                                                    //                   bottom:
                                                                    //                   30),
                                                                    //               child: Row(
                                                                    //                   children: [
                                                                    //                     Text(" اسم المنتج:   ", style: Themes.headline1),
                                                                    //                     Text("${controller.ListCArt.elementAt(0).myProducts.elementAt(0).productName}", style: Themes.headline1),
                                                                    //                   ])),
                                                                    //           Padding(
                                                                    //               padding: const EdgeInsets.only(
                                                                    //                   right:
                                                                    //                   30.0,
                                                                    //                   bottom:
                                                                    //                   30),
                                                                    //               child: Row(
                                                                    //                   children: [
                                                                    //                     Text("التقييم:  ", style: Themes.headline1),
                                                                    //                     Text("${controller.ListCArt.elementAt(0).myProducts.elementAt(0).reviews}", style: Themes.headline1),
                                                                    //                   ])),
                                                                    //           SizedBox(
                                                                    //             height:
                                                                    //             20,
                                                                    //           ),
                                                                    //           Padding(
                                                                    //             padding: const EdgeInsets
                                                                    //                 .only(
                                                                    //                 right:
                                                                    //                 30.0),
                                                                    //             child: Row(
                                                                    //                 children: [
                                                                    //                   Text("  العدد :     ",
                                                                    //                       style: Themes.headline1),
                                                                    //                   SizedBox(
                                                                    //                     width: 10,
                                                                    //                   ),
                                                                    //
                                                                    //                   IconButton(
                                                                    //                       onPressed: () {},
                                                                    //                       icon: Icon(Icons.add)),
                                                                    //
                                                                    //                   Container(child: Text("${controller.ListCArt.elementAt(0).amount}")),
                                                                    //
                                                                    //                   IconButton(
                                                                    //                       onPressed: () {},
                                                                    //                       icon: Icon(Icons.linear_scale_sharp)),
                                                                    //
                                                                    //
                                                                    //                 ]),
                                                                    //           ),
                                                                    //           Padding(
                                                                    //               padding: const EdgeInsets.only(
                                                                    //                   right:
                                                                    //                   30.0,
                                                                    //                   top:
                                                                    //                   20),
                                                                    //               child:
                                                                    //               Row(
                                                                    //                 children: [
                                                                    //                   Text("  سعر المنتج  : ",
                                                                    //                       style: Themes.headline1),
                                                                    //                   Text("${controller.ListCArt.elementAt(0).myProducts.elementAt(0).cost_price}",
                                                                    //                       style: Themes.headline1),
                                                                    //                   Text("   ل.س  ",
                                                                    //                       style: Themes.headline1),
                                                                    //                 ],
                                                                    //               )),
                                                                    //           SizedBox(
                                                                    //             height:
                                                                    //             20,
                                                                    //           ),
                                                                    //
                                                                    //
                                                                    //
                                                                    //         ])
                                                                    //
                                                                    // ),*/