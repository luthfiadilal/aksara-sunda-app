import 'package:aksara_sunda/main.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final ParentStyle mainContainerStyle = ParentStyle()
  ..width(double.infinity.w)
  ..height(120.h)
  ..padding(all: 20)
  ..margin(all: 20)
  ..borderRadius(all: 20.r)
  ..background.image(
    path: "images/mesh_gradasi.jpg",
    fit: BoxFit.cover,
  );

final TxtStyle mainTextStyle = TxtStyle()
  ..fontSize(22.sp)
  ..bold()
  ..maxLines(2);

final ParentStyle iconContainerStyle = ParentStyle()
  ..width(40.w)
  ..height(40.h)
  ..margin(right: 20);
