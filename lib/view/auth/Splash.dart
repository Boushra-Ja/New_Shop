import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

import '../../logic/controllers/SplashController.dart';
import '../../utls/Themes.dart';

class RouteAuth extends GetView<SplashController> {

  final storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
        height: MediaQuery.of(context).size.height / 6,
        child: Scaffold(
            body: Column(children: [
              Expanded(child: Obx(() {
                return controller.loading.value
                    ?






                Center(
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: new AssetImage("images/4.jpg"))),
                  ),
                ):
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: Colors.white,
                    ),
                    Positioned(
                        top: -height * .15,
                        right: -MediaQuery.of(context).size.width * .4,
                        child: BezierContainer()),
                    Positioned(
                        top: height / 4 - 10,
                        right: MediaQuery.of(context).size.width - 320,
                        child: Container(
                            child: Image.asset(
                              'images/welcom3.jpg',
                              width: 285.0,
                              height: 270.0,
                              fit: BoxFit.cover,
                            ))),

                  ],
                )


                ;
              },
              )
              ),
            ])
        )
    );
  }
}
class BezierContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Transform.rotate(
          angle: -pi / 3.5,
          child: ClipPath(
            clipper: ClipPainter(),
            child: Container(
              height: MediaQuery.of(context).size.height *.5,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Themes.color , Themes.color]
                  )
              ),
            ),
          ),
        )
    );
  }
}

class ClipPainter extends CustomClipper<Path>{
  @override

  Path getClip(Size size) {
    var height = size.height +50 ;
    var width = size.width + 100;
    var path = new Path();

    path.lineTo(0, size.height );
    path.lineTo(size.width , height);
    path.lineTo(size.width , 0);

    /// [Top Left corner]
    var secondControlPoint =  Offset(0  ,0);
    var secondEndPoint = Offset(width * .2  , height *.3);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);



    /// [Left Middle]
    var fifthControlPoint =  Offset(width * .3  ,height * .5);
    var fiftEndPoint = Offset(  width * .23, height *.6);
    path.quadraticBezierTo(fifthControlPoint.dx, fifthControlPoint.dy, fiftEndPoint.dx, fiftEndPoint.dy);


    /// [Bottom Left corner]
    var thirdControlPoint =  Offset(0  ,height);
    var thirdEndPoint = Offset(width , height  );
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy, thirdEndPoint.dx, thirdEndPoint.dy);

    path.lineTo(0, size.height  );
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}