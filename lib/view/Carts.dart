
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/date_picker_theme.dart';
import 'package:flutter_holo_date_picker/widget/date_picker_widget.dart';
import 'package:get/get.dart';
import 'package:new_shop/logic/controllers/CartController.dart';
import 'package:new_shop/utls/Themes.dart';
import 'package:slimy_card/slimy_card.dart';
import '../logic/controllers/DrawerController/SettingPageController.dart';
import '../logic/controllers/FavoriteController.dart';
import '../main.dart';
import '../services/auth_services.dart';
// import 'package:intl/intl.dart';

class Carts extends GetView<CartController> {
  final sampleControllerr = Get.put(CartController(), permanent: true);
  final sampleController3 = Get.put(SettingPageController(), permanent: true);

  static int  i=1;

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
                      c.ListCArt.isEmpty  &&   c.check.value=='DATA'
                          ? Center(child: CircularProgressIndicator()):
                      c.ListCArt.isEmpty  &&   c.check.value=='NODATA'?
                          Text("noooo")

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
                                                                    index>=1
                                                                   ? controller.ListCArt.elementAt(index).order_id!=controller.ListCArt.elementAt(index-1).order_id
                                                                                ? Container(
                                                                                   width: MediaQuery.of(context).size.width,
                                                                                    height: 300,
                                                                                  child:
                                                                                   Column(children: [
                                                                                     Card(child:
                                                                                      Center(
                                                                                       child:Text(" الطلب ${controller.ListCArt.elementAt(index).order_id}",
                                                                                         style: TextStyle(fontSize: 20),)),),
                                                                                     Flexible(child:
                                                                                     Text("الوقت المتوقع للرد على الطلب",style: TextStyle(fontSize: 20),),),
                                                                                     Container(
                                                                                       child: Column(
                                                                                         children: <Widget>[
                                                                                           DatePickerWidget(
                                                                                             looping: false, // default is not looping
                                                                                             firstDate: DateTime(2022, 01, 01),
                                                                                             lastDate: DateTime(2030, 1, 1),
                                                                                             initialDate: DateTime(2022, 10, 12),

                                                                                             dateFormat: "dd-MMM-yyyy",
                                                                                             locale: DatePicker.localeFromString('en'),
                                                                                             onChange: (DateTime newDate, _) =>
                                                                                             _selectedDate = newDate,
                                                                                             pickerTheme: const DateTimePickerTheme(
                                                                                               itemTextStyle:
                                                                                               TextStyle(color: Colors.black, fontSize: 20),
                                                                                               dividerColor: Colors.blue,
                                                                                             ),
                                                                                           ),
                                                                                           TextButton(
                                                                                             onPressed: ()async{

                                                                                               print('current_date: $_selectedDate');

                                                                                               print(controller.ListCArt.elementAt(index).order_id);


                                                                                              await AuthServices.Deleverytime(order_id: controller.ListCArt.elementAt(index).order_id, date:  _selectedDate);


                                                                                               Get.snackbar("  تم الارسال بنجاح", "");
                                                                                             },
                                                                                             child: const Text('ارسال'),
                                                                                           ),
                                                                                         ],
                                                                                       ),
                                                                                       // ),
                                                                                     ),


                                                                             ],)
                                                                            )
                                                                                :Text("")
                                                                    :Text(""),
                                                                    Container(
                                                                      width: MediaQuery.of(context).size.width,
                                                                      height: index==0?300:25,
                                                                      child:
                                                                      index==0?
                                                                      Column(children: [


                                                                        Card(child: Center(
                                                                            child:Text(" الطلب ${controller.ListCArt.elementAt(index).order_id}",
                                                                              style: TextStyle(fontSize: 20),)),),
                                                                        Flexible(child:
                                                                        Text("الوقت المتوقع للرد على الطلب",style: TextStyle(fontSize: 20),),),
                                                                        Container(
                                                                          child:
                                                                          Column(
                                                                            children: <Widget>[
                                                                              DatePickerWidget(
                                                                                looping: false, // default is not looping
                                                                                firstDate: DateTime(2022, 01, 01),
                                                                                lastDate: DateTime(2030, 1, 1),
                                                                                initialDate: DateTime(2022, 10, 12),

                                                                                dateFormat: "dd-MMM-yyyy",
                                                                                locale: DatePicker.localeFromString('en'),
                                                                                onChange: (DateTime newDate, _) =>
                                                                                _selectedDate = newDate,
                                                                                pickerTheme: const DateTimePickerTheme(
                                                                                  itemTextStyle:
                                                                                  TextStyle(color: Colors.black, fontSize: 20),
                                                                                  dividerColor: Colors.blue,
                                                                                ),
                                                                              ),

                                                                              TextButton(
                                                                                onPressed: ()async{
                                                                                  print('current_date: $_selectedDate');
                                                                                  print(controller.ListCArt.elementAt(index).order_id);

                                                                                  await AuthServices.Deleverytime(order_id: controller.ListCArt.elementAt(index).order_id, date:  _selectedDate);

                                                                                  Get.snackbar("تم الارسال بنجاح ", "");
                                                                                },
                                                                                child: const Text('ارسال'),),

                                                                            ],),
                                                                        ),
                                                                      ])
                                                                          :Text(""),
                                                                    ),
                                                                    SizedBox(height: 30,),
                                                                    Container(
                                                                        child:
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
                                                                              topCardHeight: 600,
                                                                              bottomCardHeight: 300,
                                                                              borderRadius: 30,
                                                                              slimeEnabled: true,
                                                                              topCardWidget: topCardWidget(index,context,(snapshot.data)
                                                                                  ?"${MyApp.api}/uploads/product/${controller.ListCArt.elementAt(index).myProducts.elementAt(0).image}"
                                                                                  : "${MyApp.api}/uploads/product/${controller.ListCArt.elementAt(index).myProducts.elementAt(0).image}"),
                                                                              bottomCardWidget: bottomCardWidget(index, context),
                                                                            ),
                                                                          ),
                                                                        )),
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
                               Icon(Icons.circle_rounded,color: Colors.black,size: 8,),
                               Flexible(child:  Text(" تقييم المنتج :  ", style: Themes.subtitlebat),),
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
                             Icon(Icons.circle_rounded,color: Colors.black,size: 8,),
                             Flexible(child:   Text("  العدد المطلوب  :", style: Themes.subtitlebat),),
                             const SizedBox(width: 10,),
                             Container(child: Text("${controller.ListCArt.elementAt(index).amount}")),
                     ]),
                       ),
                   Divider(color: sampleController3.col==0? Colors.black12: Colors.white,
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
                         )),
                      Divider(color: sampleController3.col==0? Colors.black12: Colors.white,
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
                                        Flexible(child: Text("  ${(controller.ListCArt.elementAt(index).myProducts.elementAt(0).cost_price *controller.ListCArt.elementAt(index).myProducts.elementAt(0).value_discount)/100}", style: Themes.subtitlebat)),
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
                               )])),
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
                              color:Colors.deepPurple,onPressed: ()
                          async{

                            print("+++++++++++++++++++++++++++++++++++++++++");
                            print( controller.ListCArt.elementAt(index).myProducts.elementAt(0).productId);
                            print( controller.ListCArt.elementAt(index).order_id);
                            print("+++++++++++++++++++++++++++++++++++++++++");

                            await AuthServices.changeAmount(
                                product_id:controller.ListCArt.elementAt(index).myProducts.elementAt(0).productId,

                                order_id: controller.ListCArt.elementAt(index).order_id,
                                amount: controller.ListCArt.elementAt(index).myamount
                           );
                               // .then(
                               controller.onInit();
                                Get.snackbar("تم تعديل العدد", "بنجاح");
                            // );


                            //controller.ListCArt.elementAt(index).amount);
                          })


                        ],),
Container(
  width:MediaQuery.of(context).size.width,
  child:Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    // Expanded(
    //     flex: 1,
    //     child:
        Flexible(child: Text(
          "هل ترغب في تغليف المنتج",
          style: Themes.subtitle1,
        ),),
//),
//     Expanded(
//       flex: 1,
//       child:
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
                    c.setchexkboxValue(
                        value.toString(),
                        c.ListCArt.elementAt(index).order_id);
                    print(c.chexkboxValue) ;
                    print(c.ListCArt.elementAt(index).order_id) ;


                  },
                  //groupValue: '',
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
                builder: (c) =>
                    Radio(
                        value:'no',
                        activeColor: Themes.color,

                        groupValue: c.chexkboxValue.value.elementAt(index),
                        //groupValue: '',

                        onChanged: (val) {
                          c.setchexkboxValue(
                              val.toString(),c.ListCArt.elementAt(index).order_id);
                          print(c.chexkboxValue);
                          print(c.ListCArt.elementAt(index).order_id) ;

                          // c.radio[0]='no';
                        }),),

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
),),


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

