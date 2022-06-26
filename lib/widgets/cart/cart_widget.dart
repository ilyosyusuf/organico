import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/core/components/box_full_decoration.dart';
import 'package:organico/core/constants/icons/icon_const.dart';
import 'package:organico/core/constants/pmconst/pm_const.dart';
import 'package:organico/core/extensions/context_extension.dart';
import 'package:organico/core/font/font_style.dart';
import 'package:organico/core/font/radius_const.dart';
import 'package:organico/screens/home/cubit/home_cubit.dart';
import 'package:organico/services/product_data_service.dart';

class CartWidget extends StatelessWidget {
  final int index;
  final BuildContext newcontext;
  const CartWidget({required this.newcontext, required this.index, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubitData = newcontext.watch<HomeCubit>();
    return Container(
        margin: EdgeInsets.only(bottom: context.h * 0.02),
        padding: PMconst.small,
        decoration: BoxAllDecoration.decor(cubitData.colorList[index]),
        child: Row(
          children: [
            Image.asset(
                ProductDataService.instance.productList[0][index]['image_url'],
                width: 80),
            SizedBox(width: newcontext.w * 0.05),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(ProductDataService.instance.productList[0][index]['name'],
                    style: FStyles.headline5bold),
                Text(
                    "${ProductDataService.instance.productList[0][index]['howmuch']} Kilogram",
                    style: FStyles.headline5bold),
                Text(
                    "\$ ${ProductDataService.instance.productList[0][index]['cost']}",
                    style: FStyles.headline5bold),
              ],
            ),
            SizedBox(width: newcontext.w * 0.07),
            SizedBox(
              width: newcontext.w * 0.25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      splashRadius: RadiusConst.small,
                      onPressed: () {},
                      icon: IconConst.minusbutton),
                  Expanded(
                    child: Center(
                      child: Container(
                        alignment: Alignment.center,
                        child: const Text(
                          "1",
                          style: FStyles.headline5bold,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                      splashRadius: RadiusConst.small,
                      onPressed: () {},
                      icon: IconConst.plusbutton),
                ],
              ),
            )
          ],
        ));
  }
}
