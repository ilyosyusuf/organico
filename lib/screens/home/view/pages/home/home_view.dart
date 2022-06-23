import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:organico/core/components/box_only_decoration.dart';
import 'package:organico/core/constants/icons/icon_const.dart';
import 'package:organico/core/constants/pmconst/pm_const.dart';
import 'package:organico/core/extensions/context_extension.dart';
import 'package:organico/core/font/font_style.dart';
import 'package:organico/widgets/listtilewidgets/coupon_list_tile.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return homeScaffold(context);
  }

  Scaffold homeScaffold(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: PMconst.small,
          child: Column(
            children: [
              const Text("Your Location", style: FStyles.headline52),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Bandun, Cimahi", style: FStyles.headline4sbold),
                  IconConst.downarrow,
                ],
              ),
              SizedBox(height: context.h * 0.02),
              CupertinoSearchTextField(
                placeholder: "Search anything here",
                padding: PMconst.small,
                borderRadius: BorderRadius.circular(15.0),
              ),
              SizedBox(height: context.h * 0.04),
              CouponListTileWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

