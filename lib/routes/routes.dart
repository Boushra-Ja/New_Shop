
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../logic/binding/Home_Binding.dart';
import '../view/HomePage.dart';
import '../view/ShopProfile.dart';
import '../view/ShopsPage.dart';
import '../view/auth/LoginView.dart';
import '../view/auth/RegesterView.dart';

class AppPages {
  static final routes = [
    GetPage(
        name: Routes.HomePage,
        page: () => HomePage(),
        binding: HomeBinding()
    ),
    GetPage(
      name: Routes.Regester,
      page: () => RegisterView(),
      //  binding: HomeBinding()
    ),
    GetPage(
      name: Routes.Login,
      page: () => LoginView(),
      //  binding: HomeBinding()
    ),
    GetPage(
      name: Routes.ShopsPage,
      page: () => ShopsPage(),
    ),
    GetPage(
      name: Routes.ShopsProfile,
      page: () => ShopProfile(),
    ),


  ];
}

class Routes {
  static const HomePage = '/HomePage';
  static const Regester = '/regester';
  static const Login = '/login';
  static const ShopsPage = '/shops_page';
  static const ShopsProfile = '/shops_profile';


}