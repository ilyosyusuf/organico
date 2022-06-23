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
  // final Color color;
  final int index;
  const MainProductsCategoryWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubitData = context.watch<HomeCubit>();
    return Padding(
      padding: const EdgeInsets.only(left: 18.0),
      child: Container(
        height: context.h * 0.27,
        width: context.w * 0.47,
        padding: PMconst.small,
        decoration: BoxAllDecoration.decor(cubitData.colorList[index]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: context.h * 0.1,child: Image.asset(ProductDataService.instance.productList[0][index]['image_url'].toString())),
            SizedBox(height: context.h * 0.01),
            Text(ProductDataService.instance.productList[0][index]['name'].toString(), style: FStyles.headline4sbold),
            Text(ProductDataService.instance.productList[0][index]['market'].toString(), style: FStyles.headline5main),
            SizedBox(height: context.h * 0.02),
            Row(
              children: [
                Text('${ProductDataService.instance.productList[0][2]['cost']} / Kg', style: FStyles.headline4sbold),
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
