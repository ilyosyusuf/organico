import 'package:flutter/material.dart';
import 'package:organico/core/components/box_only_decoration.dart';
import 'package:organico/core/constants/icons/icon_const.dart';
import 'package:organico/core/constants/pmconst/pm_const.dart';
import 'package:organico/core/extensions/context_extension.dart';
import 'package:organico/core/font/font_style.dart';

class ProfileListTileWidget extends StatelessWidget {
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Widget? leading;
  const ProfileListTileWidget({
    Key? key,
    required this.title,
    this.trailing,
    this.onTap,
    this.leading
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
        leading: leading,
        title: Text(title, style: FStyles.headline5bold),
        trailing: IconConst.rightarrow);
  }
}


