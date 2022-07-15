import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_shop/logic/controllers/AppBarController.dart';
import 'package:new_shop/logic/controllers/ShopsController/ShopPageController.dart';
import 'package:new_shop/utls/Themes.dart';
import 'package:new_shop/view/Orderes.dart';

class myAppBar extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Row(
        children: [
          SizedBox(width: 5,),

          GetBuilder<AppBarController>(init : AppBarController(),builder: (controller){
              //controller.hh();
            return IconButton(
                onPressed: () {

                  if(controller.getscaffoldKey()!=null)
                     controller.getscaffoldKey().currentState!.openDrawer();
                  if(controller.getscaffoldKey2()!=null)
                      controller.getscaffoldKey2().currentState!.openDrawer();
                  if(controller.getscaffoldKey3()!=null)
                    controller..getscaffoldKey3().currentState!.openDrawer();
                  if(controller.getscaffoldKey4()!=null)
                    controller..getscaffoldKey4().currentState!.openDrawer();

                },
                icon: Icon(
                  Icons.menu,
                  size: 35,
                  color: Themes.color3,
                ));
          }) ,
          SizedBox(width: 10,),
          Container(
            width: MediaQuery.of(context).size.width*0.65,
            height: 42,
            decoration: BoxDecoration(
              border: Border.all(
                color: Themes.color3,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child:


            Row(children: [
              IconButton(
                onPressed: () {

                },
                icon:  Icon(Icons.search ,  color: Themes.color3,
                ),
              ),
              Text("انقر هنا للبحث...")
            ]),
          ),

          SizedBox(width: 8,),
          IconButton(
              onPressed: () {Get.to(()=>Orderes());},
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: 30,
                color: Themes.color3,
              )),
        ],
      ),
    ) ;

  }
}
