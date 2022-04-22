

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:new_shop/view/ConstantPages/RoundedAppBar.dart';

import '../../utls/Themes.dart';
import '../ConstantPages/MyCustomCLipper.dart';

class SettingPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child: Scaffold(

     // appBar: RoundedAppBar(),
      body: ListView(
        children: [
          ClipPath(
            child: Container(
              color: Themes.color,
              height: MediaQuery.of(context).size.height*0.12,
              width: MediaQuery.of(context).size.width,
              child: Center(
                  child: Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Themes.color2,
                              child: Center(
                                child: IconButton(
                                  onPressed: () {Get.back();},
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: Themes.color,
                                  ),
                                ),
                              ),
                            ),
                          ]))

              ),
            ),
            clipper: MyCustomCLipper(),
          ),
          Text("Setting"),
          Text("Setting"),
          Text("Setting"),
          Text("Setting"),
          Text("Setting"),

        ],
      ),
    ));
  }
}