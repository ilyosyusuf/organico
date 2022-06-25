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
  const CouponView({required this.forcontext,Key? key}) : super(key: key);

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
          leading: IconButton(onPressed: (){
NavigationService.instance.pop("");
          }, icon: IconConst.leftarrow),
          text: 'Cupon'),
        Padding(
          padding: PMconst.medium,
          child: SizedBox(
            height: context.h * 0.8,
            child: ListView.builder(
                itemCount: data.cuponSubtitle.length,
                itemBuilder: (_, __) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: forcontext.h * 0.02),
                    child: CouponListTileWidget(
                        listTileColor: __ != 3 ? ColorConst.whitePink : ColorConst.white,
                        leadingColor: ColorConst.whitePink,
                        leadingChild: Container(
                                  width: context.w * 0.12,
                                  height: context.w * 0.12,
                                  padding: PMconst.extraSmall,
                                  child: IconConst.coupon,
                                  decoration: BoxOnlyDecoration.decor(
                                      ColorConst.white,
                                      bottomLeft: 10.0,
                                      bottomRight: 10.0,
                                      topLeft: 10.0,
                                      topRight: 10.0),
                                ),
                        title: data.cuponTitle[__],
                        subtitle: Text(data.cuponSubtitle[__], style: FStyles.headline5main,)),
                  );
                }),
          ),
        )
      ],
    )),
  );
  }
}
