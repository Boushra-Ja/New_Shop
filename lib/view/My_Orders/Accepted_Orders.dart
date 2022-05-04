import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_shop/utls/Themes.dart';
import 'OrderDeatil.dart';

class Accepted_Orders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.only(right: 10, left: 10, bottom: 15),
                height: MediaQuery.of(context).size.height * 0.2,
                child: Material(
                  color: Themes.color,
                  elevation: 2.0,
                  shadowColor: Themes.color2,
                  borderRadius: BorderRadius.circular(20.0),
                  child: InkWell(
                    onTap: () {
                      Get.to(OrderDeatil());
                    },
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(color: Themes.color2, width: 2),
                      ),
                      selected: true,
                      selectedTileColor: Colors.white,
                      contentPadding: EdgeInsets.fromLTRB(10, 15, 10, 10),
                      leading: Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/shop2.jpg'),
                              fit: BoxFit.contain),
                        ),
                      ),
                      title: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "الطلب 1",
                            style: Themes.headline1,
                          ),
                          Text(
                            "اسم المتجر ",
                            style: Themes.subtitle1,
                          )
                        ],
                      ),
                      subtitle: Text(
                        "تاريخ التسليم 2/3/2022",
                        style: Themes.subtitle3,
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}
