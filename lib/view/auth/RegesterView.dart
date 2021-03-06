import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:new_shop/utls/Themes.dart';

import '../../logic/controllers/RegesterController.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Directionality(
            textDirection: TextDirection.rtl,
            child:


            ListView(children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: ExactAssetImage('images/login.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.25,
                      child: Stack(
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: 20),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              child:
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                color: Themes.color2,
                                elevation: 10,
                                child:

                                SingleChildScrollView(
                           child:


                                  Form(
                                    key: controller.registerFormkey,
                                    child: Column(children: <Widget>[
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 15),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10.0),
                                              child: Text(
                                                "?????????? ??????????????  ",
                                                style: Themes.subtitle3,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        margin:
                                            EdgeInsets.only(left: 20, right: 15),
                                        child: TextFormField(
                                         // key: controller.registerFormkeyn,
                                          controller: controller.nameController,
                                          validator: (v) {
                                            if (v!.isEmpty)
                                              return '???????? ???????? ??????????';
                                            else if (v.length > 100)
                                              return "???? ???????? ???? ???????? ???????? ??????????";
                                            else if (v.length < 2)
                                              return "???? ???????? ???? ???????? ?????? ???? ??????????";
                                            return null;                                        },
                                          onSaved: (v) {controller.name=v!;

                                          print("=============================================");
                                          print("${controller.name}");
                                          print("=============================================");
                                          },

                                          style: TextStyle(
                                            //: 40.0,
                                            height: 1.0,
                                          ),
                                          autocorrect: true,
                                          autovalidateMode: AutovalidateMode.onUserInteraction,

                                          decoration:  InputDecoration(
                                            hintText: ' ???????? ????????....',
                                            hintStyle: Themes.subtitle3,
                                            filled: true,
                                            errorMaxLines: 10,
                                            fillColor: Colors.white70,
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(100.0)),
                                              borderSide: BorderSide(
                                                  color: Colors.black, width: 1),
                                            )
                                            ,
                                            errorBorder:OutlineInputBorder(

                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(100.0)),

                                              borderSide: BorderSide(
                                                  color: Colors.red, width: 1),


                                            ),

                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(100.0)),
                                              borderSide:
                                                  BorderSide(color: Colors.red),
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: 20, right: 15),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10.0),
                                              child: Text(
                                                "???????????? ????????????????????  ",
                                                style: Themes.subtitle3,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 20, right: 20, top: 5),
                                        height: 50,
                                        child: TextFormField(
                                       //   key: controller.registerFormkeye,

                                          controller: controller.emailController,
                                          validator: (v) {
                                            controller.validateEmail(v!);
                                            if (v.isEmpty)
                                              return '???????? ???????????? ??????????';
                                            else if (v.length > 100)
                                              return "???? ???????? ???? ???????? ???????? ??????????";
                                            else if (v.length < 2)
                                              return "???? ???????? ???? ???????? ?????? ???? ??????????";
                                            return null;

                                            },
                                          onSaved: (v) {controller.email=v!;
                                          },
                                          style: TextStyle(
                                            //: 40.0,
                                            height: 1.0,
                                          ),
                                          autocorrect: true,
                                          autovalidateMode: AutovalidateMode.onUserInteraction,

                                          decoration: InputDecoration(
                                            // errorStyle: TextStyle(),
                                            // errorText: 'Please enter something',
                                            hintText:
                                                ' ???????? ?????????? ????????????????????....',
                                            hintStyle: Themes.subtitle3,
                                            filled: true,
                                            fillColor: Colors.white70,
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(100.0)),
                                              borderSide: BorderSide(
                                                  color: Colors.black, width: 1),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(50.0)),
                                              borderSide: BorderSide(
                                                  color: Colors.deepPurple),
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height: 10,
                                      ),

                                      Container(
                                        margin:
                                            EdgeInsets.only(left: 20, right: 15),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10.0),
                                              child: Text(
                                                "???????? ????????????  ",
                                                style: Themes.subtitle3,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 20, right: 20, top: 5),
                                        height: 50,
                                        child: TextFormField(
                                          //key: controller.registerFormkeyp,
                                               autovalidateMode: AutovalidateMode.onUserInteraction,
                                          controller: controller.passwordController,
                                          validator: (v) {
                                            controller.validatePassword(v!);
                                            if (v.isEmpty)
                                              return '???????? ???????? ???????? ??????????';
                                            else if (v.length > 100)
                                              return "???? ???????? ???? ???????? ???????? ??????????";
                                            else if (v.length < 2)
                                              return "???? ???????? ???? ???????? ?????? ???? ??????????";
                                            return null;
                                          },
                                          onSaved: (v) {controller.password=v!;
                                          },
                                          style: TextStyle(
                                            //: 40.0,
                                            height: 1.0,
                                          ),
                                          autocorrect: true,
                                          decoration: InputDecoration(
                                            errorStyle: TextStyle(),
                                            // errorText: 'Please enter something',
                                            hintText: ' ???????? ???????? ????????????....',
                                            hintStyle: Themes.subtitle3,
                                            filled: true,
                                            fillColor: Colors.white70,
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(100.0)),
                                              borderSide: BorderSide(
                                                  color: Colors.black, width: 1),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(50.0)),
                                              borderSide: BorderSide(
                                                  color: Colors.deepPurple),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),



                                      Obx(()=>
                                      controller.isLoading.value == true ?
                                      const  Center(child:
                                      CircularProgressIndicator ()): const Text("")),
                                      // ElevatedButton(
                                      //     onPressed: () {controller.doRegister();
                                      //     },
                                      //     child: const Text("Register")),


                                      MaterialButton(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 25),
                                        onPressed: () {
                                          controller.doRegister();
                                        },
                                        color: Themes.color,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Text(
                                          "?????????? ????????",
                                          style: Themes.subtitle3,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ]),
                                  ),
                                ),
                              )),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Center(
                                  child: MaterialButton(
                                    onPressed: () {},
                                    color: Colors.purple[50],
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text(
                                      "?????????? ????????  ",
                                      style: Themes.subtitle3,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Center(
                                  child: MaterialButton(
                                    onPressed: () {
                                      Get.offNamed('/login');
                                    },
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text(
                                      "?????????? ???????? ",
                                      style: Themes.subtitle3,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 100,
              ),
            ])


        ));
  }
}
