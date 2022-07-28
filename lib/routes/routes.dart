import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:new_shop/logic/binding/ChatBinding.dart';
import 'package:new_shop/logic/binding/Favorite_Binding.dart';
import 'package:new_shop/logic/binding/Regester_Binding.dart';
import 'package:new_shop/logic/binding/login_Binding.dart';
import 'package:new_shop/logic/controllers/SplashController.dart';
import 'package:new_shop/view/My_Orders/Orders.dart';
import 'package:new_shop/view/Carts.dart';
import 'package:new_shop/view/auth/WelcomPage.dart';
import 'package:new_shop/view/chatting/ChatDetails.dart';
import 'package:new_shop/view/Favorite.dart';

import '../logic/binding/Home_Binding.dart';
import '../logic/binding/OrderBinding.dart';
import '../logic/binding/SplashBinding.dart';
import '../logic/binding/TreatBinding.dart';
import '../view/HomePage.dart';
import '../view/ShopsPages/ShopProfile.dart';
import '../view/ShopsPages/ShopsPage.dart';
import '../view/TreatBasket.dart';
import '../view/auth/LoginView.dart';
import '../view/auth/RegesterView.dart';
import '../view/auth/Splash.dart';

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
        binding: RegisterBinding()
    ),
    GetPage(
      name: Routes.Login,
      page: () => LoginView(),
        binding: LoginBinding()
    ), GetPage(
      name: Routes.TreatBasket,
      page: () => TreatBasket(),
        binding: TreatBinding()
    ),
    GetPage(
      name: Routes.ShopsPage,
      page: () => ShopsPage(),
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
    GetPage(
      name: Routes.Splash,
      page: () => RouteAuth(),
      binding: SplashBinding(),
    ), GetPage(
      name: Routes.Cart,
      page: () => Carts(),
      binding: CartBinding(),
    ),
    ///ChatDetails
    GetPage(
      name: Routes.WelcomPage,
      page: () => WelcomPage(),
    ),
  ];
}

class Routes {
  static const HomePage = '/HomePage';
  static const TreatBasket = '/treat_basket';
  static const Regester = '/regester';
  static const Splash = '/splash';
  static const Login = '/login';
  static const Favorite = '/favotite';
  static const ShopsPage = '/shops_page';
  static const Cart = '/Cart';
  static const ChatDetails = '/ChatDetails';
  static const ShopsProfile = '/shops_profile';
  static const WelcomPage = '/welcom_page';



}