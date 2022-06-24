import 'package:flutter/material.dart';
import 'package:organico/config/init/navigation/navigator.dart';
import 'package:organico/core/components/box_full_decoration.dart';
import 'package:organico/core/components/box_only_decoration.dart';
import 'package:organico/core/constants/colors/color_const.dart';
import 'package:organico/core/constants/icons/icon_const.dart';
import 'package:organico/core/constants/pmconst/pm_const.dart';
import 'package:organico/core/extensions/context_extension.dart';
import 'package:organico/widgets/apbar/app_bar_widget.dart';
import 'package:organico/widgets/buttons/elevated_button.dart';
import 'package:organico/widgets/listtilewidgets/profile_list_tile_widget.dart';

class AddressView extends StatelessWidget {
  const AddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(
              text: "My Address",
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
                decoration: BoxAllDecoration.decor(Colors.transparent,
                    borderColor: ColorConst.mainColor),
                child: ProfileListTileWidget(
                    title: "Home",
                    subtitle: const Text("3517 W. Gray St. Utica, Pennsylvania 57867"),
                    trailing: IconConst.rightarrow),
              ),
            ),
            Padding(
              padding: PMconst.medium,
              child: Container(
                width: context.w,
                padding: PMconst.small,
                decoration: BoxAllDecoration.decor(Colors.transparent,
                    borderColor: ColorConst.mainColor),
                child: ProfileListTileWidget(
                    title: "Work",
                    subtitle: const Text("2715 Ash Dr. San Jose, South Dakota 83475"),
                    trailing: IconConst.rightarrow),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButtonWidget(
          height: context.h * 0.06,
          child: const Text("Add Address"),
          onPressed: () {}),
    );
  }
}