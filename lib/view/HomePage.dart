import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_shop/logic/controllers/AppBarController.dart';
import 'package:new_shop/logic/controllers/HomePageController.dart';
import 'package:new_shop/view/My_Orders/Orders.dart';
import 'package:new_shop/view/Favorite.dart';
import 'package:new_shop/view/ShopsPages/ShopsPage.dart';
import '../utls/Themes.dart';
import 'Products.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppBarController>(builder: (_controller) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: SizedBox.expand(
            child: PageView(

              physics: ScrollPhysics(parent: NeverScrollableScrollPhysics()),
              children: [
                Product(),
                Favorite(),
                ShopsPage(),
                Orders(),
              ],
              controller: controller.pageController,
            ),
          ),
        ),

        bottomNavigationBar: Obx(
              () => FancyBottomNavigation(
                textColor: Themes.color3,
            tabs: [
              TabData(
                iconData: Icons.account_box,
                title: 'orders',

              ),
              TabData(
                iconData: Icons.favorite,
                title:'favourite'
              ),
              TabData(
                iconData: Icons.shopping_cart,
                title: 'shops'  ,
              ),

              TabData(
                iconData: Icons.home,
                title: 'products',
              ),

            ],

            onTabChangedListener: (position) {
              controller.currentIndex.value = position;
              controller.pageController.jumpToPage(position);
            },
            initialSelection: controller.currentIndex.value,
            key: controller.bottomNavigationKey,
            inactiveIconColor: Colors.grey,
            circleColor: Themes.color,
          ),
        ),
      );
    });
  }
}
