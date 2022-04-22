import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_shop/logic/controllers/OrdersController.dart';
import 'package:new_shop/view/My_Orders/Accepted_Orders.dart';
import 'package:new_shop/view/My_Orders/OrderReceived.dart';
import 'package:new_shop/view/My_Orders/PendingOrders.dart';
import '../../logic/controllers/AppBarController.dart';
import '../../utls/Themes.dart';
import '../ConstantPages/AppBar.dart';
import '../ConstantPages/Drawer.dart';

class Orders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppBarController>(
        init: AppBarController(),
        builder: (controller) {
          return Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                key: controller.getscaffoldKey3(),
                drawer: myDrawer(),
                body: GetBuilder<OrdersController>(
                  init: OrdersController(),
                  builder: (controller) {
                    return Column(
                      children: [
                        myAppBar(),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                  controller.setindex(0);
                                },
                                child: Column(
                                  children: [
                                    const Text(
                                      "المعلقة",
                                      textAlign: TextAlign.center,
                                    ),
                                    Divider(
                                      thickness: controller.index == 0 ? 3 : 1,
                                      color: controller.index == 0
                                          ? Themes.color
                                          : Colors.grey.shade200,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                  controller.setindex(1);
                                },
                                child: Column(
                                  children: [
                                    const Text(
                                      "المقبولة",
                                      textAlign: TextAlign.center,
                                    ),
                                    Divider(
                                      thickness: controller.index == 1 ? 3 : 1,
                                      color: controller.index == 1
                                          ? Themes.color
                                          : Colors.grey.shade200,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                  controller.setindex(2);
                                },
                                child: Column(
                                  children: [
                                    const Text(
                                      "المستلمة",
                                      textAlign: TextAlign.center,
                                    ),
                                    Divider(
                                      thickness: controller.index == 2 ? 3 : 1,
                                      color: controller.index == 2
                                          ? Themes.color
                                          : Colors.grey.shade200,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 25,
                        ),
                        controller.index == 0 ? PendingOrders() : controller.index == 1 ? Accepted_Orders() : OrderReceived()
                        /////////
                      ],
                    );
                  },
                ),
              ));
        });
  }
}
