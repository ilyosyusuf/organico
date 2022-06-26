import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/config/init/navigation/navigator.dart';
import 'package:organico/core/components/box_only_decoration.dart';
import 'package:organico/core/constants/colors/color_const.dart';
import 'package:organico/core/constants/icons/icon_const.dart';
import 'package:organico/core/constants/pmconst/pm_const.dart';
import 'package:organico/core/extensions/context_extension.dart';
import 'package:organico/core/font/font_style.dart';
import 'package:organico/screens/home/cubit/home_cubit.dart';
import 'package:organico/widgets/apbar/app_bar_widget.dart';
import 'package:organico/widgets/listtilewidgets/coupon_list_tile.dart';

class CouponView extends StatelessWidget {
  final BuildContext forcontext;
  const CouponView({required this.forcontext, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return scafold(forcontext);
  }

  Scaffold scafold(BuildContext context) {
    var data = context.watch<HomeCubit>();

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            AppBarWidget(
                leading: IconButton(
                    onPressed: () {
                      NavigationService.instance.pop("");
                    },
                    icon: HomeCubit.isDark ? IconConst.leftarrowwhite : IconConst.leftarrow,),
                text: 'Your Cupon'),
            Padding(
              padding: PMconst.medium,
              child: SizedBox(
                height: context.h * 0.8,
                child: ListView.builder(
                  itemCount: data.cuponSubtitle.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: forcontext.h * 0.02),
                      child: Container(
                        height: context.h * 0.11,
                        alignment: Alignment.center,
                        decoration: BoxOnlyDecoration.decor(
                          i != 3 ? ColorConst.blackPink : ColorConst.whiteGreen,
                          topLeft: 15.0,
                          topRight: 15.0,
                          bottomLeft: 15.0,
                          bottomRight: 15.0,
                        ),
                        child: CouponListTileWidget(
                          listTileColor: Colors.transparent,
                          leadingColor: ColorConst.white,
                          leadingChild: IconConst.coupon,
                          title: data.cuponTitle[i],
                          subtitle: Text(
                            data.cuponSubtitle[i],
                            style: FStyles.headline5main,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
