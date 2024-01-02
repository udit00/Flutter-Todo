import 'dart:js';

import 'package:flutter/material.dart';

class ScreenDimension {
  static double width = 0.0;
  static double height = 0.0;

  static void setDimensions(BuildContext context) {
    ScreenDimension.height = MediaQuery.of(context).size.height;
    ScreenDimension.width = MediaQuery.of(context).size.width;
  }
}