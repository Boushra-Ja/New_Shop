import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:new_shop/logic/controllers/DrawerController/GiftReqController.dart';
import 'package:new_shop/utls/Themes.dart';
import '../ConstantPages/MyCustomCLipper.dart';
import '../SuggestionPage.dart';

class GiftRequest extends GetView<GiftReqController> {
  @override
  Widget build(BuildContext context) {
    GiftReqController controller = GiftReqController();

    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
         // appBar: RoundedAppBar(),
          body: ListView(
            children: [
              ClipPath(
                child: Container(
                  color: Themes.color,
                  height: MediaQuery.of(context).size.height*0.11,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                      child: Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Themes.color2,
                                  child: Center(
                                    child: IconButton(
                                      onPressed: () {Get.back();},
                                      icon: Icon(
                                        Icons.arrow_back,
                                        color: Themes.color,
                                      ),
                                    ),
                                  ),
                                ),
                              ]))

                  ),
                ),
                clipper: MyCustomCLipper(),
              ),
              SizedBox(height: 20,),
              Center(
                  child: Text(
                "هل ترغب في إسعاد من تحب بهدية لطيفة ؟؟",
                style: TextStyle(color: Themes.color),
              )),
              Center(
                  child: Text(
                "ما عليك سوى تحديد المواصفات وسنساعدك باختيار الهدية",
                style: TextStyle(color: Colors.grey),
              )),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    new BoxShadow(
                      color: Themes.color2,
                    ),
                  ],
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Text(
                                  "مناسبة الهدية",
                                  style: Themes.bodyText1,
                                )),
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: 40,
                                child: TextFormField(
                                  //controller: controller.Gift_Occasion,
                                  keyboardType: TextInputType.text,
                                  validator: (val) {
                                    if (val?.length == 0) {
                                      return "يجب تعبئة الحقل";
                                    }

                                    return null;
                                  },
                                  onSaved: (val) {},
                                  initialValue: "",
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      hintText: 'ادخل هنا....',
                                      hintStyle: Themes.subtitle1,
                                      contentPadding: EdgeInsets.fromLTRB(
                                          10.0, 0.01, 20.0, 0.01),
                                      filled: true,
                                      fillColor: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Text(
                                  "العمر المحدد",
                                  style: Themes.bodyText1,
                                )),
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: 40,
                                child: Obx(() => DropdownButtonFormField(
                                      isDense: true,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      hint: Text("اختر"),
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          contentPadding: EdgeInsets.fromLTRB(
                                              10, 0.001, 12, 0.001),
                                          filled: true,
                                          fillColor: Colors.white),
                                      value: controller.selectedAge.value,
                                      onChanged: (newValue) {
                                        controller.setSelectedAge(
                                            newValue.toString());
                                        // if(controller.selectedAge.value != "")
                                        //   {
                                        //
                                        //   }
                                      },
                                      validator: (val) {
                                        return controller
                                            .validate_age(val.toString());
                                      },
                                      items: controller.Agelist.map((item) {
                                        return DropdownMenuItem(
                                          child: Text(
                                            item,
                                            textDirection: TextDirection.rtl,
                                            textAlign: TextAlign.start,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w300,
                                              color: Colors.black,
                                            ),
                                          ),
                                          value: item,
                                        );
                                      }).toList(),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Text(
                                  "الجنس",
                                  style: Themes.bodyText1,
                                )),
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: 40,
                                child: Obx(() => DropdownButtonFormField(
                                      isDense: true,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      hint: Text("اختر"),
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          contentPadding: EdgeInsets.fromLTRB(
                                              10, 0.001, 12, 0.001),
                                          filled: true,
                                          fillColor: Colors.white),
                                      value: controller.selectedGender.value,
                                      onChanged: (newValue) {
                                        controller.setSelectedGender(
                                            newValue.toString());
                                        // if(controller.selectedAge.value != "")
                                        //   {
                                        //
                                        //   }
                                      },
                                      validator: (val) {
                                        return controller
                                            .validate_gender(val.toString());
                                      },
                                      items: controller.Genderlist.map((item) {
                                        return DropdownMenuItem(
                                          child: Text(
                                            item,
                                            textDirection: TextDirection.rtl,
                                            textAlign: TextAlign.start,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w300,
                                              color: Colors.black,
                                            ),
                                          ),
                                          value: item,
                                        );
                                      }).toList(),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Text(
                                  "مادة الصنع",
                                  style: Themes.bodyText1,
                                )),
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: 40,
                                child: Obx(() => DropdownButtonFormField(
                                      isDense: true,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      hint: Text("اختر"),
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          contentPadding: EdgeInsets.fromLTRB(
                                              10, 0.001, 12, 0.001),
                                          filled: true,
                                          fillColor: Colors.white),
                                      value: controller.selectedMaterial.value,
                                      onChanged: (newValue) {
                                        controller.selectedMaterial(
                                            newValue.toString());
                                      },
                                      validator: (val) {
                                        return controller
                                            .validate_material(val.toString());
                                      },
                                      items:
                                          controller.Materiallist.map((item) {
                                        return DropdownMenuItem(
                                          child: Text(
                                            item,
                                            textDirection: TextDirection.rtl,
                                            textAlign: TextAlign.start,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w300,
                                              color: Colors.black,
                                            ),
                                          ),
                                          value: item,
                                        );
                                      }).toList(),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Text(
                                  "السعر المناسب",
                                  style: Themes.bodyText1,
                                )),
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: 40,
                                child: Obx(() => DropdownButtonFormField(
                                      isDense: true,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      hint: Text("اختر"),
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          contentPadding: EdgeInsets.fromLTRB(
                                              10, 0.001, 12, 0.001),
                                          filled: true,
                                          fillColor: Colors.white),
                                      value: controller.selectedPrice.value,
                                      onChanged: (newValue) {
                                        controller
                                            .selectedPrice(newValue.toString());
                                      },
                                      validator: (val) {
                                        return controller
                                            .validate_price(val.toString());
                                      },
                                      items: controller.Pricelist.map((item) {
                                        return DropdownMenuItem(
                                          child: Text(
                                            item,
                                            textDirection: TextDirection.rtl,
                                            textAlign: TextAlign.start,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w300,
                                              color: Colors.black,
                                            ),
                                          ),
                                          value: item,
                                        );
                                      }).toList(),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 100,
                        height: MediaQuery.of(context).size.height * 0.3,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/present.png'),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.3,
                ),
                child: MaterialButton(
                  onPressed: () {
                    Get.to(SuggestionPage());
                  },
                  color: Themes.color,
                  child: Text("الاقتراحات"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(
                height: 60,
              ),
            ],
          ),
        ));
  }
}
