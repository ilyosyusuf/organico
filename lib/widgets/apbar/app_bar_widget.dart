import 'package:flutter/material.dart';
import 'package:organico/core/constants/icons/icon_const.dart';
import 'package:organico/core/extensions/context_extension.dart';
import 'package:organico/core/font/font_style.dart';

class AppBarWidget extends StatelessWidget {
  final String text;
  final Widget leading;
  final Widget trailing;
  const AppBarWidget({
    Key? key,
    required this.text,
    this.leading = const SizedBox(),
    this.trailing = const SizedBox(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.h * 0.07,
      child: Row(
        children: [
        leading,
        SizedBox(width: context.w * 0.04),
          Text(text, style: FStyles.headline4sbold),
        Spacer(),
          trailing,
        ],
      ),
    );
  }
}
