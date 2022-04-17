import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_shop/logic/controllers/FavoriteController.dart';
import '../utls/Themes.dart';

class Favorite extends GetView<FavoriteController> {
  var check_tap;
  @override
  Widget build(BuildContext context) {
    return
      GetBuilder<FavoriteController>(builder: (controller) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child:
       Scaffold(

            body:

            Column(children: <Widget>[
              Expanded(   flex: 1,
                child:   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Container(margin:EdgeInsets.only(top:20,right:30,bottom: 10),child:Text("المفضله",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.pink[900],fontSize: 20),)),
                         Divider(
                        thickness:  1 ,
                        color: Colors.black
                        )]),
                   ),
              Expanded(
              flex: 1,
              child:  Padding(
                  padding: const EdgeInsets.only(top:10.0),
                  child: Row(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child:
                          InkWell(
                            child: Container( height: 50, child:  Center(child:

                            Column(
                              children: [
                                Text("المتاجر", textAlign: TextAlign.center),
                                Divider(
                                  thickness: controller.Tabbar.value==1 ? 3 : 1,
                                  color: controller.Tabbar.value==1
                                      ? Colors.pink[900]
                                      : Colors.grey.shade200,
                                   // indent: MediaQuery.of(context).size.width * 0.5

                                )
                              ],
                            ),)),
                            onTap: (){
                              controller.Tabbar.value=1;
                              controller.changeTabbar(1);
                                print( controller.Tabbar.value);


                            },
                          )),

                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child:
                          InkWell(child: Container( height: 50, child:  Center(child:

                          Column(
                            children: [
                              Text("المنتجات", textAlign: TextAlign.center),
                              Divider(
                                thickness: controller.Tabbar.value==2 ? 3 : 1,
                                color: controller.Tabbar.value==2
                                    ? Colors.pink[900]
                                    : Colors.grey.shade200,

                              )
                            ],
                          ),)),
                          onTap: (){

                            controller.Tabbar.value=2;
                            controller.changeTabbar(2);
                            print( controller.Tabbar);

                          },))



                    ]),
               ),

            ),
              Expanded(flex: 7,

                 child: controller.Tabbar.value==2?
                  GridView.builder(
                     shrinkWrap: true,
                     padding: const EdgeInsets.symmetric(horizontal: 15),
                     itemCount: 3,
                     itemBuilder: (ctx, i) {
                       return
                         Container(
                          width: MediaQuery.of(context).size.width * 0.5,

                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(50)),
                           margin: EdgeInsets.all(5),
                           padding: EdgeInsets.all(5),
                           child: Stack(
                             children: [
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.stretch,
                                 children: [
                                   Expanded(
                                     child:  Center(
                                         child: CircleAvatar(
                                           backgroundImage: i==0? AssetImage("images/shop2.jpg"):i==1?
                                           AssetImage("images/4.jpg"):AssetImage("images/8.jpg"),
                                           //NetworkImage('https://cdn.pixabay.com/photo/2013/05/11/08/28/sunset-110305_1280.jpg'),
                                           backgroundColor: Colors.red.shade800,
                                           radius: 90,
                                         )),
                                   ),
                                   Row(
                                     children: [
                                       Text(
                                         '  اسم المتجر  ',
                                         style: TextStyle(
                                           fontSize: 18,
                                           fontWeight: FontWeight.bold,
                                         ),
                                       ),
                                       Icon(
                                         Icons.star_outline_rounded,
                                         color: Colors.purple,
                                         size: 30,
                                       ),
                                     ],

                                   ),
                                   Row(
                                     children: [
                                       Text(
                                         '    مبيعات 10  ',
                                         style:
                                         Themes.subtitle2,

                                       ),

                                     ],

                                   ),
                                   Row(
                                     children: const [
                                       Icon(
                                         Icons.star,
                                         color: Colors.yellow,
                                         size: 15,
                                       ),
                                       Icon(
                                         Icons.star,
                                         color: Colors.yellow,
                                         size: 15,
                                       ),
                                       Icon(
                                         Icons.star,
                                         color: Colors.yellow,
                                         size: 15,
                                       ),
                                       Icon(
                                         Icons.star,
                                         color: Colors.yellow,
                                         size: 15,
                                       ),
                                       Icon(
                                         Icons.star,
                                         color: Colors.pink,
                                         size: 15,
                                       )
                                     ],
                                   ),

                                 ],
                               ),
                             ],
                           ),
                         );

                     },
                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                       crossAxisCount: 2,
                       childAspectRatio: 1.0,
                       crossAxisSpacing: 50.0,
                       mainAxisSpacing: 50,
                       mainAxisExtent: 264,
                     ),
                   )


                 : GridView.builder(
                     shrinkWrap: true,
                     padding: const EdgeInsets.symmetric(horizontal: 15),
                     itemCount: 4,
                     itemBuilder: (ctx, i) {
                       return
                         Container(
                           width: MediaQuery.of(context).size.width * 0.5,

                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(50)),
                           margin: EdgeInsets.all(5),
                           padding: EdgeInsets.all(5),
                           child: Stack(
                             children: [
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.stretch,
                                 children: [
                                   Expanded(
                                     child:  Center(
                                         child: i==0?   Image.asset("images/th.jpg"):i==1?
                                         Image.asset("images/tt.jpg"):i==3?  Image.asset("images/100.jpg"):
                                         Image.asset("images/44.jpg"),


                                          ),
                                   ),
                                   Row(
                                     children: [
                                       Text(
                                         '  اسم المتجر  ',
                                         style: TextStyle(
                                           fontSize: 18,
                                           fontWeight: FontWeight.bold,
                                         ),
                                       ),
                                       Icon(
                                         Icons.star_outline_rounded,
                                         color: Colors.purple,
                                         size: 30,
                                       ),
                                     ],

                                   ),
                                   Row(
                                     children: [
                                       Text(
                                         '    مبيعات 10  ',
                                         style:
                                         Themes.subtitle2,

                                       ),

                                     ],

                                   ),
                                   Row(
                                     children: const [
                                       Icon(
                                         Icons.star,
                                         color: Colors.yellow,
                                         size: 15,
                                       ),
                                       Icon(
                                         Icons.star,
                                         color: Colors.yellow,
                                         size: 15,
                                       ),
                                       Icon(
                                         Icons.star,
                                         color: Colors.yellow,
                                         size: 15,
                                       ),
                                       Icon(
                                         Icons.star,
                                         color: Colors.yellow,
                                         size: 15,
                                       ),
                                       Icon(
                                         Icons.star,
                                         color: Colors.pink,
                                         size: 15,
                                       )
                                     ],
                                   ),

                                 ],
                               ),
                             ],
                           ),
                         );

                     },
                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                       crossAxisCount: 2,
                       childAspectRatio: 1.0,
                       crossAxisSpacing: 50.0,
                       mainAxisSpacing: 50,
                       mainAxisExtent: 264,
                     ),
                   ),


    ),])));
      });
  }}




