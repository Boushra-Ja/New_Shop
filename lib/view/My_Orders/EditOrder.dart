import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:new_shop/logic/controllers/EditPageController.dart';
import '../../utls/Themes.dart';
import '../ConstantPages/MyCustomCLipper.dart';

class EditOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    EditPageController controller = Get.put(EditPageController());

    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: ListView(
            shrinkWrap: true,
            children: [
              ClipPath(
                child: Container(
                  color: Themes.color,
                  height: MediaQuery.of(context).size.height * 0.12,
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
                                      onPressed: () {
                                        Get.back();
                                      },
                                      icon: Icon(
                                        Icons.arrow_back,
                                        color: Themes.color,
                                      ),
                                    ),
                                  ),
                                ),
                              ]))),
                ),
                clipper: MyCustomCLipper(),
              ),
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      shape: BeveledRectangleBorder(
                        side: BorderSide(color: Themes.color2, width: 3),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      margin: EdgeInsets.only(right: 15, left: 15, bottom: 25),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('images/66.jpg'),
                                      fit: BoxFit.contain),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Text(
                                "اسم المنتج",
                                style: Themes.headline1,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "اللون",
                                    style: Themes.bodyText3,
                                  ),
                                  flex: 2,
                                ),
                                Expanded(
                                  child: Obx(() => Container(
                                        height: 30,
                                        child: DropdownButtonFormField(
                                          isDense: true,
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          hint: Text("اختر"),
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      10, 0.001, 12, 0.001),
                                              filled: true,
                                              fillColor: Colors.white),
                                          value: controller.selectedColor.value,
                                          onChanged: (newValue) {
                                            controller.setSelectedColor(
                                                newValue.toString());
                                          },
                                          items:
                                              controller.Colorlist.map((item) {
                                            return DropdownMenuItem(
                                              child: Text(item,
                                                  textDirection:
                                                      TextDirection.rtl,
                                                  textAlign: TextAlign.center,
                                                  style: Themes.subtitle1),
                                              value: item,
                                            );
                                          }).toList(),
                                        ),
                                      )),
                                  flex: 3,
                                ),
                                Expanded(
                                  child: SizedBox.shrink(),
                                  flex: 1,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "الحجم",
                                    style: Themes.bodyText3,
                                  ),
                                  flex: 2,
                                ),
                                Expanded(
                                  child: Obx(() => Container(
                                        height: 30,
                                        child: DropdownButtonFormField(
                                          isDense: true,
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          hint: Text("اختر"),
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      10, 0.001, 12, 0.001),
                                              filled: true,
                                              fillColor: Colors.white),
                                          value: controller.selectedSize.value,
                                          onChanged: (newValue) {
                                            controller.setSelectedSize(
                                                newValue.toString());
                                          },
                                          items:
                                              controller.Sizelist.map((item) {
                                            return DropdownMenuItem(
                                              child: Text(
                                                item,
                                                textDirection:
                                                    TextDirection.rtl,
                                                textAlign: TextAlign.start,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              value: item,
                                            );
                                          }).toList(),
                                        ),
                                      )),
                                  flex: 3,
                                ),
                                Expanded(
                                  child: SizedBox.shrink(),
                                  flex: 1,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "مادة الصنع",
                                    style: Themes.bodyText3,
                                  ),
                                  flex: 2,
                                ),
                                Expanded(
                                  child: Obx(() => Container(
                                        height: 30,
                                        child: DropdownButtonFormField(
                                          isDense: true,
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          hint: Text("اختر"),
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      10, 0.001, 12, 0.001),
                                              filled: true,
                                              fillColor: Colors.white),
                                          value:
                                              controller.selectedMaterial.value,
                                          onChanged: (newValue) {
                                            controller.setSelectedMaterial(
                                                newValue.toString());
                                          },
                                          items: controller.Materiallist.map(
                                              (item) {
                                            return DropdownMenuItem(
                                              child: Text(
                                                item,
                                                textDirection:
                                                    TextDirection.rtl,
                                                textAlign: TextAlign.start,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              value: item,
                                            );
                                          }).toList(),
                                        ),
                                      )),
                                  flex: 3,
                                ),
                                Expanded(
                                  child: SizedBox.shrink(),
                                  flex: 1,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "الكمية",
                                    style: Themes.bodyText3,
                                  ),
                                  flex: 3,
                                ),
                                Expanded(
                                  child: Obx(() => Container(
                                        height: 30,
                                        child: DropdownButtonFormField(
                                          isDense: true,
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          hint: Text("اختر"),
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      10, 0.001, 12, 0.001),
                                              filled: true,
                                              fillColor: Colors.white),
                                          value:
                                              controller.selectedQuantity.value,
                                          onChanged: (newValue) {
                                            controller.setSelectedQuantity(
                                                newValue.toString());
                                          },
                                          items: controller.Quantitylist.map(
                                              (item) {
                                            return DropdownMenuItem(
                                              child: Text(
                                                item,
                                                textDirection:
                                                    TextDirection.rtl,
                                                textAlign: TextAlign.start,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              value: item,
                                            );
                                          }).toList(),
                                        ),
                                      )),
                                  flex: 3,
                                ),
                                Expanded(
                                  child: SizedBox.shrink(),
                                  flex: 3,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: SizedBox.shrink(),
                                  flex: 1,
                                ),
                                Expanded(
                                  child: MaterialButton(
                                    onPressed: () {},
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text("تعديل",
                                        style: TextStyle(color: Themes.color)),
                                    color: Themes.color2,
                                  ),
                                  flex: 2,
                                ),
                                Expanded(
                                  child: SizedBox.shrink(),
                                  flex: 2,
                                ),
                                Expanded(
                                  child: MaterialButton(
                                    onPressed: () {},
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text("حذف",
                                        style: TextStyle(color: Themes.color)),
                                    color: Themes.color2,
                                  ),
                                  flex: 2,
                                ),
                                Expanded(
                                  child: SizedBox.shrink(),
                                  flex: 1,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
        ));
  }
}
