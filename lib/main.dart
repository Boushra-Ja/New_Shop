import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_shop/logic/binding/Initial_Binding.dart';
import 'package:new_shop/logic/controllers/FavoriteController.dart';
import 'package:new_shop/logic/controllers/CartController.dart';
import 'package:new_shop/routes/routes.dart';
import 'package:new_shop/view/ff.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'logic/controllers/DrawerController/SettingPageController.dart';
final storage =const FlutterSecureStorage();
final sampleController3 = Get.put(SettingPageController(), permanent: true);
String? isDarkMode;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance();
  isDarkMode =await  storage.read(key: "isDarkMode")  ;
  await GetStorage.init();

  print("------------------------------------------------------");
  print(isDarkMode);
  print("------------------------------------------------------");

  Get.lazyPut(() => FavoriteController(), fenix: true);
  Get.lazyPut(() => SettingPageController(), fenix: true);
  Get.lazyPut(() => CartController(), fenix: true);

  await GetStorage.init();

  // print("------------------------------------------------------");
  //  print(isDarkMode);
  // print("------------------------------------------------------");
  //
  // WidgetsFlutterBinding.ensureInitialized();
  // NativeNotify.initialize('8', '19Rojso8dQGUMIgm4BQOdVFVFJ5D2O9Knmt3E8bw', null, null);
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  static String api = "http://192.168.1.104:8000" ;

  @override
  Widget build(BuildContext context) {
    return
 GetMaterialApp(

  // home: taj(),
  // home: HomePage(),

       debugShowCheckedModeBanner: false,



      initialRoute: Routes.Splash,
      getPages: AppPages.routes,
      initialBinding: Initial_Binding(),
    // initialRoute: Routes.splash,
    );
  }
}

//
// import 'package:carousel_slider/carousel_slider.dart';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//
// void main() {
//
//   runApp( MyApp());
//
// }
//  final storage =const FlutterSecureStorage();
//
// class MyApp extends StatelessWidget {
//   static String api = "http://192.168.1.106:8000" ;
//
//
//   @override
//
//   Widget build(BuildContext context) {
//
//     return MaterialApp(
//
//       title: 'Flutter  beautiful carousel slider',
//
//       debugShowCheckedModeBanner: false,
//
//       home: HomePage(),
//
//     );
//
//   }
//
// }
//
// class HomePage extends StatelessWidget {
//   static String api = "http://192.168.1.106:8000" ;
//
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//
//   Widget build(BuildContext context) {
//
//     return SafeArea(
//
//       child: Scaffold(
//
//         body: Center(
//
//           child:
//           Column(
//
//             mainAxisAlignment: MainAxisAlignment.center,
//
//             children: [
//
//               Text(
//
//                 'Carousel Slider',
//
//                 style: TextStyle(
//
//                     fontSize: 30,
//
//                     color: Colors.blue.shade600,
//
//                     fontWeight: FontWeight.w900,
//
//                     shadows: [
//
//                       Shadow(
//
//                           color: Colors.black38,
//
//                           blurRadius: 5,
//
//                           offset: Offset(2, 2))
//
//                     ]),
//
//               ),
//
//               SizedBox(
//
//                 height: 30,
//
//               ),
//
//               CarouselSlider.builder(
//
//                   itemCount: 10,
//
//                   itemBuilder: (context, index, realIndex) {
//
//                     return Container(
//
//                       margin: EdgeInsets.all(15),
//
//                       decoration: BoxDecoration(
//
//                           borderRadius: BorderRadius.circular(20),
//
//                           boxShadow: [
//
//                             BoxShadow(
//
//                                 color: Colors.black54,
//
//                                 offset: Offset(2, 2),
//
//                                 blurRadius: 7,
//
//                                 spreadRadius: 2)
//
//                           ],
//
//                           image: DecorationImage(
//
//                               fit: BoxFit.cover,
//
//                               image: AssetImage(index.isEven
//
//                                   ? 'assets/development.jpg'
//
//                                   : 'assets/cartoon.jpg'))),
//
//                       child: Container(
//
//                         margin: EdgeInsets.all(15),
//
//                         decoration: BoxDecoration(
//
//                             borderRadius: BorderRadius.circular(20),
//
//                             boxShadow: [
//
//                               BoxShadow(
//
//                                   color: Colors.black54,
//
//                                   offset: Offset(2, 2),
//
//                                   blurRadius: 7,
//
//                                   spreadRadius: 2)
//
//                             ],
//
//                             image: DecorationImage(
//
//                                 fit: BoxFit.cover,
//
//                                 image: AssetImage(index.isEven
//
//                                     ? 'assets/development.jpg'
//
//                                     : 'assets/cartoon.jpg'))),
//
//                         child: Container(
//
//                           margin: EdgeInsets.all(15),
//
//                           decoration: BoxDecoration(
//
//                               borderRadius: BorderRadius.circular(20),
//
//                               boxShadow: [
//
//                                 BoxShadow(
//
//                                     color: Colors.black54,
//
//                                     offset: Offset(2, 2),
//
//                                     blurRadius: 7,
//
//                                     spreadRadius: 2)
//
//                               ],
//
//                               image: DecorationImage(
//
//                                   fit: BoxFit.cover,
//
//                                   image: AssetImage(index.isEven
//
//                                       ? 'assets/development.jpg'
//
//                                       : 'assets/cartoon.jpg'))),
//
//                           child: Container(
//
//                             margin: EdgeInsets.all(15),
//
//                             decoration: BoxDecoration(
//
//                                 borderRadius: BorderRadius.circular(20),
//
//                                 boxShadow: [
//
//                                   BoxShadow(
//
//                                       color: Colors.black54,
//
//                                       offset: Offset(2, 2),
//
//                                       blurRadius: 7,
//
//                                       spreadRadius: 2)
//
//                                 ],
//
//                                 image: DecorationImage(
//
//                                     fit: BoxFit.cover,
//
//                                     image: AssetImage(index.isEven
//
//                                         ? 'assets/development.jpg'
//
//                                         : 'assets/cartoon.jpg'))),
//
//                             child: Container(
//
//                               margin: EdgeInsets.all(15),
//
//                               decoration: BoxDecoration(
//
//                                   borderRadius: BorderRadius.circular(20),
//
//                                   boxShadow: [
//
//                                     BoxShadow(
//
//                                         color: Colors.black54,
//
//                                         offset: Offset(2, 2),
//
//                                         blurRadius: 7,
//
//                                         spreadRadius: 2)
//
//                                   ],
//
//                                   image: DecorationImage(
//
//                                       fit: BoxFit.cover,
//
//                                       image: AssetImage(index.isEven
//
//                                           ? 'assets/development.jpg'
//
//                                           : 'assets/cartoon.jpg'))),
//
//                             ),
//
//                           ),
//
//                         ),
//
//                       ),
//
//                     );
//
//                   },
//
//                   options: CarouselOptions(
//
//                       onPageChanged: (index, reason) {
//
//                         print(index.toString());
//
//                         print(reason.toString());
//
//                       },
//
//                       height: 300,
//
//                       autoPlay: true,
//
//                       autoPlayAnimationDuration: Duration(seconds: 2),
//
//                       autoPlayCurve: Curves.easeInOutBack,
//
//                       enlargeCenterPage: true,
//
//                       enlargeStrategy: CenterPageEnlargeStrategy.height,
//
//                       initialPage: 2,
//
//                       pageSnapping: false,
//
//                       viewportFraction: .7,
//
//                       autoPlayInterval: Duration(seconds: 4))),
//
//               SizedBox(
//
//                 height: 10,
//
//               ),
//
//               Text(
//
//                 'Hope you enjoyed it,Keep learning and happy coding',
//
//                 style: TextStyle(
//
//                     fontSize: 15,
//
//                     color: Colors.blue.shade600,
//
//                     fontWeight: FontWeight.w900,
//
//                     shadows: [
//
//                       Shadow(
//
//                           color: Colors.black26,
//
//                           blurRadius: 5,
//
//                           offset: Offset(2, 2))
//
//                     ]),
//
//               ),
//
//             ],
//
//           ),
//
//         ),
//
//       ),
//
//     );
//
//   }
//
// }