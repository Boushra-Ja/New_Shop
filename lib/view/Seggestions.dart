import 'package:flutter/material.dart';
import 'package:get/get.dart';
List<String> images = [
  "images/1.jpg",
  "images/2.jpg",
  "images/3.jpg",
  "images/5.jpg",
  "images/8.jpg",
  "images/9.jpg",
  "images/11.jpg",
  "images/44.jpg",
  "images/55.jpg",
  "images/jk.jpg",
  "images/9.jpg",
  "images/11.jpg",
  "images/44.jpg",
  "images/55.jpg",

];
class Seggestions extends StatelessWidget
    //GetView<FavoriteController>
{
  var check_tap;
  @override
  Widget build(BuildContext context) {
    return
       Directionality(
          textDirection: TextDirection.rtl,
          child:
          Scaffold(

          body:
          Column(children: <Widget>[


             Column(children: [ Row(
                children: [
                  Container(margin:EdgeInsets.only(right:10,top:60), child: IconButton(onPressed: (){
                    Get.offAllNamed("/HomePage");
                  },icon: Icon(Icons.arrow_back),),),
                  Container(margin:EdgeInsets.only(top:60,right:20,bottom: 10),
                      child:Text("اقتراحات قد تعجبك",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.pink[900],fontSize: 20),)),
                ],
              ),
               ],),
            Divider(
                thickness:  1 ,
                color: Colors.black
            ),
                 Expanded(flex:8,child: ListView.builder(

                   itemBuilder: (BuildContext, index){
                     return Container(
                       child: ListTile(
                         leading: CircleAvatar(radius:40,backgroundImage: AssetImage(images[index]),),
                         title: Text("اسم المنتج",style: TextStyle(color: Colors.black,fontSize: 20)),
                         subtitle: Text("4567.00",style: TextStyle(color: Colors.red,fontSize: 13),),
                       ),
                     );
                   },
                   itemCount: images.length,
                   //shrinkWrap: true,
                  // padding: EdgeInsets.all(5),
                 //  scrollDirection: Axis.vertical,
                 ),)])








          ));
  }}