import 'package:flutter/material.dart';
import 'package:organico/core/components/box_only_decoration.dart';
import 'package:organico/core/constants/colors/color_const.dart';
import 'package:organico/core/constants/icons/icon_const.dart';
import 'package:organico/core/constants/pmconst/pm_const.dart';
import 'package:organico/core/extensions/context_extension.dart';

class LeadingForListTile extends StatelessWidget {
  final Color leadingChildColor;
  final Widget leadingChild;
  const LeadingForListTile({
    Key? key,
    required this.leadingChildColor,
    required this.leadingChild,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.w * 0.12,
      height: context.h * 0.06,
      padding: PMconst.extraSmall,
      child: leadingChild,
      decoration: BoxOnlyDecoration.decor(
          leadingChildColor,
          bottomLeft: 10.0,
          bottomRight: 10.0,
          topLeft: 10.0,
          topRight: 10.0),
    );
  }
}