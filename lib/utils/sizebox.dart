import 'package:flutter/material.dart';

Widget setHeight({required double height}) {
  return SizedBox(
    height: height,
  );
}

Widget setWidth({required double width}) {
  return SizedBox(
    width: width,
  );
}

Widget setHeightWidth({required double height, required double width,required Widget child}) {
  return SizedBox(
    width: width,
    height: height,
    child: child,
  );
}
