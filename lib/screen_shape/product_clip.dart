import 'package:flutter/material.dart';

class ProductClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height -38);

//    var firstControlPoint = new Offset((size.width / 375)*2, size.height-75);
//    var firstEndPoint = new Offset((size.width / 375)*4,size.height - 80);
//    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
//        firstEndPoint.dx, firstEndPoint.dy);

    var firstControlPoint =
    Offset((size.width / 375)*4 , size.height-47);
    var firstEndPoint = Offset((size.width / 375)*6, size.height -45);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
//
//    var thirdControlPoint =
//    Offset(size.width - (size.width / 4), size.height+100);
//    var thirdEndPoint = Offset((size.width/375)*367, size.height - 120);
//    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
//        thirdEndPoint.dx, thirdEndPoint.dy);

    var thirdControlPoint =
    Offset(size.width - (size.width / 2), size.height+40);
    var thirdEndPoint = Offset((size.width/375)*369, size.height - 45);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);

    var fourthControlPoint =
    Offset((size.width / 375)*371 , size.height- 47);
    var fourthEndPoint = Offset((size.width / 375)*375, size.height -38);
    path.quadraticBezierTo(fourthControlPoint.dx, fourthControlPoint.dy,
        fourthEndPoint.dx, fourthEndPoint.dy);

//    var fifthControlPoint =
//    Offset((size.width / 375)*373, size.height-75);
//    var fifthEndPoint = Offset(size.width, size.height - 73);
//    path.quadraticBezierTo(fifthControlPoint.dx, fifthControlPoint.dy,
//        fifthEndPoint.dx, fifthEndPoint.dy);


    path.lineTo(size.width, size.height - 38);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;

  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}