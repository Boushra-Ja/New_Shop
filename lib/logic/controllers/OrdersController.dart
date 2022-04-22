
import 'package:get/get.dart';

class OrdersController extends GetxController{

  int index = 0 ;

  void setindex(int val){
    index = val ;
    update();
  }
}