import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final ParentStyle kamusStyle = ParentStyle()
  ..width(350.w)
  ..height(130.h)
  ..margin(top: 10, right: 16, left: 16)
  ..borderRadius(all: 20.r)
  ..background.color(Colors.yellow);

// Definisikan gaya menggunakan ParentStyle
final ParentStyle kamusCardStyle = ParentStyle()
  ..padding(all: 10)
  ..height(70.h)
  ..borderRadius(all: 20.r)
  ..elevation(1.5);

final ParentStyle containerImageStyle = ParentStyle()
  ..height(130.h)
  ..borderRadius(topLeft: 20.r, topRight: 20.r)
  ..background.image(path: "images/mesh_gradasi.jpg", fit: BoxFit.cover);

final TxtStyle titleStyle = TxtStyle()
  ..fontSize(18.sp)
  ..fontWeight(FontWeight.bold);

final TxtStyle subtitleStyle = TxtStyle()
  ..fontSize(14.sp)
  ..fontWeight(FontWeight.normal);
