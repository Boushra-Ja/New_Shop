
import 'package:get/get.dart';

class SettingPageController extends GetxController{

  var selectedLanguage = 'العربية';
  var langList = [
    'العربية' ,
    'الانجليزية'
  ] ;
  bool chexboxlight = true ;
  bool chexboxdark = false ;

  void setselectedLanguage (String val)
  {
    selectedLanguage = val ;
    update() ;
  }

  void setselectedcheckboxlight (var val)
  {
    chexboxlight = val ;
    update() ;
  }
  void setselectedcheckboxdark (var val)
  {
    chexboxdark = val ;
    update() ;
  }

}