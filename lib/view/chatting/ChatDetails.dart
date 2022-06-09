import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_shop/logic/controllers/ChatController.dart';
import 'package:new_shop/utls/Themes.dart';

class ChatDetails extends GetView<ChatController> {
  final messageInsert = TextEditingController();
  List<Map> messsages = [];

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Card(
                  child: ListTile(
                    trailing: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                      ),
                    ),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("${controller.Images.value}"),
                    ),
                    title: Text(
                      controller.Title.value,
                      style: Themes.bodyText1,
                    ),
                    subtitle: Text(
                      "متصل الان",
                      style: Themes.subtitle2,
                    ),
                  ),
                ),

                Flexible(
                    child: ListView.builder(
                        reverse: true,
                        itemCount: messsages.length,
                        itemBuilder: (context, index) => chat(
                            messsages[index]["message"].toString(),
                            messsages[index]["data"]))),

                Divider(
                  height: 5.0,
                  color: Colors.grey.shade600,
                  thickness: 1,
                ),
                Container(
                  child: ListTile(
                    leading: IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                        color: Colors.grey.shade600,
                        size: 35,
                      ),
                      onPressed: () {},
                    ),
                    title: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                      ),
                      padding: EdgeInsets.only(left: 15),
                      child: TextFormField(
                        controller: messageInsert,
                        decoration: InputDecoration(
                           hintText: "  ادخل رسالتك... ",
                          hintStyle: Themes.subtitle3,
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                        style: Themes.bodyText1,
                        onChanged: (value) {},
                      ),
                    ),
                    trailing: IconButton(
                        icon: Icon(
                          Icons.send,
                          size: 30.0,
                          color: Colors.grey.shade600,
                        ),
                        onPressed: () {
                          if (messageInsert.text.isEmpty) {
                            print("empty message");
                          } else {
                            messsages.insert(
                                0, {"data": 0, "message": messageInsert.text});

                            messageInsert.clear();
                          }
                          FocusScopeNode currentFocus = FocusScope.of(context);
                          if (!currentFocus.hasPrimaryFocus) {
                            currentFocus.unfocus();
                          }
                        }),
                  ),
                ),

                // SizedBox(
                //    height: 50.0,
                //  )
              ],
            ),
          ),
        ));
  }

  Widget chat(String message, int data) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment:
            data == 1 ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          data == 0
              ? Container(
                  height: 50,
                  width: 60,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundImage: AssetImage("${controller.Images.value}" ),
                  ),
                )
              : Container(),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Bubble(
                radius: Radius.circular(10.0),
                color: data == 0 ? Themes.color : Themes.color2,
                elevation: 0.0,
                child: Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        width: 10.0,
                      ),
                      Flexible(
                          child: Container(
                        constraints: BoxConstraints(maxWidth: 200),
                        child: Text(
                          message,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ))
                    ],
                  ),
                )),
          ),
          data == 1
              ? Container(
                  height: 50,
                  width: 60,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundImage: AssetImage("images/3.jpg"),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
