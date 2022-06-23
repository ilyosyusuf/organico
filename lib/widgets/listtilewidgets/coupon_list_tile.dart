import 'package:flutter/material.dart';
import 'package:organico/core/components/box_only_decoration.dart';
import 'package:organico/core/constants/icons/icon_const.dart';
import 'package:organico/core/constants/pmconst/pm_const.dart';
import 'package:organico/core/extensions/context_extension.dart';
import 'package:organico/core/font/font_style.dart';

class CouponListTileWidget extends StatelessWidget {
  final Color leadingColor;
  final Color? listTileColor;
  final String title;
  final String subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  const CouponListTileWidget({
    Key? key,
    required this.leadingColor,
    this.listTileColor,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
        leading: Container(
          width: context.w * 0.12,
          height: context.w * 0.12,
          padding: PMconst.extraSmall,
          child: IconConst.coupon,
          decoration: BoxOnlyDecoration.decor(leadingColor,
              bottomLeft: 10.0,
              bottomRight: 10.0,
              topLeft: 10.0,
              topRight: 10.0),
        ),
        title: Text(title, style: FStyles.headline4sbold),
        subtitle: Text(subtitle, style: FStyles.headline5main),
        trailing: trailing);
  }
}
