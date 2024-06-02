import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFDDE9F7);
const k1PrimaryColor = Color(0xFFE3EDFB);
const kPrimaryLightColor = Color(0xFFF0F8FF);
const kAnimationDuration = Duration(milliseconds: 200);
final kShadow = [
  BoxShadow(
    color: Colors.grey.withOpacity(0.2),
    spreadRadius: 2.0,
    blurRadius: 5.0,
    offset: Offset(3, 3),
  ),
  BoxShadow(
    color: Colors.white,
    spreadRadius: 2.0,
    blurRadius: 5.0,
    offset: Offset(-3, -3),
  ),
];
