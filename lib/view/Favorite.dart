import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_shop/logic/controllers/FavoriteController.dart';
import 'package:new_shop/view/ProductDeatil.dart';
import 'package:new_shop/view/ShopsPages/ShopProfile.dart';
import '../logic/controllers/AppBarController.dart';
import '../utls/Themes.dart';
import 'ConstantPages/AppBar.dart';
import 'ConstantPages/Drawer.dart';

class Favorite extends StatelessWidget {
  var check_tap;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppBarController>(
        init: AppBarController(),
        builder: (controller2) {
          return Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                  key: controller2.getscaffoldKey4(),
                  drawer: myDrawer(),
                  body: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: GetBuilder<FavoriteController>(
                      init: FavoriteController(),
                      builder: (controller) {
                        return Column(children: <Widget>[
                          myAppBar(),
                          SizedBox(
                            height: 30,
                          ),
                          Row(children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: InkWell(
                                  child: Container(
                                      child: Center(
                                    child: Column(
                                      children: [
                                        Text("المنتجات",
                                            style: controller.Tabbar.value == 2
                                                ? Themes.bodyText5
                                                : Themes.headline1,
                                            textAlign: TextAlign.center),
                                        Divider(
                                          thickness:
                                              controller.Tabbar.value == 1
                                                  ? 3
                                                  : 1,
                                          color: controller.Tabbar.value == 1
                                              ? Themes.color
                                              : Colors.grey.shade200,
                                          // indent: MediaQuery.of(context).size.width * 0.5
                                        )
                                      ],
                                    ),
                                  )),
                                  onTap: () {
                                    controller.Tabbar.value = 1;
                                    controller.changeTabbar(1);
                                    print(controller.Tabbar.value);
                                  },
                                )),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: InkWell(
                                  child: Container(
                                      child: Center(
                                    child: Column(
                                      children: [
                                        Text("المتاجر",
                                            style: controller.Tabbar.value == 2
                                                ? Themes.headline1
                                                : Themes.bodyText5,
                                            textAlign: TextAlign.center),
                                        Divider(
                                          thickness:
                                              controller.Tabbar.value == 2
                                                  ? 3
                                                  : 1,
                                          color: controller.Tabbar.value == 2
                                              ? Themes.color
                                              : Colors.grey.shade200,
                                        )
                                      ],
                                    ),
                                  )),
                                  onTap: () {
                                    controller.Tabbar.value = 2;
                                    controller.changeTabbar(2);
                                    print(controller.Tabbar);
                                  },
                                ))
                          ]),

                          SizedBox(
                            height: 20,
                          ),

                          /////////////////////////////
                          controller.Tabbar.value == 2
                              ? Flexible(
                                  child: GridView.builder(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    itemCount: 10,
                                    itemBuilder: (ctx, i) {
                                      return Container(
                                        child: Column(
                                          children: [
                                            Center(
                                                child: InkWell(
                                              onTap: () {
                                                Get.to(ShopProfile());
                                              },
                                              child: CircleAvatar(
                                                backgroundImage: i == 0
                                                    ? AssetImage(
                                                        "images/shop2.jpg")
                                                    : i == 1
                                                        ? AssetImage(
                                                            "images/4.jpg")
                                                        : AssetImage(
                                                            "images/8.jpg"),
                                                //NetworkImage('https://cdn.pixabay.com/photo/2013/05/11/08/28/sunset-110305_1280.jpg'),
                                                backgroundColor:
                                                    Colors.red.shade800,
                                                radius: 45,
                                              ),
                                            )),
                                            Container(
                                              margin:
                                                  EdgeInsets.only(right: 40),
                                              child: Row(
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      Get.to(ShopProfile());
                                                    },
                                                    child: Text('اسم المتجر ',
                                                        style:
                                                            Themes.bodyText1),
                                                  ),
                                                  Icon(
                                                    Icons.star_outline_rounded,
                                                    color: Colors.blue,
                                                    size: 20,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                                margin:
                                                    EdgeInsets.only(right: 40),
                                                child: Row(
                                                  children: const [
                                                    Icon(
                                                      Icons.star,
                                                      color: Colors.yellow,
                                                      size: 15,
                                                    ),
                                                    Icon(
                                                      Icons.star,
                                                      color: Colors.yellow,
                                                      size: 15,
                                                    ),
                                                    Icon(
                                                      Icons.star,
                                                      color: Colors.yellow,
                                                      size: 15,
                                                    ),
                                                    Icon(
                                                      Icons.star,
                                                      color: Colors.yellow,
                                                      size: 15,
                                                    ),
                                                    Icon(
                                                      Icons.star,
                                                      color: Colors.pink,
                                                      size: 15,
                                                    )
                                                  ],
                                                )),
                                          ],
                                        ),
                                        //   ],
                                        // ),
                                      );
                                    },
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                    ),
                                  ),
                                )
                              : Flexible(
                                  child: GridView.builder(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  itemCount: 4,
                                  itemBuilder: (ctx, i) {
                                    return Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      margin: EdgeInsets.all(5),
                                      padding: EdgeInsets.all(5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {
                                                Get.to(ProductDeatil());
                                              },
                                              child: Center(
                                                child: i == 0
                                                    ? Image.asset(
                                                        "images/th.jpg")
                                                    : i == 1
                                                        ? Image.asset(
                                                            "images/tt.jpg")
                                                        : i == 3
                                                            ? Image.asset(
                                                                "images/100.jpg")
                                                            : Image.asset(
                                                                "images/44.jpg"),
                                              ),
                                            ),
                                          ),
                                          Center(
                                            child: InkWell(
                                              onTap: () {
                                                Get.to(ProductDeatil());
                                              },
                                              child: Text(
                                                'حقيبة كروشيه',
                                                style: Themes.bodyText1,
                                              ),
                                            ),
                                          ),
                                          Container(
                                              child: Row(
                                            children: [
                                              Icon(
                                                Icons.tag_faces_outlined,
                                                color: Colors.orange,
                                                size: 20,
                                              ),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Text(
                                                '(15 تقييم)',
                                                style: Themes.subtitle3,
                                              ),
                                            ],
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                          )),
                                        ],
                                      ),
                                    );
                                  },
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 50,
                                    mainAxisExtent: 200,
                                  ),
                                )),
                        ]);
                      },
                    ),
                  )));
        });
  }
}
