import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_shop/logic/controllers/ShopProfileController.dart';
import 'dart:ui' as ui;
import 'package:new_shop/utls/Themes.dart';
import 'package:new_shop/view/ProductDeatil.dart';
import 'package:new_shop/view/SuggestionPage.dart';

class ShopProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return Directionality(
        textDirection: TextDirection.rtl,
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            body: LayoutBuilder(builder: (_, constraints) {
              final width = constraints.biggest.width;
              final height = constraints.biggest.height;
              return ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 3 + 10,
                    child: Stack(
                      children: [
                        CustomPaint(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                          ),
                          painter: HeaderCurvedContainer(),
                        ),
                        const Positioned(
                            top: 80,
                            right: 20,
                            child: CircleAvatar(
                              backgroundImage: AssetImage('images/shop.png'),
                              radius: 70,
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 45),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "اسم المتجر",
                              style: Themes.headline1,
                            ),
                            const Text(
                              "عدد المبيعات 22",
                              style: Themes.subtitle2,
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 18,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 18,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 18,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 18,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.pink,
                                  size: 18,
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2 - 10,
                        ),
                        InkWell(
                          onTap: () {},
                          child: CircleAvatar(
                            radius: 20,
                            child: const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            backgroundColor: Colors.grey.shade200,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Text("لمحة عن المنتجات التي يقدمها المتجر"),
                  ),
                  const Divider(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Center(
                    child: Text(
                      "للتواصل مع المتجر",
                      style: Themes.headline2,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "رقم الهاتف  ",
                              style: Themes.bodyText1,
                            ),
                            const Icon(
                              Icons.call,
                              size: 15,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.2,
                            ),
                            const Text("0926388788", style: Themes.bodyText1)
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "البريد الالكتروني  ",
                              style: Themes.bodyText1,
                            ),
                            const Icon(
                              Icons.email,
                              size: 15,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05,
                            ),
                            const Text("boshra@gmail.com",
                                style: Themes.bodyText1)
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  GetBuilder<ShopProfileController>(
                    init: ShopProfileController(),
                    builder: (controller) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  controller.setcheck_tap(true);
                                },
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Column(
                                    children: [
                                      const Text(
                                        "المنتجات",
                                        textAlign: TextAlign.center,
                                      ),
                                      Divider(
                                        thickness:
                                            controller.check_tap.value ? 3 : 1,
                                        color: controller.check_tap.value
                                            ? Themes.color
                                            : Colors.grey.shade200,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  controller.setcheck_tap(false);
                                },
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Column(
                                    children: [
                                      Text("التقييمات",
                                          textAlign: TextAlign.center),
                                      Divider(
                                        thickness:
                                            !controller.check_tap.value ? 3 : 1,
                                        color: !controller.check_tap.value
                                            ? Themes.color
                                            : Colors.grey.shade200,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          /////////
                          !controller.check_tap.value
                              ? ListView.builder(
                                  itemCount: 3,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0),
                                      child: Column(
                                        children: [
                                          ListTile(
                                            title: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("بشرى ابوحمزة"),
                                                Text(
                                                  "12/3/2020",
                                                  style: Themes.subtitle2,
                                                ),
                                                Row(
                                                  children: const [
                                                    Icon(
                                                      Icons.star,
                                                      color: Colors.yellow,
                                                      size: 18,
                                                    ),
                                                    Icon(
                                                      Icons.star,
                                                      color: Colors.yellow,
                                                      size: 18,
                                                    ),
                                                    Icon(
                                                      Icons.star,
                                                      color: Colors.yellow,
                                                      size: 18,
                                                    ),
                                                    Icon(
                                                      Icons.star,
                                                      color: Colors.yellow,
                                                      size: 18,
                                                    ),
                                                    Icon(
                                                      Icons.star,
                                                      color: Colors.pink,
                                                      size: 18,
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                            leading: CircleAvatar(
                                              radius: 50,
                                              backgroundImage: AssetImage(
                                                  'images/shop2.jpg'),
                                              backgroundColor: Colors.grey,
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                50,
                                            child: Card(
                                              shape: BeveledRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(30.0),
                                                child: Text(
                                                    "متجر رائع ومنتجات جيدة جدا...اتمنى عرض منتجات جديدة باستمرار"),
                                              ),
                                              margin: EdgeInsets.all(10),
                                            ),
                                          ) ,
                                        ],
                                      ),
                                    );
                                  })
                              : SizedBox(
                                  width: MediaQuery.of(context).size.width ,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30.0),
                                    child: DropdownButtonFormField(
                                      isExpanded: true,
                                      hint: const Padding(
                                        padding: EdgeInsets.only(right: 16.0),
                                        child: Text(
                                          "اختر التصنيف",
                                          style: Themes.bodyText1,
                                        ),
                                      ),
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          contentPadding: EdgeInsets.fromLTRB(
                                              10, 0.001, 12, 0.001),
                                          filled: true,
                                          fillColor: Colors.white),
                                      onChanged: (newValue) {
                                        controller.setselectedSection(newValue) ;
                                      },
                                      validator: (val) {
                                        return null;
                                      },
                                      items: controller.items.map((item) {
                                        return DropdownMenuItem(
                                          child: Text(
                                            item,
                                            textDirection: TextDirection.rtl,
                                            textAlign: TextAlign.start,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w300,
                                              color: Colors.black,
                                            ),
                                          ),
                                          value: item,
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                          const SizedBox(
                            height: 25,
                          ),
                          !controller.check_tap.value ?  const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 60.0),
                            child: Divider(),
                          ) : ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 2,
                              itemBuilder: (BuildContext context, int index) {
                                return Center(
                                  child: Column(
                                    children: [
                                      InkWell(
                                          child:  Text("خياطة", style: Themes.headline3) , onTap: (){
                                            Get.to(SuggestionPage()) ;
                                      },),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      GridView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                        ),
                                        itemCount: 4,
                                        itemBuilder: (context, index) {
                                          return  Container(
                                              width: MediaQuery.of(context).size.width * 0.5,
                                              height:
                                              MediaQuery.of(context).size.height * 0.25,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0 , right:  8.0 , bottom: 10.0),
                                                child:  Stack(
                                                  children: <Widget>[
                                                    InkWell(
                                                      child: Container(

                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(10),
                                                          image: DecorationImage(
                                                              image: AssetImage('images/2.jpg'),
                                                              fit: BoxFit.fill),
                                                        ),
                                                      ),
                                                      onTap: () {
                                                          Get.to(ProductDeatil()) ;
                                                      },
                                                    ),
                                                    Align(
                                                      alignment: Alignment.topRight,
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(right: 8.0),
                                                        child: InkWell(
                                                          onTap: () {
                                                            /////Action
                                                          },
                                                          child: CircleAvatar(
                                                            child: Icon(
                                                              Icons.favorite,
                                                              color: Colors.red,
                                                              size: 22,
                                                            ),
                                                            backgroundColor: Themes.color2,
                                                            radius: 17,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment: Alignment.bottomLeft,
                                                        child:  Text("2500 ل.س" , style: TextStyle(color: Colors.red , fontSize: 12),)

                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                        },
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      InkWell(
                                        child: Text("عرض المزيد",
                                            style: TextStyle(
                                              color: Colors.grey.shade600,
                                            )),
                                        onTap: (){
                                          Get.to(SuggestionPage()) ;

                                        }

                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 30.0),
                                        child: Divider(),
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                    ],
                                  ),
                                );
                              }),
                          !controller.check_tap.value ?   Center(
                            child: InkWell(child: Text("عرض الكل")
                            ,onTap: (){
                              ////Action
                              },
                            ),
                          ) : SizedBox.shrink(),
                        ],
                      );
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              );
            }),
          ),
        ));
  }
}

class HeaderCurvedContainer extends CustomPainter {
  final color = const Color(0xFFAF3A88);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..shader = ui.Gradient.linear(
          const Offset(10, 100), const Offset(450, 100), [color, color]);
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 3, 250, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
