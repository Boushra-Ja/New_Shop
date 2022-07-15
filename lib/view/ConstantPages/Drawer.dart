import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_shop/logic/controllers/DrawerController/SettingPageController.dart';
import 'package:new_shop/view/DrawerPages/Notifications.dart';
import 'package:new_shop/view/DrawerPages/ReportPage.dart';
import 'package:new_shop/view/DrawerPages/SettingPage.dart';
import 'package:new_shop/view/auth/LoginView.dart';
import '../../main.dart';
import '../../utls/Themes.dart';
import '../DrawerPages/GiftRequest.dart';
import '../Mazad.dart';
import '../chatting/Chat.dart';

class myDrawer extends GetView<SettingPageController> {

  @override
  Widget build(BuildContext context) {
    return

      GetX<SettingPageController>(
        builder: (c) =>  Drawer(
          backgroundColor:  controller.col==1?
          Colors.black
              :Colors.white,

        //storage.read(key: "isDarkMode") != null ?
       //  Colors.black,
             //:Colors.white,
      //ColorScheme.dark():ColorScheme.light(),

     child: GetX<SettingPageController>(
       builder: (c) =>  ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color:
              controller.col==1?Colors.grey:Themes.color,



            ),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/shop.png'),
                  radius: 50,
                ),
                Text("اسم المستخدم", style: TextStyle(
                   color:
                controller.col==1?Colors.white:Colors.black,


                  // color: Colors.white
                ),)
              ],
            ),
          ),
          SizedBox(height: 25,),
          ListTile(
            leading: Icon(Icons.present_to_all),
            title:  Text('طلب هدية', style: TextStyle(  color:
            controller.col==1?Colors.white:Colors.black,)

           // Themes.bodyText1,
            ),
            onTap: () {
              Get.to(GiftRequest()) ;
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications_active),
            title:  Text('الإشعارات', style:
                TextStyle(  color:
                controller.col==1?Colors.white:Colors.black,)

          //  Themes.bodyText1,
            ),
            onTap: () {
              Get.to(NotificationPage()) ;

            },
          ),
          ListTile(
            leading: Icon(Icons.chat),
            title:  Text('المحادثات', style: TextStyle(  color:
            controller.col==1?Colors.white:Colors.black,),
           // Themes.bodyText1,
            ),
            onTap: () {
              Get.to(Chat()) ;

            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title:  Text('الإعدادات', style:TextStyle(  color:
            controller.col==1?Colors.white:Colors.black,),
          //  Themes.bodyText1,
            ),
            onTap: () {
              Get.to(SettingPage()) ;

            },
          ),
          ListTile(
            leading: Icon(Icons.report),
            title:  Text('إبلاغ', style: TextStyle(  color:
            controller.col==1?Colors.white:Colors.black,),
            //Themes.bodyText1,
            ),
            onTap: () {
              Get.to(ReportPage()) ;

            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title:  Text('تسجيل الخروج', style:TextStyle(  color:
            controller.col==1?Colors.white:Colors.black,),
          //  Themes.bodyText1,
            ),
            onTap: () {
             // Get.to(LoginView()) ;

              Get.to(mazad());
            },
          ),
        ],
      ),),),

    );


  }

}