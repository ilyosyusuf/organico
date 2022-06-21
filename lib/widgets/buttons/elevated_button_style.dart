import 'package:flutter/material.dart';
import 'package:organico/core/font/font_style.dart';
import 'package:organico/core/font/radius_const.dart';

class ButtonStyleWidget {
  static elevetedStyle({required double  width,required double height,required BuildContext context, Color backgroundcolor = Colors.red, Color borderColor = Colors.transparent}) {
    return ElevatedButton.styleFrom(
      elevation: 0,
        textStyle: FStyles.headline3s,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(RadiusConst.small)),
        primary: backgroundcolor,
        side: BorderSide(color: borderColor),
        fixedSize: Size(width, height));
  }

}