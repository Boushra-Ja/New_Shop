import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarController extends GetxController{
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKey2 = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> getscaffoldKey (){
    return _scaffoldKey ;
  }
  GlobalKey<ScaffoldState> getscaffoldKey2 (){
    return _scaffoldKey2 ;
  }
 var tabIndex = 3;

 void changeTabIndex(int index) {
   tabIndex = index;
   update();
 }







}