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
            // SafeArea(
            //   child: Padding(
            //     padding: const EdgeInsets.all(12),
            //     child: Center(
            //         child: Form(
            //           key: controller.registerFormkey,
            //           autovalidateMode: AutovalidateMode.onUserInteraction,
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               TextFormField(
            //                 controller: controller.nameController,
            //                 validator: (v) { },
            //                 onSaved: (v) {controller.name=v!;},
            //                 keyboardType: TextInputType.text,
            //                 decoration: InputDecoration(
            //                   border: OutlineInputBorder(
            //                     borderRadius: BorderRadius.circular(10),
            //                   ),
            //                   labelText: "name",
            //                   prefixIcon: const Icon(Icons.supervised_user_circle),
            //                 ),
            //               ),
            //               const SizedBox(height: 10),
            //               TextFormField(
            //                 controller: controller.emailController,
            //                 validator: (v) {  controller.validateEmail(v!);},
            //                 onSaved: (v) {controller.email=v!;
            //                 },
            //                 keyboardType: TextInputType.emailAddress,
            //                 decoration: InputDecoration(
            //                   border: OutlineInputBorder(
            //                     borderRadius: BorderRadius.circular(10),
            //                   ),
            //                   labelText: "email",
            //                   prefixIcon: const Icon(Icons.email),
            //                 ),
            //               ),
            //               const SizedBox(height: 10),
            //               TextFormField(
            //                 controller: controller.passwordController,
            //                 validator: (v) {controller.validatePassword(v!);},
            //                 onSaved: (v) {  controller.password=v!;},
            //                 keyboardType: TextInputType.visiblePassword,
            //                 obscureText: true,
            //                 decoration: InputDecoration(
            //                   border: OutlineInputBorder(
            //                     borderRadius: BorderRadius.circular(10),
            //                   ),
            //                   labelText: "password",
            //                   prefixIcon: const Icon(Icons.password),
            //                 ),
            //               ),
            //               const SizedBox (height: 20),
            //               Obx(()=>
            //               controller.isLoading.value == true ?
            //               const  Center(child:
            //               CircularProgressIndicator ()): const Text("")),
            //               ElevatedButton(
            //                   onPressed: () {controller.doRegister();
            //                   },
            //                   child: const Text("Register"))
            //             ],
            //           ),
            //         )),
            //   ),
            // ),

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
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                color: Themes.color2,
                                elevation: 10,
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
                                              "الاسم الثلاثي  ",
                                              style: Themes.bodyText1,
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
                                            return 'ادخل اسما صحيحا';
                                          else if (v.length > 100)
                                            return "لا يمكن ان يكون بهذا الحجم";
                                          else if (v.length < 2)
                                            return "لا يمكن ان تكون اقل من حرفين";
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

                                        decoration: const InputDecoration(
                                          hintText: ' ادخل اسمك....',
                                          hintStyle: Themes.subtitle2,
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
                                      height: 30,
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
                                              "البريد الالكتروني  ",
                                              style: Themes.bodyText1,
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
                                            return 'ادخل ايميلا صحيحا';
                                          else if (v.length > 100)
                                            return "لا يمكن ان يكون بهذا الحجم";
                                          else if (v.length < 2)
                                            return "لا يمكن ان يكون اقل من حرفين";
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
                                              ' ادخل بريدك الالكتروني....',
                                          hintStyle: Themes.subtitle2,
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
                                      height: 30,
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
                                              "كلمه المرور  ",
                                              style: Themes.bodyText1,
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
                                            return 'ادخل كلمة مرور صحيحا';
                                          else if (v.length > 100)
                                            return "لا يمكن ان يكون بهذا الحجم";
                                          else if (v.length < 2)
                                            return "لا يمكن ان تكون اقل من حرفين";
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
                                          hintText: ' ادخل كلمه المرور....',
                                          hintStyle: Themes.subtitle2,
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
                                      height: 30,
                                    ),



                                    const SizedBox (height: 20),
                                    Obx(()=>
                                    controller.isLoading.value == true ?
                                    const  Center(child:
                                    CircularProgressIndicator ()): const Text("")),
                                    // ElevatedButton(
                                    //     onPressed: () {controller.doRegister();
                                    //     },
                                    //     child: const Text("Register")),


                                    RaisedButton(
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
                                        "انشاء حساب",
                                        style: Themes.bodyText4,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ]),
                                ),
                              )),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Center(
                                  child: RaisedButton(
                                    onPressed: () {},
                                    color: Colors.purple[50],
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text(
                                      "انشاء حساب  ",
                                      style: Themes.headline1,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Center(
                                  child: RaisedButton(
                                    onPressed: () {
                                      Get.toNamed('/login');
                                    },
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text(
                                      "تسجيل دخول ",
                                      style: Themes.bodyText1,
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
                height: 50,
              ),
            ])


        ));
  }
}
