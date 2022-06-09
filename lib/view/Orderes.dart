import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_shop/logic/controllers/OrderController.dart';
import 'package:new_shop/utls/Themes.dart';

class Orderes extends GetView<OrderController> {
  int _value = 1;
  List<int> _dropdownItems = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  int selectedValue = 1;

  List<Widget> _dropdownItems2 = [
    Text("دمشق"),
    Text("صحنايا"),
    Text("درعا"),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(builder: (controller) {
      return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
              backgroundColor: Themes.color2,
              body: ListView(shrinkWrap: true, children: [
                Container(
                  margin: EdgeInsets.only(top: 10, right: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: CircleAvatar(
                          radius: 20,
                          child: Icon(
                            Icons.arrow_back_rounded,
                            color: Themes.color,
                          ),
                          backgroundColor: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: new EdgeInsets.all(10.0),
                  child: Card(
                      elevation: 100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Center(
                              child: Text('الطلب 1', style: Themes.headline5)),
                          Padding(
                              padding:
                                  const EdgeInsets.only(right: 30.0, top: 20),
                              child: Row(
                                children: [
                                  Text("اسم المتجر :", style: Themes.headline1),
                                  Text(" خيط وسناره ", style: Themes.headline1)
                                ],
                              )),
                          ListView.builder(
                              itemCount: 2,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20.0, top: 10),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 30.0,
                                                          bottom: 30),
                                                  child: Row(children: [
                                                    Text("حقيبة كروشيه",
                                                        style:
                                                            Themes.headline1),
                                                  ])),
                                              SizedBox(
                                                width: 30,
                                              ),
                                              Container(
                                                width: 150,
                                                height: 150,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: ExactAssetImage(
                                                        'images/100.jpg'),
                                                    fit: BoxFit.fill,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                ),
                                              ),
                                            ])),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 30.0),
                                      child: Row(children: [
                                        Text("الكميه  ",
                                            style: Themes.headline1),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          width: 50,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey.shade600,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: DropdownButton(
                                              alignment: Alignment.center,
                                              value: _value,
                                              items: _dropdownItems
                                                  .map((int item) {
                                                return DropdownMenuItem<int>(
                                                  child: Text('$item'),
                                                  value: item,
                                                );
                                              }).toList(),
                                              onChanged: (value) {
                                                // setState(() {
                                                //   _value = value;
                                                // });
                                              },
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            right: 30.0, top: 20),
                                        child: Row(
                                          children: [
                                            Text("سعر المنتج ",
                                                style: Themes.headline1),
                                            Text("  2324 ل.س ",
                                                style: Themes.headline1)
                                          ],
                                        )),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            right: 30.0, top: 20),
                                        child: RichText(
                                          text:  TextSpan(
                                            style:
                                                TextStyle(color: Colors.black),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text:
                                                      "السعر بعد الخصم في حال وجوده  ",
                                                  style: Themes.headline1),
                                              TextSpan(
                                                  text: "20000 ل.س ",
                                                  style: Themes.headline1)
                                              //  TextSpan(text: 'com', style: TextStyle(decoration: TextDecoration.underline))
                                            ],
                                          ),
                                        )),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Divider(),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                  ],
                                );
                              }),

                          ///////////////////////////////////
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("  مكان التوصيل  ",
                                      style: Themes.headline1),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 100,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey.shade600,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Center(
                                      child: DropdownButton<String>(
                                          hint: Text(
                                            "${controller.io.elementAt(0)}",
                                          ),
                                          value: controller.selectedValue,
                                          onChanged: (newValue) {
                                            print(newValue);
                                            controller.onSelected(newValue!);
                                          },
                                          elevation: 10,
                                          items: [
                                            for (var data in controller.io)
                                              DropdownMenuItem(
                                                child: Text(
                                                  "${data}",
                                                  style: Themes.subtitle2,
                                                ),
                                                value: "${data}",
                                              )
                                          ]),
                                    ),
                                  ),
                                ]),
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.only(right: 30.0, top: 20),
                              child: Row(
                                children: [
                                  Text("سعر التوصيل  ",
                                      style: Themes.headline1),
                                  Text("25980 ل.س ", style: Themes.headline1)
                                ],
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Divider(thickness: 2, color: Colors.grey),
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.only(right: 30.0, top: 20),
                              child: Row(
                                children: [
                                  Text(" المبلغ الكلي ",
                                      style: TextStyle(
                                          color: Colors.red.shade800,
                                          fontSize: 18)),
                                  Text("  5000  ل.س ",
                                      style: TextStyle(
                                          color: Colors.red.shade800,
                                          fontSize: 18))
                                ],
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Center(
                              child: Container(
                                width: 150,
                                height: 40,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.shade600,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text("معالجه الطلب",
                                        style: Themes.headline1),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          )
                        ],
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: new EdgeInsets.all(10.0),
                  child: Card(
                      elevation: 100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Center(
                              child: Text('الطلب 2', style: Themes.headline5)),
                          Padding(
                              padding:
                                  const EdgeInsets.only(right: 30.0, top: 20),
                              child: Row(
                                children: [
                                  Text("اسم المتجر :", style: Themes.headline1),
                                  Text(" خيط وسناره ", style: Themes.headline1)
                                ],
                              )),
                          ListView.builder(
                              itemCount: 1,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20.0, top: 10),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 30.0,
                                                          bottom: 30),
                                                  child: Row(children: [
                                                    Text("حقيبة كروشيه",
                                                        style:
                                                            Themes.headline1),
                                                  ])),
                                              SizedBox(
                                                width: 30,
                                              ),
                                              Container(
                                                width: 150,
                                                height: 150,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: ExactAssetImage(
                                                        'images/100.jpg'),
                                                    fit: BoxFit.fill,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                ),
                                              ),
                                            ])),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 30.0),
                                      child: Row(children: [
                                        Text("الكميه  ",
                                            style: Themes.headline1),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          width: 50,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey.shade600,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: DropdownButton(
                                              alignment: Alignment.center,
                                              value: _value,
                                              items: _dropdownItems
                                                  .map((int item) {
                                                return DropdownMenuItem<int>(
                                                  child: Text('$item'),
                                                  value: item,
                                                );
                                              }).toList(),
                                              onChanged: (value) {
                                                // setState(() {
                                                //   _value = value;
                                                // });
                                              },
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            right: 30.0, top: 20),
                                        child: Row(
                                          children: [
                                            Text("سعر المنتج ",
                                                style: Themes.headline1),
                                            Text("  2324 ل.س ",
                                                style: Themes.headline1)
                                          ],
                                        )),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            right: 30.0, top: 20),
                                        child: RichText(
                                          text:  TextSpan(
                                            style:
                                                TextStyle(color: Colors.black),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text:
                                                      "السعر بعد الخصم في حال وجوده  ",
                                                  style: Themes.headline1),
                                              TextSpan(
                                                  text: "20000 ل.س ",
                                                  style: Themes.headline1)
                                              //  TextSpan(text: 'com', style: TextStyle(decoration: TextDecoration.underline))
                                            ],
                                          ),
                                        )),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Divider(),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                  ],
                                );
                              }),

                          ///////////////////////////////////
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("  مكان التوصيل  ",
                                      style: Themes.headline1),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 100,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey.shade600,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Center(
                                      child: DropdownButton<String>(
                                          hint: Text(
                                            "${controller.io.elementAt(0)}",
                                          ),
                                          value: controller.selectedValue,
                                          onChanged: (newValue) {
                                            print(newValue);
                                            controller.onSelected(newValue!);
                                          },
                                          elevation: 10,
                                          items: [
                                            for (var data in controller.io)
                                              DropdownMenuItem(
                                                child: Text(
                                                  "${data}",
                                                  style: Themes.subtitle2,
                                                ),
                                                value: "${data}",
                                              )
                                          ]),
                                    ),
                                  ),
                                ]),
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.only(right: 30.0, top: 20),
                              child: Row(
                                children: [
                                  Text("سعر التوصيل  ",
                                      style: Themes.headline1),
                                  Text("25980 ل.س ", style: Themes.headline1)
                                ],
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Divider(thickness: 2, color: Colors.grey),
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.only(right: 30.0, top: 20),
                              child: Row(
                                children: [
                                  Text(" المبلغ الكلي ",
                                      style: TextStyle(
                                          color: Colors.red.shade800,
                                          fontSize: 18)),
                                  Text("  5000  ل.س ",
                                      style: TextStyle(
                                          color: Colors.red.shade800,
                                          fontSize: 18))
                                ],
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Center(
                              child: Container(
                                width: 150,
                                height: 40,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.shade600,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text("معالجه الطلب",
                                        style: Themes.headline1),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          )
                        ],
                      )),
                ),
                SizedBox(
                  height: 40,
                )
              ])));
    });
  }
}
