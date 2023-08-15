import 'package:flutter/material.dart';

class BFSizeFit{
  static MediaQueryData? _mediaQueryData;
  static double screenWidth = 0;
  static double screenHeight = 0;
  static double scale = 1;

  static void initialize(BuildContext context, {double standardWidth = 375}) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size!.width;
    screenHeight = _mediaQueryData!.size!.height;
    scale = screenWidth / standardWidth;

    scale = scale>1.5?1.5:scale;
    scale = scale<=0?1:scale;

  }

  // 按照rxp来设置
  static double setScale(double size) {
    return BFSizeFit.scale * size;
  }
}

extension NumFit on num {
  double get scale {
    return BFSizeFit.setScale(toDouble());
  }
}
