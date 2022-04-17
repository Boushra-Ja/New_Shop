import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_shop/logic/controllers/OrderController.dart';
import 'package:new_shop/utls/Themes.dart';
import 'package:new_shop/view/Products.dart';

class Orderes extends GetView<OrderController> {
  int _value = 1;
  List<int> _dropdownItems = [
    1, 2,3,4,5,6,7,8,9,10
  ];
  int selectedValue = 1;

  List<Widget> _dropdownItems2 = [
   Text ("دمشق"),Text("صحنايا"),Text("درعا"),
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(builder: (controller) {
      return
        Directionality(
          textDirection: TextDirection.rtl,
          child:
          Scaffold(
              backgroundColor: Colors.purple[50],
              body:

            ListView(children: [
             Container(  margin: EdgeInsets.only(top:10,right: 10),child:  Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 CircleAvatar(backgroundColor: Colors.white,
                   child: IconButton(onPressed: (){
                     // Get.offAllNamed("/HomePage");
                     Get.back();

                   },
                     icon: Icon(Icons.arrow_back,color: Colors.purple,),),)],),),
              Container(
                margin: EdgeInsets.only(top:10),
                // width: MediaQuery.of(context).size.width ,
                // height:MediaQuery.of(context).size.height ,

                padding: new EdgeInsets.all(10.0),
                child: Card(
                  elevation:100,
                    shape:
                    RoundedRectangleBorder(

                      borderRadius: BorderRadius.circular(70),),
                  child: Column(children: [
                    Center(child:
                      RichText(
                      text: const TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 25),
                      children: <TextSpan>[
                        TextSpan(text: 'الطلب 1', style: TextStyle(decoration: TextDecoration.underline))
                      ],
                    ),
              )
                   ),
                    Padding(padding: const EdgeInsets.only(right: 30.0,top:20),
                        child:Row(children: [
                           Text("اسم المتجر :",style: Themes.headline3),
                           Text(" خيط وسناره ",style: Themes.headline3)],)),
                    Padding(padding: const EdgeInsets.only(right: 30.0,top:20),
                        child:Row(children: [
                          Text("اسم المنتج :",style: Themes.headline3),])),
                    Padding(padding: const EdgeInsets.only(left: 20.0,top:10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width:150,
                                height:150,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: ExactAssetImage('images/100.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  border: Border.all(
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),


                              ),
                            ]
                        )),
                    Padding(padding: const EdgeInsets.only(right: 30.0,top:5),
                        child:Row(children: [
                          Text("الكميه  ",style: Themes.headline3),
                        Container(
                          width: 50,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color:Colors.black,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:
                          Center(
                            child: DropdownButton(
                              value: _value,
                              items: _dropdownItems.map((int item) {
                                return DropdownMenuItem<int>(
                                  child: Text('$item'),
                                  value: item,
                                );
                              }).toList(),
                              onChanged: (value) {
                                // setState(() {
                                //   _value = value;
                                // });
                              },

                            ),
                          ),
                        ),]),


                        ),
                    Padding(padding: const EdgeInsets.only(right: 30.0,top:20),
                        child:Row(children: [
                          Text("سعر المنتج :",style: Themes.headline3),
                          Text("  25000ل.س ",style: Themes.headline3)],)),
                    Padding(padding: const EdgeInsets.only(right: 30.0,top:20),
                        child:
                        RichText(
                          text: const TextSpan(
                            style: TextStyle(color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(text:" السعر بعد الخصم في حال وجوده",style: Themes.headline3),
                              TextSpan(text:"  20000ل.س ",style: Themes.headline3)
                            //  TextSpan(text: 'com', style: TextStyle(decoration: TextDecoration.underline))
                            ],
                          ),
                        )



                       ),
                    Padding(padding: const EdgeInsets.only(top:20),
                        child:
                        Divider(
                            thickness:  1 ,
                            color: Colors.grey
                        ),),
                    ///////////////////////////////////

                    Padding(padding: const EdgeInsets.only(right: 30.0,top:20),
                        child:Row(children: [
                          Text("اسم المنتج :",style: Themes.headline3),])),
                    Padding(padding: const EdgeInsets.only(left: 20.0,top:10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width:150,
                                height:150,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: ExactAssetImage('images/11.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  border: Border.all(
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),


                              ),
                            ]
                        )),
                    Padding(padding: const EdgeInsets.only(right: 30.0,top:5),
                      child:Row(children: [
                        Text("الكميه  ",style: Themes.headline3),
                        Container(
                          width: 50,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color:Colors.black,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:
                          Center(
                            child: DropdownButton(
                              value: _value,
                              items: _dropdownItems.map((int item) {
                                return DropdownMenuItem<int>(
                                  child: Text('$item'),
                                  value: item,
                                );
                              }).toList(),
                              onChanged: (value) {
                                // setState(() {
                                //   _value = value;
                                // });
                              },

                            ),
                          ),
                        ),]),


                    ),
                    Padding(padding: const EdgeInsets.only(right: 30.0,top:20),
                        child:Row(children: [
                          Text("سعر المنتج :",style: Themes.headline3),
                          Text("  25000ل.س ",style: Themes.headline3)],)),
                    Padding(padding: const EdgeInsets.only(right: 30.0,top:20),
                        child:
                        RichText(
                          text: const TextSpan(
                            style: TextStyle(color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(text:" السعر بعد الخصم في حال وجوده",style: Themes.headline3),
                              TextSpan(text:"  20000ل.س ",style: Themes.headline3)
                              //  TextSpan(text: 'com', style: TextStyle(decoration: TextDecoration.underline))
                            ],
                          ),
                        )



                    ),
                    Padding(padding: const EdgeInsets.only(top:20),
                      child:
                      Divider(
                          thickness:  1 ,
                          color: Colors.grey
                      ),),


                    Padding(padding: const EdgeInsets.only(right: 30.0,top:5),
                      child:Row(children: [
                        Text("  مكان التوصيل  ",style: Themes.headline3),
                        Container(
                          width: 100,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color:Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child:
                          Center(
                            child:


                            DropdownButton<String>(
                                hint: Text(
                                  "${controller.io.elementAt(0)}",
                                ),
                                value: controller.selectedValue,
                                onChanged: (newValue) {
                                  print(newValue);
                                  controller.onSelected(newValue!);
                                  },
                                elevation: 10,
                                items: [
                                  for (var data
                                  in controller.io)
                                    DropdownMenuItem(
                                      child: Text(
                                        "${data}",
                                      ),
                                      value: "${data}",
                                    )
                                ]),

                          ),

                        ),]),


                    ),
                    Padding(padding: const EdgeInsets.only(right: 30.0,top:20),
                        child:Row(children: [
                          Text("سعر التوصيل :",style: Themes.headline3),
                          Text("  25980ل.س ",style: Themes.headline3)],)),

                    Padding(padding: const EdgeInsets.only(right:40,left:40,top:20),
                      child:
                      Divider(
                          thickness:  2 ,
                          color: Colors.black
                      ),),

                    Padding(padding: const EdgeInsets.only(right: 30.0,top:20),
                        child:Row(children: [
                          Text(" المبلغ الكلي :",style: Themes.headline3),
                          Text("  5000ل.س ",style: Themes.headline3)],)),

                    Padding(padding: const EdgeInsets.only(top:20),
                      child:Center(child:
                        Container(
                          width: 150,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color:Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child:
                          Center(
                            child: TextButton(onPressed: (){},child: Text("معالجه الطلب",style: TextStyle(color: Colors.black,fontSize: 18),),





                            ),
                          ),

                        ),),


                    ),
                    SizedBox(height: 30,)



                  ],)),),
               SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.only(top:50),
                // width: MediaQuery.of(context).size.width ,
                // height:MediaQuery.of(context).size.height ,

                padding: new EdgeInsets.all(10.0),
                child: Card(
                    elevation:100,
                    shape:
                    RoundedRectangleBorder(

                      borderRadius: BorderRadius.circular(70),),
                    child: Column(children: [
                      Center(child:
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(color: Colors.black, fontSize: 25),
                          children: <TextSpan>[
                            TextSpan(text: 'الطلب 2', style: TextStyle(decoration: TextDecoration.underline))
                          ],
                        ),
                      )
                      ),
                      Padding(padding: const EdgeInsets.only(right: 30.0,top:20),
                          child:Row(children: [
                            Text("اسم المتجر :",style: Themes.headline3),
                            Text("  حفر خشب ",style: Themes.headline3)],)),
                      Padding(padding: const EdgeInsets.only(right: 30.0,top:20),
                          child:Row(children: [
                            Text("اسم المنتج :",style: Themes.headline3),])),
                      Padding(padding: const EdgeInsets.only(left: 20.0,top:10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  width:150,
                                  height:150,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: ExactAssetImage('images/3.jpg'),
                                      fit: BoxFit.fill,
                                    ),
                                    border: Border.all(
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(25),
                                  ),


                                ),
                              ]
                          )),
                      Padding(padding: const EdgeInsets.only(right: 30.0,top:5),
                        child:Row(children: [
                          Text("الكميه  ",style: Themes.headline3),
                          Container(
                            width: 50,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.black,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child:
                            Center(
                              child: DropdownButton(
                                value: _value,
                                items: _dropdownItems.map((int item) {
                                  return DropdownMenuItem<int>(
                                    child: Text('$item'),
                                    value: item,
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  // setState(() {
                                  //   _value = value;
                                  // });
                                },

                              ),
                            ),
                          ),]),


                      ),
                      Padding(padding: const EdgeInsets.only(right: 30.0,top:20),
                          child:Row(children: [
                            Text("سعر المنتج :",style: Themes.headline3),
                            Text("  25000ل.س ",style: Themes.headline3)],)),
                      Padding(padding: const EdgeInsets.only(right: 30.0,top:20),
                          child:
                          RichText(
                            text: const TextSpan(
                              style: TextStyle(color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(text:" السعر بعد الخصم في حال وجوده",style: Themes.headline3),
                                TextSpan(text:"  20000ل.س ",style: Themes.headline3)
                                //  TextSpan(text: 'com', style: TextStyle(decoration: TextDecoration.underline))
                              ],
                            ),
                          )



                      ),

                      ///////////////////////////////////


                      Padding(padding: const EdgeInsets.only(top:20),
                        child:
                        Divider(
                            thickness:  1 ,
                            color: Colors.grey
                        ),),


                      Padding(padding: const EdgeInsets.only(right: 30.0,top:5),
                        child:Row(children: [
                          Text("  مكان التوصيل  ",style: Themes.headline3),
                          Container(
                            width: 100,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.black,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child:
                            Center(
                              child:    DropdownButton<String>(
                                  hint: Text(
                                    "${controller.io2.elementAt(0)}",
                                  ),
                                  value: controller.selectedValue2,
                                  onChanged: (newValue) {
                                    print(newValue);
                                    controller.onSelected2(newValue!);
                                  },
                                  elevation: 10,
                                  items: [
                                    for (var data
                                    in controller.io2)
                                      DropdownMenuItem(
                                        child: Text(
                                          "${data}",
                                        ),
                                        value: "${data}",
                                      )
                                  ]),

                            ),

                          ),]),


                      ),
                      Padding(padding: const EdgeInsets.only(right: 30.0,top:20),
                          child:Row(children: [
                            Text("سعر التوصيل :",style: Themes.headline3),
                            Text("  25980ل.س ",style: Themes.headline3)],)),

                      Padding(padding: const EdgeInsets.only(right:40,left:40,top:20),
                        child:
                        Divider(
                            thickness:  2 ,
                            color: Colors.black
                        ),),

                      Padding(padding: const EdgeInsets.only(right: 30.0,top:20),
                          child:Row(children: [
                            Text(" المبلغ الكلي :",style: Themes.headline3),
                            Text("  5000ل.س ",style: Themes.headline3)],)),

                      Padding(padding: const EdgeInsets.only(top:20),
                        child:Center(child:
                        Container(
                          width: 150,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color:Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child:
                          Center(
                            child: TextButton(onPressed: (){},child: Text("معالجه الطلب",style: TextStyle(color: Colors.black,fontSize: 18),),





                            ),
                          ),

                        ),),


                      ),
                      SizedBox(height: 30,)



                    ],)),)])











    ));});
  }}