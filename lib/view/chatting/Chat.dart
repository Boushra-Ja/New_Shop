import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_shop/utls/Themes.dart';
import '../ConstantPages/MyCustomCLipper.dart';

class Chat extends StatelessWidget {
  Color? colorh = Themes.color;
  Color colorh8 = Colors.grey.shade300;

  List<String> images = [
    "images/5w.jpg",
    "images/6w.jpg",
    "images/7w.jpg",
    "images/8w.jpg",
    "images/9w.jpg",
    "images/10w.jpg",
  ];
  List<String> title = [
    "متجر بيان",
    "متجر تسنيم",
    "بتول",
    "بشرى",
    "هدى",
    "متجر الالعاب",
  ];
  List<String> subtitle = ["سلام", "اي", "مع السلامه", "كيفك", "باي", "ماشي"];

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Themes.color2,
          body: Column(
            children: [
              ClipPath(
                child: Container(
                  color: Themes.color,
                  height: MediaQuery.of(context).size.height * 0.11,
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
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Form(
                  // key: ,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "ابحث...",
                      hintStyle: Themes.bodyText5,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey.shade600,
                        size: 20,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.all(8),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: colorh8)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 1,
                child: Container(
                    child: ListView.builder(
                  itemBuilder: (BuildContext, index) {
                    return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: TextButton(
                          onPressed: () => {
                            Get.toNamed('/ChatDetails', arguments: {
                              "Title": title[index],
                              "SubTitle": subtitle[index],
                              "Image": images[index],
                            })
                          },
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 10),
                            trailing: Text(
                              "4/7/2022",
                              style: Themes.subtitle3,
                            ),
                            leading: CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(images[index]),
                            ),
                            title: Text(title[index], style: Themes.bodyText1),
                            subtitle: Text(
                              subtitle[index],
                              style: Themes.subtitle2,
                            ),
                          ),
                        ));
                  },
                  itemCount: images.length,
                )),
              ),
            ],
          ),
        )); // ClipPath
  }
}
