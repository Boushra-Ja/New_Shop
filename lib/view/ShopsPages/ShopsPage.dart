import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_shop/logic/controllers/AppBarController.dart';
import 'package:new_shop/utls/Themes.dart';
import 'package:new_shop/view/ConstantPages/AppBar.dart';
import '../../logic/controllers/ShopsController/ShopPageController.dart';
import '../../main.dart';
import '../ConstantPages/Drawer.dart';
import 'ShopProfile.dart';
import 'ShopReview.dart';

class ShopsPage extends StatelessWidget {
  final ShopPageController _controller = Get.find<ShopPageController>();

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
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      myAppBar(),
                      SizedBox(
                        height: 25,
                      ),
                      Obx(
                        () => SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: 30,
                            child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: DropdownButtonFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      contentPadding: EdgeInsets.fromLTRB(
                                          10, 0.001, 12, 0.001),
                                      filled: true,
                                      fillColor: Colors.white),
                                  isExpanded: false,
                                  value: _controller.selectedsortvalue.value,
                                  style: Themes.subtitle1,
                                  alignment: Alignment.center,
                                  onChanged: (newValue) {
                                    _controller.selectedsortvalue.value =
                                        newValue.toString();
                                    if (_controller.selectedsortvalue.value ==
                                        "الأكثر مبيعا") {
                                      _controller.StoresMoreSales();
                                    } else if (_controller
                                            .selectedsortvalue.value ==
                                        "الأفضل تقييما") {
                                      _controller.StoresMoreReview();
                                    } else {
                                      _controller.fetchALlStores();
                                    }
                                  },
                                  validator: (val) {
                                    return _controller
                                        .validate_value(val.toString());
                                  },
                                  items: _controller.items.map((item) {
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
                                ))),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      _controller.ShopList.isEmpty
                          ? Center(
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.25,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('images/setting.png'),
                                      fit: BoxFit.contain),
                                ),
                              ),
                            )
                          : Obx(() {
                              if (_controller.isLoading.value) {
                                return Center(
                                  child: CircularProgressIndicator().reactive(),
                                );
                              }
                              return Flexible(
                                  child: ListView.builder(
                                      itemCount: _controller.ShopList.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return InkWell(
                                          onTap: () {

                                            _controller.selectedsortvalue.value ==
                                                "الأكثر مبيعا" ||  _controller.selectedsortvalue.value == "جميع المتاجر"
                                                ? Get.to(ShopProfile(_controller.ShopList[index].id))
                                                : Get.to(ShopReview());
                                          },
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 20.0),
                                                child: Row(
                                                  children: [
                                                     Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 10,
                                                              horizontal: 10),
                                                      child: CircleAvatar(
                                                        radius: 50,
                                                        backgroundImage: NetworkImage('${MyApp.api}/uploads/stores/${_controller.ShopList.elementAt(index).image}'),

                                                      ),
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "${_controller.ShopList[index].shop_name}",
                                                          style:
                                                              Themes.headline1,
                                                          maxLines: 2,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                                "عدد المبيعات "),
                                                            Text(
                                                              "${_controller.ShopList[index].num_of_salling}",
                                                              style: Themes
                                                                  .subtitle1,
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children:  [
                                                            Icon(
                                                              Icons.star,
                                                              color:
                                                                  _controller.ShopList[index].review >= 1 ? Colors.yellow.shade700 :  Themes.color ,
                                                              size: 18,
                                                            ),
                                                            Icon(
                                                              Icons.star,
                                                              color:
                                                              _controller.ShopList[index].review >= 2 ? Colors.yellow.shade700 :  Themes.color,                                                              size: 18,
                                                            ),
                                                            Icon(
                                                              Icons.star,
                                                              color:
                                                              _controller.ShopList[index].review >= 3 ? Colors.yellow.shade700 :  Themes.color,                                                              size: 18,
                                                            ),
                                                            Icon(
                                                              Icons.star,
                                                              color:
                                                              _controller.ShopList[index].review >= 4 ? Colors.yellow.shade700 :  Themes.color,                                                              size: 18,
                                                            ),
                                                            Icon(
                                                              Icons.star,
                                                              color:
                                                              _controller.ShopList[index].review ==5 ? Colors.yellow.shade700 :  Themes.color,                                                              size: 18,
                                                            )
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
                                      }));
                            })
                    ],
                  )),
            ));
      },
    );
  }
}
