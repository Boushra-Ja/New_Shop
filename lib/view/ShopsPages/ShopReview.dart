import 'package:flutter/material.dart';
import 'package:new_shop/utls/Themes.dart';

class ShopReview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Container(
            height: double.infinity,
            child: ListView(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: MediaQuery.of(context).size.height * 0.35 -
                            MediaQuery.of(context).size.height * 0.15,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Themes.color,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: MediaQuery.of(context).size.height * 0.06,
                        right: MediaQuery.of(context).size.width * 0.5 - 80,
                        child: Center(
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 10, top: 10),
                                child: CircleAvatar(
                                  radius: 70,
                                  backgroundImage:
                                      AssetImage('images/shop.png'),
                                ),
                              ),
                              Text(
                                "اسم المتجر",
                                style: Themes.headline1,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15.0, right: 10, left: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 2,
                              spreadRadius: 0.7,
                              offset: Offset(1, 1),
                              color: Colors.grey),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              "خلال الشهر الرابع",
                              style: Themes.headline1,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "عدد المبيعات 240",
                            style: Themes.headline2,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Icon(
                                    Icons.tag_faces_outlined,
                                    size: 40,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "12",
                                    style: Themes.subtitle1,
                                  )
                                ],
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.2,
                              ),
                              Column(
                                children: [
                                  Icon(
                                    Icons.tag_faces_outlined,
                                    size: 40,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "45",
                                    style: Themes.subtitle1,
                                  )
                                ],
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.2,
                              ),
                              Column(
                                children: [
                                  Icon(
                                    Icons.tag_faces_outlined,
                                    size: 40,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "66",
                                    style: Themes.subtitle1,
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15.0, right: 10, left: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 2,
                              spreadRadius: 0.7,
                              offset: Offset(1, 1),
                              color: Colors.grey),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              "خلال الشهر الثالث",
                              style: Themes.headline1,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "عدد المبيعات 400",
                            style: Themes.headline2,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Icon(
                                    Icons.tag_faces_outlined,
                                    size: 40,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "45",
                                    style: Themes.subtitle1,
                                  )
                                ],
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.2,
                              ),
                              Column(
                                children: [
                                  Icon(
                                    Icons.tag_faces_outlined,
                                    size: 40,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "88",
                                    style: Themes.subtitle1,
                                  )
                                ],
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.2,
                              ),
                              Column(
                                children: [
                                  Icon(
                                    Icons.tag_faces_outlined,
                                    size: 40,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "56",
                                    style: Themes.subtitle1,
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15.0, right: 10, left: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 2,
                              spreadRadius: 0.7,
                              offset: Offset(1, 1),
                              color: Colors.grey),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              "خلال الشهر الثاني",
                              style: Themes.headline1,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "عدد المبيعات 100",
                            style: Themes.headline2,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Icon(
                                    Icons.tag_faces_outlined,
                                    size: 40,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "45",
                                    style: Themes.subtitle1,
                                  )
                                ],
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.2,
                              ),
                              Column(
                                children: [
                                  Icon(
                                    Icons.tag_faces_outlined,
                                    size: 40,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "77",
                                    style: Themes.subtitle1,
                                  )
                                ],
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.2,
                              ),
                              Column(
                                children: [
                                  Icon(
                                    Icons.tag_faces_outlined,
                                    size: 40,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "13",
                                    style: Themes.subtitle1,
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ));
  }
}
