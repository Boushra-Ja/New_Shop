import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/date_picker_theme.dart';
import 'package:flutter_holo_date_picker/widget/date_picker_widget.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_shop/logic/controllers/CartController.dart';
import 'package:new_shop/utls/Themes.dart';
import 'package:slimy_card/slimy_card.dart';
import '../logic/controllers/DrawerController/SettingPageController.dart';
import '../logic/controllers/FavoriteController.dart';
import '../logic/controllers/ProductDeatilController.dart';
import '../logic/controllers/orders/ShoppingBasket.dart';
import '../main.dart';
import '../services/auth_services.dart';


class Carts extends GetView<CartController> {
  final sampleControllerr = Get.put(CartController(), permanent: true);
  final sampleController3 = Get.put(SettingPageController(), permanent: true);

  List<int> ListGift=[];



  late DateTime _selectedDate;
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {

    return GetBuilder<CartController>(builder: (controller) {

      return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
              backgroundColor:sampleController3.col==0? Themes.grey_color:
              Colors.black,

              body: GetX<CartController>(
                  builder: (c) => Center(
                      child:
                      c.IsNullBasket.value==null
                          ? Column(children:[ Image.asset('images/notf.png'),
                              SizedBox(height: 20,),

                              Text("لا يوجد طلبات في السله بعد",style: TextStyle(fontSize: 18),)
                      ])

                          : GetX<CartController>(
                            builder: (c) => Center(
                              child: c.IsNullBasket.value==null
                                  ? Column(children:[ Image.asset('images/notf.png'),
                                    SizedBox(height: 20,),

                                Text("لا يوجد طلبات في السله بعد",style: TextStyle(fontSize: 18),)
                              ])
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
                                                      itemCount: controller.map1.length,
                                                      shrinkWrap: true,
                                                      physics:
                                                      NeverScrollableScrollPhysics(),
                                                      itemBuilder: (BuildContextcontext, int index) {
                                                        return
                                                          Column(
                                                            children: [

                                                              Container(
                                                                width: MediaQuery.of(context).size.width,

                                                                child:


                                                                Column(children: [


                                                                     Center(
                                                                        child:
                                                                        Text("    الطلب ${index+1}",
                                                                          style: TextStyle(fontSize: 20,color: Colors.black),)
                                                                  )
                                                                ])

                                                              ),
                                                              SizedBox(height: 30,),
                                                              Container(
                                                                  child:
                                                               ListView.builder(
                                                                itemCount: controller.map1.values.elementAt(index).length,
                                                                  shrinkWrap: true,
                                                                  physics:
                                                                  NeverScrollableScrollPhysics(),
                                                                  itemBuilder: (BuildContextcontext, int i) {
                                                                  return

                                                                    Card(
                                                                        elevation: 10,
                                                                        shape:
                                                                        RoundedRectangleBorder(borderRadius:
                                                                        BorderRadius.circular(40),),
                                                                        child:
                                                                        Container(
                                                                          child: SlimyCard(
                                                                            width: MediaQuery.of(context).size.width/1.2,
                                                                            color : sampleController3.col==0? Themes.color2:
                                                                            Colors.black12,
                                                                            topCardHeight: 500,
                                                                            bottomCardHeight: 250,
                                                                            borderRadius: 30,
                                                                            slimeEnabled: true,
                                                                             topCardWidget: topCardWidget(index,context, (snapshot.data)
                                                                                     ? "${MyApp.api}/uploads/product/${controller.map1.values.elementAt(index)[i].product_image}"
                                                                                     : "${MyApp.api}/uploads/product/${controller.map1.values.elementAt(index)[i].product_image}",i ),
                                                                               bottomCardWidget: bottomCardWidget(index, context,i),
                                                                 ),
                                                               ),
                                                          );

                                                                }),



                                                              ),
                                                              SizedBox(height: 20,),
                                                              Container(
                                                                margin:EdgeInsets.only(top: 20),
                                                                width: MediaQuery.of(context).size.width ,

                                                                child: Center(
                                                                  child: MaterialButton(
                                                                    onPressed: () {

                                                                      print(controller.map1.keys.elementAt(index));
                                                                     // print(controller.map1.values.elementAt(index).toList());



                                                                          Get.toNamed('/treat_basket',
                                                                              arguments: {
                                                                                 "map": controller.map1.values.elementAt(index),

                                                                              });



                                                                    },
                                                                    color: Colors.purple[50],
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                        BorderRadius.circular(10)),
                                                                    child: Text(
                                                                      "معالجه الطلب ",
                                                                      style: Themes.subtitle3,
                                                                    ),
                                                                  ),
                                                                ),

                                                              ),

                                                              SizedBox(height: 30,)

                                                            ],
                                                          );
                                                      }),
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


Widget topCardWidget(index, context, String imagePath,i) {
    print(controller.map1.values.elementAt(index)[i].discount_value);

  return Column(children: [
    Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Center(
           child: CircleAvatar(
            radius: 65,
             backgroundColor: Colors.white,
             child: CircleAvatar(
            radius: 60,
             backgroundImage: NetworkImage(imagePath),
        ),
      )),
    ),
    Container(
      child: Card(
          color: sampleController3.col == 0 ? Colors.white : Colors.black12,
          child: Column(
            children: [
              Padding(
                  padding:
                      const EdgeInsets.only(right: 30.0, top: 1, bottom: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.circle_rounded,
                        color: Colors.black,
                        size: 8,
                      ),
                      Flexible(
                        child: Text("   المتجر   ", style: Themes.subtitlebat),
                      ),
                      Flexible(
                        child: Text("${controller.map1.values.elementAt(index)[i].store_name}",
                            style: Themes.subtitlebat),
                      ),
                    ],
                  )),
              Divider(
                color:
                    sampleController3.col == 0 ? Colors.black12 : Colors.white,
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),

              Padding(
                  padding: const EdgeInsets.only(right: 30.0, bottom: 10),
                  child: Row(children: [
                    Icon(
                      Icons.circle_rounded,
                      color: Colors.black,
                      size: 8,
                    ),
                    Flexible(
                      child: Text(" اسم المنتج:   ", style: Themes.subtitlebat),
                    ),
                    Flexible(
                      child: Text(
                          "${controller.map1.values.elementAt(index)[i].product_name}",
                          style: Themes.subtitlebat),
                    ),
                  ])),
              Divider(
                color:
                sampleController3.col == 0 ? Colors.black12 : Colors.white,
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),

              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: Row(children: [
                  Icon(
                    Icons.circle_rounded,
                    color: Colors.black,
                    size: 8,
                  ),
                  Flexible(
                    child:
                    Text("  العدد المطلوب  :", style: Themes.subtitlebat),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(child: Text("${controller.map1.values.elementAt(index)[i].amount}")),
                ]),
              ),
              Divider(
                color:
                sampleController3.col == 0 ? Colors.black12 : Colors.white,
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),
              Padding(
                  padding: const EdgeInsets.only(right: 30.0, top: 20),
                  child: Row(
                    children: [
                      Icon(
                        Icons.circle_rounded,
                        color: Colors.black,
                        size: 8,
                      ),
                      Flexible(
                        child:
                        Text("السعر الاصلي : ", style: Themes.subtitlebat),
                      ),
                      Flexible(
                        child: Text(
                            "${controller.map1.values.elementAt(index)[i].selling_price}",
                            style: Themes.subtitlebat),
                      ),
                      Text(" ل.س  ", style: Themes.subtitlebat),
                    ],
                  )),

              Divider(
                color:
                sampleController3.col == 0 ? Colors.black12 : Colors.white,
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),
              Padding(
                  padding: const EdgeInsets.only(right: 30.0, top: 20),
                  child: Row(
                    children: [
                      Icon(
                        Icons.circle_rounded,
                        color: Colors.black,
                        size: 8,
                      ),
                      Flexible(
                        child: Text(" السعر بعد الخصم:   ",
                            style: Themes.subtitlebat),
                      ),

                      // Flexible(child: Text("${(controller.map1.values.elementAt(index)[i].selling_price*controller.map1.values.elementAt(index)[i].discount_value/100)}", style: Themes.subtitlebat)),


                      Text(" ل.س  ", style: Themes.subtitlebat),
                    ],
                  )),
              Divider(
                color:
                sampleController3.col == 0 ? Colors.black12 : Colors.white,
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),

              const SizedBox(
                height: 10,
              ),



            ],
          )),
    ),
  ]);
}

Widget bottomCardWidget(index, context,i) {
  return Column(
    children: [



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
                    initialValue: controller.map1.values.elementAt(index)[i].myamount == 0
                        ? "${controller.map1.values.elementAt(index)[i].amount}"
                        : "${controller.map1.values.elementAt(index)[i].myamount}",

                    onChanged: (text) => {
                      print(text),
                      controller.map1.values.elementAt(index)[i].myamount =
                          int.parse(text),
                      print( controller.map1.values.elementAt(index)[i].myamount),

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
      Row(
        children: [
          Text("اضغط لتعديل العدد "),
          IconButton(
              icon: Icon(Icons.edit),
              color: Colors.deepPurple,
              onPressed: () async {


                controller.map1.values.elementAt(index)[i].amount =controller.map1.values.elementAt(index)[i].myamount;

                print("+++++++++++++++++++++++++++++++++++++++++");
                print( controller.map1.values.elementAt(index)[i].amount);
                print("+++++++++++++++++++++++++++++++++++++++++");

                Get.snackbar("تم تعديل العدد", "بنجاح");


                //controller.ListCArt.elementAt(index).amount);
              })
        ],
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Expanded(
            //     flex: 1,
            //     child:
            Flexible(
              child: Text(
                "هل ترغب في تغليف المنتج",
                style: Themes.subtitle1,
              ),
            ),
            Column(
              children: [
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ), //SizedBox
                    GetX<CartController>(
                      builder: (c) => Radio(
                        activeColor: Themes.color,
                        onChanged: (value) {
                        //  print(controller.map1.values.elementAt(index)[i].product_id);
                          c.setchexkboxValue(value.toString(), "${controller.map1.values.elementAt(index)[i].product_id}");

                            //ListGift.add(controller.map1.values.elementAt(index)[i].product_id);
                          //  print(ListGift);
                            controller.map1.values.elementAt(index)[i].gift_order='yes';

                        },
                        groupValue: c.chexkboxValue.value.elementAt(index),
                        value: 'yes',
                        // value:c.chexkboxValue.value.elementAt(index),
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      'نعم',
                      style: Themes.subtitle2,
                    ),
                    SizedBox(width: 10), //SizedBox
                    GetX<CartController>(
                      builder: (c) => Radio(
                          value: 'no',
                          activeColor: Themes.color,
                          groupValue: c.chexkboxValue.value.elementAt(index),
                          onChanged: (val) {

                          //  print(controller.map1.values.elementAt(index)[i].product_id);

                            c.setchexkboxValue(val.toString(), "${controller.map1.values.elementAt(index)[i].product_id}");
                            controller.map1.values.elementAt(index)[i].gift_order='no';


                            ListGift.remove(controller.map1.values.elementAt(index)[i].product_id);
                            // print("no");
                            print(ListGift);

                          }),
                    ),

                    SizedBox(width: 5),
                    Text(
                      'لا',
                      style: Themes.subtitle2,
                    ), //C
                  ], //<Widget>[]
                ),
              ],
            ),
            //),
          ],
        ),
      ),
      // Row(
      //   children: [
      //     Text("التحويل للارسال"),
      //
      //     // IconButton(onPressed: () {  }, icon: Icon(Icons.send)),
      //     IconButton(
      //       color: Colors.deepPurple,
      //       icon: Icon(Icons.send),
      //       onPressed: () async {
      //         AwesomeDialog(
      //           context: context,
      //           dialogType: DialogType.QUESTION,
      //           borderSide: BorderSide(color: Colors.green, width: 2),
      //           buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
      //           headerAnimationLoop: false,
      //           animType: AnimType.BOTTOMSLIDE,
      //           title: ' تحويل الطلب ',
      //           desc: 'هل تريد تحويل الطلب للمشرفين',
      //           showCloseIcon: true,
      //           btnCancelOnPress: () {
      //             //  Navigator.of(context).pop();
      //           },
      //           btnOkOnPress: () async {
      //             // await AuthServices.ChangeToCommit(
      //             //   product_id: controller.ListCArt.elementAt(index)
      //             //       .myProducts
      //             //       .elementAt(0)
      //             //       .productId,
      //             //   order_id: controller.ListCArt.elementAt(index).order_id,
      //             // ).then(
      //             //   controller.onInit(),
      //             // );
      //           },
      //         ).show();
      //
      //         //controller.ListCArt.elementAt(index).amount);
      //       },
      //     )
      //   ],
      // ),
    ],
  );}

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


}
