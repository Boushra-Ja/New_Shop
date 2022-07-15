import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_shop/logic/controllers/AppBarController.dart';
import 'package:new_shop/logic/controllers/DrawerController/SettingPageController.dart';
import 'package:new_shop/utls/Themes.dart';
import 'package:new_shop/view/Carts.dart';

class myAppBar extends GetView<SettingPageController>{

  @override
  Widget build(BuildContext context) {
    return

      GetX<AppBarController>(
        builder: (c) =>
        Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Row(
        children: [
          SizedBox(width: 5,),

          GetBuilder<AppBarController>(init : AppBarController(),builder: (controller){
              //controller.hh();
            return IconButton(
                onPressed: () {

                   controller.getscaffoldKey().currentState!.openDrawer();
                   controller.getscaffoldKey2().currentState!.openDrawer();
                   controller..getscaffoldKey3().currentState!.openDrawer();
                   controller..getscaffoldKey4().currentState!.openDrawer();

                },
                icon:
                GetX<SettingPageController>(
                builder: (c) =>Icon(
                  Icons.menu,
                  size:35,
                  color: c.col==0 ? Colors.black
                      :Colors.white,
                )));
          }) ,

          SizedBox(width: 10,),


          Container(
            width: MediaQuery.of(context).size.width*0.65,
            height: 42,
            decoration: BoxDecoration(
              border: Border.all(
                color:controller.col==0?
                Colors.black:Colors.white,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child:


            Row(children: [
              IconButton(
                onPressed: () {
                  print("search");
                },
                icon:  Icon(Icons.search ,  color: Colors.black,
                ),
              ),
              Text(" انقر هنا للبحث ...",style: TextStyle(  color:
              controller.col==1?Themes.color:Colors.black,),),
            ]),
          ),



          SizedBox(width: 8,),
          IconButton(
              onPressed: () {Get.toNamed('/Cart');},
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: 30,
                color:  controller.col==0? Colors.black
                    :Colors.white,
              )),
        ],
      ),
    )) ;

  }
}
