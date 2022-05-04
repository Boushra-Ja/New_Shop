import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:new_shop/logic/controllers/ProductDeatilController.dart';
import 'package:new_shop/utls/Themes.dart';
import 'package:new_shop/view/chatting/Chat.dart';

import 'EvaluationDialoge.dart';
import 'Seggestions.dart';
import 'ShopsPages/ShopProfile.dart';
import 'SuggestionPage.dart';
import 'chatting/ChatDetails.dart';

class ProductDeatil extends GetView<ProductDeatilController> {
  @override
  Widget build(BuildContext context) {
    ProductDeatilController controller = ProductDeatilController();

    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: ListView(
            shrinkWrap: true,
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/2.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                      right: 15,
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: CircleAvatar(
                          radius: 20,
                          child: Icon(
                            Icons.arrow_back_rounded,
                            color: Themes.color,
                          ),
                          backgroundColor: Themes.color2,
                        ),
                      )),
                  Positioned(
                      right: 70,
                      child: InkWell(
                        onTap: () {
                          Get.defaultDialog(
                            title: "الإبلاغ عن المنتج",
                            titlePadding: EdgeInsets.only(top: 20),
                            backgroundColor: Colors.white,
                            titleStyle: Themes.headline1,
                            radius: 15,
                            content: Builder(
                              builder: (context) {
                                return Column(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0, vertical: 8),
                                        child:
                                            GetBuilder<ProductDeatilController>(
                                          init: ProductDeatilController(),
                                          builder: (controller) {
                                            return TextField(
                                              onChanged: (newValue) {
                                                controller.set_reportofproduct(
                                                    newValue);
                                              },
                                              keyboardType: TextInputType.text,
                                              maxLines: 4,
                                              decoration: InputDecoration(
                                                  label: Padding(
                                                    padding: EdgeInsets.all(8),
                                                    child: Center(
                                                      child: Text(
                                                        'سبب الشكوى',
                                                        style: Themes.subtitle1,
                                                      ),
                                                    ),
                                                  ),
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Themes.color,
                                                          width: 4.0))),
                                            );
                                          },
                                        )),
                                    SizedBox(
                                      height: 30.0,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        'إرسال',
                                        style: TextStyle(
                                            color: Themes.color2,
                                            fontSize: 16.0),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        primary: Themes.color,
                                        onPrimary: Themes.color,
                                        shape: BeveledRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          );
                        },
                        child: CircleAvatar(
                          radius: 20,
                          child: Icon(
                            Icons.report,
                            color: Themes.color,
                          ),
                          backgroundColor: Themes.color2,
                        ),
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  child: Text(
                    "السعر 455000 ل.س",
                    style: Themes.subtitle2,
                  ),
                  alignment: AlignmentDirectional.topEnd,
                ),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(ShopProfile());
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage('images/shop2.jpg'),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(ShopProfile());
                        },
                        child: const Text(
                          "اسم المتجر",
                          style: Themes.bodyText1,
                          maxLines: 2,
                        ),
                      ),
                      const Text("عدد المبيعات", style: Themes.subtitle2),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.15,
                  ),
                  InkWell(
                    // customBorder: CircleBorder(
                    //   side: BorderSide(
                    //    style: BorderStyle.none
                    //   )
                    // ),
                    onTap: () {},
                    child: CircleAvatar(
                      backgroundColor: Themes.color2,
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {},
                    child: CircleAvatar(
                      backgroundColor: Themes.color2,
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        color: Themes.color,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(ChatDetails());
                    },
                    child: CircleAvatar(
                      backgroundColor: Themes.color2,
                      child: Icon(
                        Icons.send,
                        color: Colors.blue,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "لمحة عامة عن المنتج",
                  style: Themes.bodyText1,
                ),
              ),
              Divider(),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 2,
                        child: Text(
                          "اللون",
                          style: Themes.bodyText1,
                        )),
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 35,
                        child: Obx(() => DropdownButtonFormField(
                              isDense: true,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              hint: Text("اختر"),
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10, 0.001, 12, 0.001),
                                  filled: true,
                                  fillColor: Colors.white),
                              value: controller.selectedColor.value,
                              onChanged: (newValue) {
                                controller
                                    .setSelectedColor(newValue.toString());
                              },
                              validator: (val) {
                                return controller
                                    .validate_color(val.toString());
                              },
                              items: controller.Colorlist.map((item) {
                                return DropdownMenuItem(
                                  child: Text(
                                    item,
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black,
                                    ),
                                  ),
                                  value: item,
                                );
                              }).toList(),
                            )),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(""),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 2,
                        child: Text(
                          "مادة الصنع",
                          style: Themes.bodyText1,
                        )),
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 35,
                        child: Obx(() => DropdownButtonFormField(
                              isDense: true,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              hint: Text("اختر"),
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10, 0.001, 12, 0.001),
                                  filled: true,
                                  fillColor: Colors.white),
                              value: controller.selectedColor.value,
                              onChanged: (newValue) {
                                controller
                                    .setSelectedColor(newValue.toString());
                              },
                              validator: (val) {
                                return controller
                                    .validate_color(val.toString());
                              },
                              items: controller.Colorlist.map((item) {
                                return DropdownMenuItem(
                                  child: Text(
                                    item,
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black,
                                    ),
                                  ),
                                  value: item,
                                );
                              }).toList(),
                            )),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(""),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 2,
                        child: Text(
                          "الحجم",
                          style: Themes.bodyText1,
                        )),
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 35,
                        child: Obx(() => DropdownButtonFormField(
                              isDense: true,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              hint: Text("اختر"),
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10, 0.001, 12, 0.001),
                                  filled: true,
                                  fillColor: Colors.white),
                              value: controller.selectedColor.value,
                              onChanged: (newValue) {
                                controller
                                    .setSelectedColor(newValue.toString());
                              },
                              validator: (val) {
                                return controller
                                    .validate_color(val.toString());
                              },
                              items: controller.Colorlist.map((item) {
                                return DropdownMenuItem(
                                  child: Text(
                                    item,
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black,
                                    ),
                                  ),
                                  value: item,
                                );
                              }).toList(),
                            )),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(""),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 20.0, right: 20.0, left: 20.0),
                child: Text(
                  "الوقت المتوقع للتسليم بدءا من قبول الطلب 10 أيام",
                  style: Themes.bodyText1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 20.0, right: 20.0, left: 20.0),
                child: Text(
                  " يمكن تبديل المنتج فقط وذلك خلال 24 ساعة من وقت الاستلام وذلك عبر الاتصال على الرقم 098877778 مع توضيح ذكر التبديل",
                  style: Themes.subtitle2,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 20.0, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 2,
                        child: Text(
                          "هل ترغب في تغليف المنتج",
                          style: Themes.subtitle1,
                        )),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: 10,
                              ), //SizedBox
                              Obx(
                                () => controller.chexkboxValue.value == null
                                    ? CircularProgressIndicator()
                                    : Radio(
                                        value: 'yes',
                                        groupValue: controller.chexkboxValue,
                                        onChanged: (val) {
                                          controller
                                              .setchexkboxValue(val.toString());
                                        }),
                              ),
                              SizedBox(width: 5),
                              Text(
                                'نعم',
                                style: Themes.subtitle2,
                              ),

                              SizedBox(width: 10), //SizedBox

                              Obx(
                                () => controller.chexkboxValue.value == null
                                    ? CircularProgressIndicator()
                                    : Radio(
                                        value: 'no',
                                        groupValue: controller.chexkboxValue,
                                        onChanged: (val) {
                                          controller
                                              .setchexkboxValue(val.toString());
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
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 20.0, left: 20, right: 20),
                child: Center(
                    child: InkWell(
                  onTap: () {
                    Get.to(Seggestions(title: "منتجات مشابهة"));
                  },
                  child: Text(
                    "منتجات مشابهة",
                    style: Themes.headline2,
                  ),
                )),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Stack(
                          children: <Widget>[
                            InkWell(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                height:
                                    MediaQuery.of(context).size.height * 0.25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage('images/9.jpg'),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              onTap: () {
                                //  Get.to(ProductDeatil()) ;
                              },
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: InkWell(
                                  onTap: () {
                                    /////Action
                                  },
                                  child: CircleAvatar(
                                    child: Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                      size: 22,
                                    ),
                                    backgroundColor: Themes.color2,
                                    radius: 17,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.2),
                child: Divider(),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 20.0, left: 20, right: 20),
                child: Center(
                    child: Text(
                  "تقييمات المنتج",
                  style: Themes.headline2,
                )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Card(
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      Obx(
                        () => ListView.builder(
                            itemCount: controller.size_list.value,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ListTile(
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("بشرى ابوحمزة"),
                                          Text(
                                            "12/3/2020",
                                            style: Themes.subtitle2,
                                          ),
                                        ],
                                      ),
                                      leading: CircleAvatar(
                                        radius: 50,
                                        backgroundImage:
                                            AssetImage('images/shop2.jpg'),
                                        backgroundColor: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width -
                                          50,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          side: BorderSide(
                                            color: Colors.grey,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Text(
                                              "متجر رائع ومنتجات جيدة جدا...اتمنى عرض منتجات جديدة باستمرار"),
                                        ),
                                        margin: EdgeInsets.all(10),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: InkWell(
                            onTap: () {
                              controller.increment_size();
                            },
                            child: Text("عرض المزيد")),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ));
  }
}

/*
    // showDialog(
                          //     context: context,
                          //     builder: (context) {
                          //       return StatefulBuilder(
                          //         builder: (context, setState) {
                          //           return AlertDialog(
                          //             title:Center(child: Text( "ما هو تقييمك للمتجر الفلاني؟" , style: Themes.headline1,)),
                          //                 titlePadding: EdgeInsets.only(top: 20),
                          //                 backgroundColor: Colors.white,
                          //
                          //
                          //             content: SingleChildScrollView(
                          //               child: Container(
                          //                 height: MediaQuery.of(context).size.height * 0.75,
                          //                 width: MediaQuery.of(context).size.width * 0.9,
                          //                 child: EvaluationDialoge(),
                          //               ),
                          //             ),
                          //             actions: [
                          //           Padding(
                          //               padding: const EdgeInsets.only(right: 30.0),
                          //               child: RaisedButton(
                          //                 color: Themes.color,
                          //                     onPressed: () {
                          //                   Get.back();
                          //                     },
                          //                     child : Text('تخطي' , style: TextStyle(color: Colors.white))
                          //                 ),
                          //             ),
                          //              Padding(
                          //                 padding: const EdgeInsets.only(left :30.0),
                          //           child: RaisedButton(
                          //           color: Themes.color,
                          //
                          //           onPressed: () {  },
                          //           child : Text('تقييم' , style: TextStyle(color: Colors.white))
                          //           ),
                          //              )
                          //               // FlatButton(
                          //               //   child: Text("Annuler"),
                          //               //   onPressed: () {
                          //               //     Navigator.of(context)
                          //               //         .pop(); // dismiss dialog
                          //               //   },
                          //               // ),
                          //             ],
                          //           );
                          //         },
                          //       );
                          //     });
 */

// Get.defaultDialog(
//     title: "ما هو تقييمك للمتجر الفلاني؟",
//     titlePadding: EdgeInsets.only(top: 20),
//     backgroundColor: Colors.white,
//     titleStyle: Themes.headline1,
//
//     content :
//
//
//     EvaluationDialoge(),
//   cancel:Padding(
//     padding: const EdgeInsets.only(right: 30.0),
//     child: RaisedButton(
//       color: Themes.color,
//           onPressed: () {
//         Get.back();
//           },
//           child : Text('تخطي' , style: TextStyle(color: Colors.white))
//       ),
//   ),
//
//   confirm: Padding(
//     padding: const EdgeInsets.only(left :30.0),
//     child: RaisedButton(
//         color: Themes.color,
//
//         onPressed: () {  },
//           child : Text('تقييم' , style: TextStyle(color: Colors.white))
//       ),
//   ),
//   barrierDismissible: false,
// );
