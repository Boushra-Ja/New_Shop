
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:new_shop/logic/binding/ChatBinding.dart';
import 'package:new_shop/logic/binding/Favorite_Binding.dart';
import 'package:new_shop/view/chatting/ChatDetails.dart';
import 'package:new_shop/view/Favorite.dart';

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
    GetPage(
      name: Routes.Favorite,
      page: () => Favorite(),
      binding: FavoriteBinding(),
    ),
    GetPage(
      name: Routes.ChatDetails,
      page: () => ChatDetails(),
      binding: ChatBinding(),
    ),
///ChatDetails

  ];
}

class Routes {
  static const HomePage = '/HomePage';
  static const Regester = '/regester';
  static const Login = '/login';
  static const Favorite = '/favotite';
  static const ShopsPage = '/shops_page';

  static const ChatDetails = '/ChatDetails';
  static const ShopsProfile = '/shops_profile';


}