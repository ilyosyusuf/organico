import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/core/components/box_full_decoration.dart';
import 'package:organico/core/constants/icons/icon_const.dart';
import 'package:organico/core/constants/pmconst/pm_const.dart';
import 'package:organico/core/extensions/context_extension.dart';
import 'package:organico/core/font/font_style.dart';
import 'package:organico/screens/home/cubit/home_cubit.dart';
import 'package:organico/services/product_data_service.dart';

class MainProductsCategoryWidget extends StatelessWidget {
  final Color color;
  final int index;
  final double height;
  final String name;
  final String image_url;
  final String cost;
  final String market;
  const MainProductsCategoryWidget({Key? key,
   required this.height,
      required this.index,
      required this.color,
      required this.cost,
      required this.image_url,
      required this.market,
       required this.name,
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubitData = context.watch<HomeCubit>();
    return Padding(
      padding: const EdgeInsets.only(left: 18.0),
      child: Container(
        height: context.h * 0.27,
        width: context.w * 0.47,
        padding: PMconst.small,
        decoration: BoxAllDecoration.decor(color),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height, child: Image.asset(image_url)),
            SizedBox(height: context.h * 0.01),
            Text(name, style: FStyles.headline4sbold),
            Text(market, style: FStyles.headline5main),
            SizedBox(height: context.h * 0.02),
            Row(
              children: [
                Text('$cost / Kg', style: FStyles.headline4sbold),
                const Spacer(),
                IconConst.plusbutton
              ],
            ),
          ],
        ),
      ),
    );
  }
}