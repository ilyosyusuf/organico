import 'package:flutter/material.dart';
import 'package:organico/core/components/box_only_decoration.dart';
import 'package:organico/core/constants/icons/icon_const.dart';
import 'package:organico/core/constants/pmconst/pm_const.dart';
import 'package:organico/core/extensions/context_extension.dart';
import 'package:organico/core/font/font_style.dart';

class CouponListTileWidget extends StatelessWidget {
  const CouponListTileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: context.w * 0.12,
        height: context.w * 0.12,
        padding: PMconst.extraSmall,
        child: IconConst.coupon,
        decoration: BoxOnlyDecoration.decor(Colors.green, bottomLeft: 10.0, bottomRight: 10.0, topLeft: 10.0, topRight: 10.0),
      ),
      title: Text("You have 3 coupon", style: FStyles.headline4sbold),
      subtitle: Text("Let's use this coupon", style: FStyles.headline5main),
      trailing: IconConst.rightarrow
    );
  }
}
