import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utls/Themes.dart';
import '../ConstantPages/MyCustomCLipper.dart';

class OrderDeatil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: ListView(
            shrinkWrap: true,
            children: [
              ClipPath(
                child: Container(
                  color: Themes.color,
                  height: MediaQuery.of(context).size.height * 0.12,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                      child: Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Themes.color2,
                                  child: Center(
                                    child: IconButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      icon: Icon(
                                        Icons.arrow_back,
                                        color: Themes.color,
                                      ),
                                    ),
                                  ),
                                ),
                              ]))),
                ),
                clipper: MyCustomCLipper(),
              ),
              Center(
                child: Text(
                  "تفاصيل الطلب 1",
                  style: Themes.headline3,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "اسم المتجر  متجر بشرى",
                      style: Themes.bodyText3,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "تاريخ الطلب  2/4/2022",
                      style: Themes.bodyText3,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "التاريخ المتوقع للتسليم  3/3/2022",
                      style: Themes.bodyText3,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "تاريخ التسليم الفعلي  3/3/2022",
                      style: Themes.bodyText3,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Text(
                  "محتوى الطلب",
                  style: Themes.headline3,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      shape: BeveledRectangleBorder(
                        side: BorderSide(color: Themes.color2, width: 2),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      margin: EdgeInsets.only(right: 15, left: 15, bottom: 25),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Text(
                                      "اسم المنتج ",
                                      style: Themes.headline1,
                                    )),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.15,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage('images/66.jpg'),
                                          fit: BoxFit.contain),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "اللون  أحمر",
                              style: Themes.bodyText3,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "الحجم  20*40",
                              style: Themes.bodyText3,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "مادة الصنع  الخشب",
                              style: Themes.bodyText3,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "الكمية  2",
                              style: Themes.bodyText3,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ));
  }
}
