import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_shop/view/ShopsPage.dart';
import '../logic/controllers/HomePageController.dart';
import '../utls/Themes.dart';
import 'Products.dart';

class HomePage extends GetView<HomePageController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: [
              Text("ds"),
              Text("ds"),
              ShopsPage(),
              Product(),
            ],
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          height: 55,
          index: controller.tabIndex,
          color: Themes.color,
          buttonBackgroundColor: Themes.color,
          backgroundColor: Colors.white,
          animationDuration: Duration(seconds: 1),
          animationCurve: Curves.bounceOut,
          items: <Widget>[
            Icon(
              Icons.favorite,
              size: 25,
              color: Colors.white,
            ),
            Icon(
              Icons.home_repair_service,
              size: 25,
              color: Colors.white,
            ),
            Icon(
              Icons.shop,
              size: 25,
              color: Colors.white,
            ),
            Icon(
              Icons.production_quantity_limits,
              color: Colors.white,
            ),
          ],
          onTap: (index) {
            print(index);
            // controller.tabIndex;

            controller.changeTabIndex(index);
          },
        ),
      );
    });
  }
}

















//   Widget buildCircleImage6() {
//     return Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//         child: Container(
//           height: 75,
//           width: 75,
//           padding: EdgeInsets.all(0.5),
//           decoration: new BoxDecoration(
//               border: new Border.all(
//                 color: Colors.black54,
//               ), // Border.all
//               borderRadius: new BorderRadius.only(
//                   topLeft: const Radius.circular(40.0),
//                   topRight: const Radius.circular(40.0),
//                   bottomLeft: const Radius.circular(40.0),
//                   bottomRight: const Radius.circular(40.0))),
//           // BorderRadius.only, BoxDecoration
//           child: ClipOval(
//             child: Image.asset(
//               "images/4.png",
//               fit: BoxFit.cover,
//             ), // Image.network
//           ),
//         )); // Padding
//
// // Scrollbar(child: Container(
// //              // fit: StackFit.expand,
// //              child:
// //              Stack(
// //
// //                  children: <Widget>[
// //
// //
// //
// //                    Positioned(
// //                      top: 50,
// //                      child:
// //                      IconButton(onPressed:(){
// //                        _scaffoldKey.currentState.openDrawer();
// //                      } , icon: Icon(Icons.menu,size: 40,)),),
// //                    Positioned(
// //                      top: 60,
// //                      right: 80,
// //                      child:
// //                      Container(
// //                        width: 250,
// //                        height: 40,
// //                        decoration: BoxDecoration(border: Border.all(
// //                          color: Colors.black,
// //                          width: 2,
// //                        ),
// //                          borderRadius: BorderRadius.circular(20),),
// //                        child:Row(children: [
// //                          IconButton(
// //                            onPressed: () {print("search");},
// //                            icon: const Icon(Icons.search),
// //                          ),
// //                          Text(" انقر هنا للبحث ..."),
// //
// //
// //                        ]), ),),
// //                    Positioned(
// //                      top: 50,
// //                      left: 20,
// //                      child:
// //                      IconButton(onPressed:(){
// //                      } , icon: Icon(Icons.shopping_cart_outlined,size: 40,)),),
// //
// //                    IndexedStack(
// //                      index: _currentIndex,
// //                      children: [
// //                        // for (final i in koko) i,
// //                      ],
// //                    ),
// //
// //                  ]),),),
//   }

//   Widget buildText6() {
//     return Text(
//       "Cundies",
//       style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//     );
//   }
// }
//  Row(
//   mainAxisAlignment: MainAxisAlignment.end,
//   crossAxisAlignment:CrossAxisAlignment.center ,
//   children: [
//   Column(
//   children: [
//     buildCircleImage6(),
//    buildText6(),
// ]),
//
//     Column(
//         children: [
//           buildCircleImage6(),
//           buildText6(),
//         ]),
//
//
//     Column(
//         children: [
//           buildCircleImage6(),
//           buildText6(),
//         ]),
//
//     Column(
//         children: [
//           buildCircleImage6(),
//           buildText6(),
//         ]),
//
//     Column(
//         children: [
//           buildCircleImage6(),
//           buildText6(),
//         ]),
//
//     Column(
//         children: [
//           buildCircleImage6(),
//           buildText6(),
//         ]),
//
//   ]),
