import 'package:flutter/material.dart';

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(20 , size.height-5, 30, size.height-50);
    path.quadraticBezierTo(60 , 60, size.width-80, 40);
    path.quadraticBezierTo(size.width-40 , 40, size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
  
}

// --------------------------------------------------
// --------------------------------------------------
// --------------------------------------------------
// ---------- @Fluter_Tg
// --------------------------------------------------
// --------------------------------------------------
// --------------------------------------------------
// --------------------------------------------------