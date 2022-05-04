import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utls/Themes.dart';

class EvaluationDialoge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width - 20,
      child: ListView(
        shrinkWrap: true,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/report.png'), fit: BoxFit.contain),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.tag_faces_outlined,
                  size: 35,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                ),
                Icon(
                  Icons.tag_faces_outlined,
                  size: 35,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                ),
                Icon(
                  Icons.tag_faces_outlined,
                  size: 35,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
              child: TextField(
                onChanged: (newValue) {},
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    label: Padding(
                      padding: EdgeInsets.all(8),
                      child: Center(
                        child: Text(
                          'إرسال ملاحظات',
                          style: Themes.subtitle1,
                        ),
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Themes.color, width: 4.0))),
              )),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
