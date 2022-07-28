import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/date_picker_theme.dart';
import 'package:flutter_holo_date_picker/widget/date_picker_widget.dart';
import 'package:get/get.dart';
import 'package:new_shop/logic/controllers/TreatBasketController.dart';
import 'package:new_shop/logic/controllers/theme_controller.dart';
import '../../utls/Themes.dart';
import '../logic/controllers/orders/ShoppingBasket.dart';
import '../main.dart';
import '../models/batool/BasketOrderProdutModel.dart';
import '../services/auth_services.dart';
import 'ConstantPages/MyCustomCLipper.dart';

class TreatBasket extends GetView<TreatBasketController> {
  @override
  // value set to false
  bool _value = false;
  //final storage = const FlutterSecureStorage();

  late DateTime _selectedDate;
  List<ShoppingBasket> ListInt=[];
  DateTime now = DateTime.now();

  // App widget tree
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TreatBasketController>(builder: (controller) {

      return Directionality(
          textDirection: TextDirection.rtl,
             child: Scaffold(

                  body: ListView(
                    children: [

                      ClipPath(
                        child: Container(
                          color:Color(0xFFAF3A88),
                          height: MediaQuery.of(context).size.height * 0.11,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                              child: Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          radius: 20,
                                          backgroundColor:  Color(0xFFF5EFF3),
                                          child: Center(
                                            child: IconButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              icon: Icon(
                                                Icons.arrow_back,
                                                color: Colors.black
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]))),
                        ),
                        clipper: MyCustomCLipper(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(

                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFAF3A88)),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child:
                        GetBuilder<TreatBasketController>(
                            init: TreatBasketController(),
                            builder: (controller) {
                              return ListView.builder(
                                  itemCount: controller.maplist
                                      .length,
                                  shrinkWrap: true,
                                  physics:
                                  NeverScrollableScrollPhysics(),
                                  itemBuilder: (
                                      BuildContextcontext,
                                      int i) {
                                    return


                                      Container(child:


                                      CheckboxListTile(

                                          title: Text("${controller.maplist.elementAt(i).product_name}",selectionColor: Colors.deepOrange
                                            ,style: TextStyle(color: Colors.black,fontSize: 20),),
                                          subtitle: Text("${controller.maplist.elementAt(i).selling_price}"),
                                          secondary: const Icon(Icons.code),
                                          autofocus: false,
                                          activeColor: Color(0xFFAF3A88),
                                          checkColor: Colors.white,
                                          selected: controller.chexkboxValue.value[ controller.maplist.elementAt(i).product_id],
                                          value: controller.chexkboxValue.value[ controller.maplist.elementAt(i).product_id],
                                          onChanged: <Boolean>(value) {
                                            controller.chexkboxValue.value[controller.maplist.elementAt(i).product_id] = value;

                                            if(value==true)
                                              {
                                                ListInt.add(controller.maplist.elementAt(i));
                                                print("true");
                                                print(ListInt.elementAt(i).product_id);
                                               print(ListInt.elementAt(i).amount);
                                                print(ListInt.elementAt(i).gift_order);
                                              }
                                             else
                                                {
                                                  ListInt.remove(controller.maplist.elementAt(i));
                                                  print("false"); print(ListInt.toString());}



                                            controller.setchexkboxValue(value, controller.maplist.elementAt(i).product_id);
                                            // print(controller.chexkboxValue);


                                          }),

                                      );
                                  });
                            }),),

                               SizedBox(height: 30,),
                               Container(
                                decoration: BoxDecoration(



                                   borderRadius: BorderRadius.only(
                                     topLeft: Radius.circular(20.0),
                                     topRight: Radius.circular(40.0),
                                     bottomLeft: Radius.circular(40.0),
                                     bottomRight: Radius.circular(20.0),
                                   ),

                                 ),

                                 width: MediaQuery.of(context).size.width,
                                 height: 70,

                                   child: Card(
                                     child:
                                     Text("    الوقت المتوقع للرد على الطلب",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),),


                               ),
                              const SizedBox(height: 30,),


                                   Column(children: [

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
                                            TextStyle(color: Colors.black, fontSize: 20,),
                                            dividerColor:Color(0xFFAF3A88),
                                            backgroundColor:  Color(0xFFF5EFF3),
                                          ),
                                        ),




                                     TextButton(
                              onPressed: ()async{
                                     print('current_date: $_selectedDate');
                                  //   String n=(await (storage.read(key: 'id')))  as String;
                                  //   print(n);


                                      await AuthServices.AddOrder(
                                      store_id: controller.maplist.elementAt(0).store_id.toString(),
                                       delivery_time: "2022-05-10 19:13:31".toString(),
                                       delivery_price: "47",
                                       customer_id: "1");




                                      Get.snackbar("تم الارسال بنجاح ", "");
                              },
                                       child: const Text('ارسال',style: TextStyle(color: Color(0xFFAF3A88)),),),

                                   
                                   
                                   ])
                    ]


             ),



                 floatingActionButton:FloatingActionButton(onPressed: ()async{

                                await ii(context,ListInt);
                 },

                   child: Icon(Icons.send_outlined),

                   backgroundColor: Color(0xFFAF3A88),
                   foregroundColor: Colors.white,
                 )


             ));

});
}}
// Expanded(flex:1,child:  Flexible(child:
//                                                        Text("الوقت المتوقع للرد على الطلب",style: TextStyle(fontSize: 20),),),),
//                                                        Expanded(flex:2,child:  Container(
//                                                          child:
//                                                          Column(
//                                                            children: <Widget>[
//                                                              DatePickerWidget(
//                                                                looping: false, // default is not looping
//                                                                firstDate: DateTime(2022, 01, 01),
//                                                                lastDate: DateTime(2030, 1, 1),
//                                                                initialDate: DateTime(2022, 10, 12),
//
//                                                                dateFormat: "dd-MMM-yyyy",
//                                                                locale: DatePicker.localeFromString('en'),
//                                                                onChange: (DateTime newDate, _) =>
//                                                                _selectedDate = newDate,
//                                                                pickerTheme: const DateTimePickerTheme(
//                                                                  itemTextStyle:
//                                                                  TextStyle(color: Colors.black, fontSize: 20),
//                                                                  dividerColor: Colors.blue,
//                                                                ),
//                                                              ),
//
//                                                              TextButton(
//                                                                onPressed: ()async{
//                                                                  // print('current_date: $_selectedDate');
//                                                                  //
//                                                                  // await AuthServices.Deleverytime(order_id: controller.ListCArt.elementAt(index).order_id, date:  _selectedDate);
//                                                                  //
//                                                                  // Get.snackbar("تم الارسال بنجاح ", "");
//                                                                },
//                                                                child: const Text('ارسال'),),
//
//                                                            ],),
//                                                        ),)




Future ii(context,ListInt){
  return
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
            },
            btnOkOnPress: () async {


              for(int i=0; i<ListInt.length; i++) {


                await AuthServices.AddOrderProduct(
                  product_id: ListInt.elementAt(i).product_id,
                  order_id:1,
                  amount:ListInt.elementAt(i).amount,
                  gift_order:ListInt.elementAt(i).gift_order,
                );}}
          ).show();

          //controller.ListCArt.elementAt(index).amount);



}