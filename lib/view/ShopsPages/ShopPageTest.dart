
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_shop/logic/controllers/AppBarController.dart';
import 'package:new_shop/utls/Themes.dart';
import 'package:new_shop/view/ConstantPages/AppBar.dart';
import '../../logic/controllers/ShopsController/ShopPageController.dart';
import '../ConstantPages/Drawer.dart';
import 'ShopProfile.dart';
import 'ShopReview.dart';

class ShopPageTest extends StatelessWidget {

  final _controller = Get.find<ShopPageController>() ;


  @override
  Widget build(BuildContext context) {

    return GetBuilder<AppBarController>(
      init: AppBarController(),
      builder: (controller) {
        return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              key: controller.getscaffoldKey(),
              drawer: myDrawer(),
              body: Padding(
                padding: const EdgeInsets.only(top : 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    myAppBar(),
                    SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 40,
                        child: GetBuilder<ShopPageController>(
                          init: ShopPageController(),
                          builder: (controller2) {
                            return DropdownButtonFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  contentPadding:
                                  EdgeInsets.fromLTRB(10, 0.001, 12, 0.001),
                                  filled: true,
                                  fillColor: Colors.white),
                              isExpanded: false,
                              value: 'الأكثر مبيعا',
                              onChanged: (newValue) {
                                controller2
                                    .setselectedvalue(newValue.toString());
                              },
                              validator: (val) {
                                return controller2
                                    .validate_value(val.toString());
                              },
                              items: controller2.items.map((item) {
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
                            );
                          },
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    Flexible(
                      child: _controller.ShopList.length > 0 ? ListView.builder(
                          itemCount: _controller.ShopList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                _controller.selectedsortvalue=="الأكثر مبيعا" ? Get.to(ShopProfile()) : Get.to(ShopReview());
                              },
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                    const EdgeInsets.only(bottom: 20.0),
                                    child: Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 10),
                                          child: CircleAvatar(
                                            radius: 50,
                                            backgroundImage:
                                            AssetImage('images/shop2.jpg'),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${_controller.ShopList[index].shop_name}",
                                              style: Themes.headline1,
                                              maxLines: 2,
                                            ),
                                            Row(
                                              children: [
                                                const Text("عدد المبيعات ",
                                                  style: Themes.subtitle1 , ),
                                                Text("${_controller.ShopList[index].num_cell}" ,   style: Themes.subtitle1 ,)
                                              ],
                                            ),

                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  const Divider()
                                ],
                              ),
                            );
                          }) : Center(
                        child: Text("لا يوجد متاجر "),
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
