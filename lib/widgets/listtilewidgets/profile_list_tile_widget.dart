import 'package:flutter/material.dart';
import 'package:organico/core/components/box_only_decoration.dart';
import 'package:organico/core/constants/icons/icon_const.dart';
import 'package:organico/core/constants/pmconst/pm_const.dart';
import 'package:organico/core/extensions/context_extension.dart';
import 'package:organico/core/font/font_style.dart';

class ProfileListTileWidget extends StatelessWidget {
  final Color leadingColor;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Widget leadingChild;
  const ProfileListTileWidget({
    Key? key,
    required this.leadingColor,
    required this.title,
    this.trailing,
    this.onTap,
    required this.leadingChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
        leading: Container(
          width: context.w * 0.10,
          height: context.w * 0.10,
          padding: PMconst.extraSmall,
          child: leadingChild,
          decoration: BoxOnlyDecoration.decor(leadingColor,
              bottomLeft: 10.0,
              bottomRight: 10.0,
              topLeft: 10.0,
              topRight: 10.0),
        ),
        title: Text(title, style: FStyles.headline5bold),
        trailing: IconConst.rightarrow);
  }
}
