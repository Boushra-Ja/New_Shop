import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_shop/logic/controllers/AppBarController.dart';

class myAppBar extends StatelessWidget{
 // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        children: [
          GetBuilder<AppBarController>(init : AppBarController(),builder: (controller){
            return IconButton(
                onPressed: () {
                  controller.getscaffoldKey().currentState!.openDrawer();
                },
                icon: Icon(
                  Icons.menu,
                  size: 40,
                ));
          }) ,
          SizedBox(width: 15,),
          Container(
            width: MediaQuery.of(context).size.width*0.6,
            height: 45,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(children: [
              IconButton(
                onPressed: () {
                  print("search");
                },
                icon: const Icon(Icons.search),
              ),
              Text(" انقر هنا للبحث ..."),
            ]),
          ),
          SizedBox(width: 15,),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: 35,
                color: Colors.black,
              )),
        ],
      ),
    ) ;

  }
}
