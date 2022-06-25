import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:organico/core/components/box_full_decoration.dart';
import 'package:organico/core/constants/colors/color_const.dart';
import 'package:organico/core/constants/pmconst/pm_const.dart';
import 'package:organico/core/extensions/context_extension.dart';

class BorderedContainerWidget extends StatelessWidget {
  final Widget containerChild;
  final double? height;
  const BorderedContainerWidget({Key? key, required this.containerChild, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: PMconst.small,
      height: height,
      child: containerChild,
      decoration: BoxAllDecoration.decor(Colors.transparent,
          borderColor: ColorConst.mainColor),
    );
  }
}
