import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_shop/view/DrawerPages/Notifications.dart';
import 'package:new_shop/view/DrawerPages/ReportPage.dart';
import 'package:new_shop/view/DrawerPages/SettingPage.dart';
import 'package:new_shop/view/auth/LoginView.dart';
import '../../utls/Themes.dart';
import '../DrawerPages/GiftRequest.dart';

class myDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return

      Drawer(

      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Themes.color,
            ),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/shop.png'),
                  radius: 50,
                ),
                Text("اسم المستخدم", style: TextStyle(color: Colors.white),)
              ],
            ),
          ),
          SizedBox(height: 25,),
          ListTile(
            leading: Icon(Icons.present_to_all),
            title: const Text('طلب هدية', style: Themes.bodyText1,),
            onTap: () {
              Get.to(GiftRequest()) ;
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications_active),
            title: const Text('الإشعارات', style: Themes.bodyText1,),
            onTap: () {
              Get.to(NotificationPage()) ;

            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: const Text('الإعدادات', style: Themes.bodyText1,),
            onTap: () {
              Get.to(SettingPage()) ;

            },
          ),
          ListTile(
            leading: Icon(Icons.report),
            title: const Text('إبلاغ', style: Themes.bodyText1,),
            onTap: () {
              Get.to(ReportPage()) ;

            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: const Text('تسجيل الخروج', style: Themes.bodyText1,),
            onTap: () {
              Get.to(LoginView()) ;

            },
          ),
        ],
      ),

    );


  }

}