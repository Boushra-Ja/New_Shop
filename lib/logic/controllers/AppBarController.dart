import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../main.dart';

class AppBarController extends GetxController{

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKey2 = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKey3 = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKey4 = GlobalKey<ScaffoldState>();
  var col =0.obs;

  var tabIndex = 3;


  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
  GlobalKey<ScaffoldState> getscaffoldKey2 (){
    return _scaffoldKey2 ;
  }

  @override
  void onInit() {
    get();
    super.onInit();
  }

  get()async{
    var c =await storage.read(key: "isDarkMode") ;
    if(c=="false")
    {

      col.value=0;
      print("********************false****************************");

    }
    else {
      col.value=1;
      print("********************true****************************");


    }

  }

  GlobalKey<ScaffoldState> getscaffoldKey (){
    return _scaffoldKey ;
  }
  GlobalKey<ScaffoldState> getscaffoldKey3 (){
    return _scaffoldKey3 ;
  }
  GlobalKey<ScaffoldState> getscaffoldKey4 (){
    return _scaffoldKey4 ;
  }

}