import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utls/Themes.dart';

class myDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.notifications_active),
            title: const Text('الإشعارات', style: Themes.bodyText1,),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: const Text('الإعدادات', style: Themes.bodyText1,),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.report),
            title: const Text('إبلاغ', style: Themes.bodyText1,),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: const Text('تسجيل الخروج', style: Themes.bodyText1,),
            onTap: () {},
          ),
        ],
      ),

    );


  }
}