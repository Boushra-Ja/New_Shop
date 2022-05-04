import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_shop/utls/Themes.dart';

List<String> images = [
  "images/1.jpg",
  "images/2.jpg",
  "images/3.jpg",
  "images/5.jpg",
  "images/8.jpg",
  "images/9.jpg",
  "images/11.jpg",
  "images/44.jpg",
  "images/55.jpg",
  "images/jk.jpg",
  "images/9.jpg",
  "images/11.jpg",
  "images/44.jpg",
  "images/55.jpg",
];

class Seggestions extends StatelessWidget //GetView<FavoriteController>
{
  var check_tap;
  final title;

  Seggestions({this.title});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            backgroundColor: Themes.color2,
            body: Column(children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Container(
                  margin: EdgeInsets.only(top: 40.0, right: 8, bottom: 5),
                  child: Row(
                    children: [
                      Container(
                        child: IconButton(
                          onPressed: () {
                            Get.offAllNamed("/HomePage");
                          },
                          icon: Icon(Icons.arrow_back),
                        ),
                      ),
                      Container(
                          child: Text("${title}", style: Themes.headline3)),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: ListView.builder(
                  itemBuilder: (BuildContext, index) {
                    return Column(
                      children: [
                        Container(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Card(
                            shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 20),
                              child: Row(
                                children: [
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.width * 0.3,
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(images[index]),
                                            fit: BoxFit.fill),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("اسم المنتج",
                                              style: Themes.headline1),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.15,
                                          ),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0),
                                              child: InkWell(
                                                onTap: () {
                                                  /////Action
                                                },
                                                child: CircleAvatar(
                                                  child: Icon(
                                                    Icons.favorite,
                                                    color: Colors.red,
                                                    size: 20,
                                                  ),
                                                  backgroundColor:
                                                      Themes.color2,
                                                  radius: 16,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Text(
                                        "4567.00",
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 12),
                                      ),
                                      Text(""),
                                      Text("")
                                    ],
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        //   child: Divider(color: Themes.color2,),
                        // ) ,
                        SizedBox(
                          height: 15,
                        )
                      ],
                    );
                  },
                  itemCount: images.length,
                ),
              )
            ])));
  }
}
