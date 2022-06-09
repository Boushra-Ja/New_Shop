import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_shop/logic/controllers/DrawerController/ReportPageController.dart';
import 'package:new_shop/utls/Themes.dart';

class ReportPage extends GetView<ReportPageController>{

  @override
  Widget build(BuildContext context) {
    ReportPageController controller2 = Get.put(ReportPageController()) ;

    return Directionality(textDirection: TextDirection.rtl, child: Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(right: 20.0 ,left: 20.0, top: 60),
        child: ListView(

          children: [
            Row(
              children: [
                Expanded(flex :2 ,child: Text("اسم المستخدم" , style: Themes.headline1,)),
                Expanded(flex : 3,child:  GetBuilder<ReportPageController>(
                  init: ReportPageController(),
                  builder: ( controller) {
                  return TextFormField(
                   // controller: controller.name_controller,
                    keyboardType: TextInputType.text,
                    validator: (val) {
                     return controller.validate_shopname(val) ;
                    },
                    onSaved: (val) {
                      controller.set_username(val) ;
                    },
                    initialValue: "",
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(30)),
                        hintText: 'ادخل هنا....',
                        hintStyle: Themes.subtitle1,
                        contentPadding: EdgeInsets.fromLTRB(
                            10.0, 0.01, 20.0, 0.01),
                        filled: true,
                        fillColor: Colors.white),
                  );
                },))

              ],
            ) ,
            SizedBox(height: 30,),
            Row(
              children: [
                Expanded(flex :2 ,child: Text("اسم المتجر" , style: Themes.headline1,)),

                Expanded(flex : 3,child:  Obx(
                      ()=>  DropdownButtonFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(30)),
                              contentPadding: EdgeInsets.fromLTRB(
                                  10, 0.001, 12, 0.001),
                              filled: true,
                              fillColor: Colors.white),
                      hint: Text(
                        "${controller2.shopsList.elementAt(0)}",
                      ),
                      value: controller2.selectedshopname.value,
                      onChanged: (newValue) {
                        controller2.set_selectedshopname(newValue.toString());

                      },
                      items: [
                        for (var data
                        in controller2.shopsList)
                          DropdownMenuItem(
                            child: Text(
                              "${data}",
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                              ),
                            ),
                            value: "${data}",
                          )
                      ]),
                ))

              ],
            ) ,
            SizedBox(height: 30,),
            Text("محتوى الشكوى" , style: Themes.bodyText1, textAlign: TextAlign.start,),
            GetBuilder<ReportPageController>(
                init: ReportPageController(),
                builder: ( controller) {
                  return TextFormField(
                      // controller: controller.name_controller,
                      keyboardType: TextInputType.text,
                      validator: (val) {
                        return controller.validate_content(val) ;
                      },
                      onSaved: (val) {
                        controller.set_content(val) ;
                      },
                      initialValue: "",
                      style: Themes.headline1 ,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Themes.color),
                              borderRadius:
                              BorderRadius.circular(10)),
                          hintText: 'ادخل هنا....',
                          hintStyle: Themes.subtitle1,
                          contentPadding: EdgeInsets.fromLTRB(
                              10.0, 40, 20.0,40),
                          filled: true,
                          fillColor: Colors.white),
                    );},),
            SizedBox(height: 25,) ,
            Align(
                alignment: AlignmentDirectional.topEnd,
                child: FloatingActionButton.extended(onPressed: (){}, label: Text("إرسال"),
                backgroundColor: Themes.color,
                  //icon: Icon(Icons.send , color: Themes.color2, size: 24,),
                ),
              ),
            SizedBox(height: 25,) ,
            Container(
                height:
                MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/report.png'),
                      fit: BoxFit.contain),
                ),
              ),

          ],

        ),
      ),
    ));
  }


}
