import 'package:flutter/material.dart';

const webScreen = 1000;
const tabScreen = 800;
const mobileScreen = 500;

bool webScreens(context) {
  double width = MediaQuery.sizeOf(context).width;
  print('your width is $width');
  bool isWebScreen = width >= webScreen;
  return isWebScreen;
}
