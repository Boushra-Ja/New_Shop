import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_shop/logic/controllers/FavoriteController.dart';
import 'package:new_shop/view/ProductDeatil.dart';
import 'package:new_shop/view/ShopsPages/ShopProfile.dart';
import '../logic/controllers/AppBarController.dart';
import '../utls/Themes.dart';
import 'ConstantPages/AppBar.dart';
import 'ConstantPages/Drawer.dart';

class Favorite extends GetView<FavoriteController> {
  var check_tap;
  final sampleControllerr = Get.put(FavoriteController(), permanent: true);

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
                  body: GetX<FavoriteController>(
                      builder: (c) => Center(
                          child: c.listfavoite.isEmpty && c.listfavoitestore.isEmpty
                              ? Center(child: CircularProgressIndicator())
                              : GetX<FavoriteController>(
                              builder: (c) => Center(
                                  child: c.listfavoite.isEmpty && c.listfavoitestore.isEmpty
                                      ? CircularProgressIndicator()
                                      : GetBuilder<FavoriteController>(
                                      builder: (controller) {
                                        return  Padding(
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
                                                          print(c.listfavoitestore.length);
                                                        },
                                                      ))
                                                ]),
                                                SizedBox(
                                                  height: 20,
                                                ),

                                                /////////////////////////////
                                                controller.Tabbar.value == 2
                                                    ? Flexible(
                                                  child:
                                                  GridView.builder(
                                                    padding: const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                    itemCount: c.listfavoitestore.length,
                                                    itemBuilder: (ctx, i) {
                                                      return

                                                        Container(
                                                        child: Column(
                                                          children: [
                                                         //   Text("OOOOOOOOOOOOOOOOOO"),

                                                                InkWell(
                                                                      onTap: () {
                                                                        Get.to(ProductDeatil());
                                                                      },
                                                                      child: Center(
                                                                        child:

                                                                        CircleAvatar(
                                                                          radius: 50,
                                                                          backgroundImage:
                                                                          NetworkImage(
                                                                            "http://192.168.137.102:8000/uploads/product/${c.listfavoitestore
                                                                                .elementAt(
                                                                                i)
                                                                                .image}",

                                                                          ),
                                                                        ),

                                                                      ),
                                                                    ),


                                                            ///center












                                                            Container(
                                                              margin:
                                                              EdgeInsets.only(right: 40),
                                                              child: Row(
                                                                children: [
                                                                  InkWell(
                                                                    onTap: () {
                                                                      Get.to(ShopProfile());
                                                                    },
                                                                    child: Text("  "+
                                                                      c.listfavoitestore.elementAt(i).name,
                                                                        style:
                                                                        Themes.bodyText2),
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
                                                    child:
                                                    GridView.builder(
                                                      padding: const EdgeInsets.symmetric(
                                                          horizontal: 10),
                                                      itemCount: c.listfavoite.length,

                                                      itemBuilder: (ctx, index) {
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
                                                                    child:  Image  .network(
                                                                      "http://192.168.137.102:8000/uploads/product/${c.listfavoite
                                                                          .elementAt(
                                                                          index)
                                                                          .image}",
                                                                      fit:BoxFit
                                                                          .cover ,
                                                                    ),

                                                                  ),
                                                                ),
                                                              ),
                                                              Center(
                                                                child: InkWell(
                                                                  onTap: () {
                                                                    Get.to(ProductDeatil());
                                                                  },
                                                                  child: Text(
                                                                    "${c.listfavoite.elementAt(index).name}",
                                                                    style: Themes.headline5,
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
                                                                        "${c.listfavoite.elementAt(index).value}" + " تقييم",

                                                                        style: Themes.bodyText1,
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
                                                    )


                                                ),

















                                              ]);
                                            },
                                          ),
                                        );
                                      })))))



              ));
        });
  }
}
