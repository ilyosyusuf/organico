import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:organico/config/init/navigation/navigator.dart';
import 'package:organico/core/components/box_full_decoration.dart';
import 'package:organico/core/constants/colors/color_const.dart';
import 'package:organico/core/constants/icons/icon_const.dart';
import 'package:organico/core/constants/pmconst/pm_const.dart';
import 'package:organico/core/extensions/context_extension.dart';
import 'package:organico/widgets/apbar/app_bar_widget.dart';
import 'package:organico/widgets/buttons/elevated_button.dart';
import 'package:organico/widgets/listtilewidgets/coupon_list_tile.dart';

class PaymentMethodView extends StatelessWidget {
  const PaymentMethodView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(
              text: "Payment Method",
              leading: IconButton(
                  onPressed: () {
                    NavigationService.instance.pop("");
                  },
                  icon: IconConst.leftarrow),
            ),
            Padding(
              padding: PMconst.medium,
              child: Container(
                width: context.w,
                padding: PMconst.small,
                child: CouponListTileWidget(
                    leadingColor: ColorConst.whiteGreen,
                    title: "Credit Card",
                    leadingChild: IconConst.creditcard,
                    trailing: IconConst.rightarrow),
                decoration: BoxAllDecoration.decor(Colors.transparent,
                    borderColor: ColorConst.mainColor),
              ),
            ),
            Padding(
              padding: PMconst.medium,
              child: Container(
                width: context.w,
                padding: PMconst.small,
                child: CouponListTileWidget(
                    leadingColor: ColorConst.whiteGreen,
                    title: "PayPal",
                    leadingChild: IconConst.paypal,
                    trailing: IconConst.rightarrow),
                decoration: BoxAllDecoration.decor(Colors.transparent,
                    borderColor: ColorConst.mainColor),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButtonWidget(
        height: context.h * 0.06,
        child: Text("Add Payment"), onPressed: (){}),
    );
  }
}
