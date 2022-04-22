import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utls/Themes.dart';

class BillPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            body: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15.0, top: 10, bottom: 10),
              child: Align(
                  child: CircleAvatar(
                    radius: 18,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: Themes.color,
                      ),
                    ),
                    backgroundColor: Colors.grey.shade200,
                  ),
                  alignment: Alignment.topRight),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        "الطلب 1",
                        style: Themes.headline3,
                      ),
                    ),
                    Center(
                      child: Text(
                        "تاريخ الفاتورة  2/3/2022",
                        style: Themes.subtitle2,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "البائع",
                      style: Themes.headline2,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "اسم المتجر    متجر بشرى",
                      style: Themes.bodyText3,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "رقم المتجر    09389793",
                      style: Themes.bodyText3,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Divider(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "المشتري",
                      style: Themes.headline2,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "اسم الزبون     بتول الزعبي",
                      style: Themes.bodyText3,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "رقم الزبون    09389793",
                      style: Themes.bodyText3,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox.shrink(),
                          flex: 1,
                        ),
                        Expanded(
                          child: Text("المنتح"),
                          flex: 4,
                        ),
                        Expanded(
                          child: SizedBox.shrink(),
                          flex: 2,
                        ),
                        Expanded(
                          child: Text("الكمية"),
                          flex: 4,
                        ),
                        Expanded(
                          child: SizedBox.shrink(),
                          flex: 2,
                        ),
                        Expanded(
                          child: Text("السعر"),
                          flex: 4,
                        ),
                        Expanded(
                          child: SizedBox.shrink(),
                          flex: 1,
                        ),
                      ],
                    ),
                    Divider(),
                    ListView.builder(
                        itemCount: 3,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: SizedBox.shrink(),
                                    flex: 1,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "حقيبة كروشيه",
                                      style: Themes.subtitle2,
                                    ),
                                    flex: 4,
                                  ),
                                  Expanded(
                                    child: SizedBox.shrink(),
                                    flex: 2,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "1",
                                      style: Themes.subtitle2,
                                    ),
                                    flex: 4,
                                  ),
                                  Expanded(
                                    child: SizedBox.shrink(),
                                    flex: 2,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "160000",
                                      style: Themes.subtitle2,
                                    ),
                                    flex: 4,
                                  ),
                                  Expanded(
                                    child: SizedBox.shrink(),
                                    flex: 1,
                                  ),
                                ],
                              ),
                              Divider()
                            ],
                          );
                        }),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox.shrink(),
                          flex: 1,
                        ),
                        Expanded(
                          child: Text(
                            "خصم الفاتورة ",
                            style: Themes.subtitle2,
                          ),
                          flex: 4,
                        ),
                        Expanded(
                          child: SizedBox.shrink(),
                          flex: 1,
                        ),
                        Expanded(
                          child: Text(
                            " 20%",
                            style: Themes.subtitle2,
                          ),
                          flex: 4,
                        ),
                        Expanded(
                          child: SizedBox.shrink(),
                          flex: 1,
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox.shrink(),
                          flex: 1,
                        ),
                        Expanded(
                          child: Text(
                            "المجموع",
                            style: Themes.subtitle2,
                          ),
                          flex: 4,
                        ),
                        Expanded(
                          child: SizedBox.shrink(),
                          flex: 1,
                        ),
                        Expanded(
                          child: Text(
                            "140000",
                            style: Themes.subtitle2,
                          ),
                          flex: 4,
                        ),
                        Expanded(
                          child: SizedBox.shrink(),
                          flex: 1,
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox.shrink(),
                          flex: 1,
                        ),
                        Expanded(
                          child: Text(
                            "سعر التوصيل",
                            style: Themes.subtitle2,
                          ),
                          flex: 4,
                        ),
                        Expanded(
                          child: SizedBox.shrink(),
                          flex: 1,
                        ),
                        Expanded(
                          child: Text(
                            "4000 ل.س",
                            style: Themes.subtitle2,
                          ),
                          flex: 4,
                        ),
                        Expanded(
                          child: SizedBox.shrink(),
                          flex: 1,
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox.shrink(),
                          flex: 1,
                        ),
                        Expanded(
                          child: Text(
                            "المبلغ الكلي",
                            style: Themes.subtitle2,
                          ),
                          flex: 4,
                        ),
                        Expanded(
                          child: SizedBox.shrink(),
                          flex: 1,
                        ),
                        Expanded(
                          child: Text(
                            "180000 ل.س",
                            style: Themes.subtitle2,
                          ),
                          flex: 4,
                        ),
                        Expanded(
                          child: SizedBox.shrink(),
                          flex: 1,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/bill1.png'),
                            fit: BoxFit.contain),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        )));
  }
}
