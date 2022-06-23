import 'package:flutter/material.dart';
import 'package:organico/core/constants/pmconst/pm_const.dart';
import 'package:organico/core/extensions/context_extension.dart';
import 'package:organico/core/font/font_style.dart';

class MainAppBarWidget extends StatelessWidget {
  final String text;
  final Widget trailing;
  const MainAppBarWidget({
    Key? key,
    required this.text,
    this.trailing = const SizedBox(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: context.h * 0.07,
        width: context.w,
        padding: PMconst.small,
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: FStyles.headline3s,
            ),
            trailing,
          ],
        ));
  }
}
