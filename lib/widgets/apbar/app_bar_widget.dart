import 'package:flutter/material.dart';
import 'package:organico/core/constants/icons/icon_const.dart';
import 'package:organico/core/extensions/context_extension.dart';
import 'package:organico/core/font/font_style.dart';

class AppBarWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const AppBarWidget({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.h * 0.07,
      child: Row(
        children: [
          IconButton(onPressed: onPressed, icon: IconConst.leftarrow),
          Text(text, style: FStyles.headline4sbold),
        ],
      ),
    );
  }
}
