import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/core/components/box_full_decoration.dart';
import 'package:organico/core/constants/colors/color_const.dart';
import 'package:organico/core/constants/icons/icon_const.dart';
import 'package:organico/core/constants/pmconst/pm_const.dart';
import 'package:organico/core/extensions/context_extension.dart';
import 'package:organico/core/font/font_style.dart';
import 'package:organico/screens/home/cubit/home_cubit.dart';
import 'package:organico/services/product_data_service.dart';
import 'package:organico/widgets/apbar/main_app_bar_widget.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = ProductDataService.instance.productList;
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          MainAppBarWidget(text: "My Cart"),
          SizedBox(height: context.h * 0.04),
          Padding(
            padding: PMconst.small,
            child: Container(
                width: context.w,
                padding: PMconst.small,
                child: Column(
                  children: [
                    ListTile(
                        leading: CircleAvatar(
                          child: IconConst.home,
                          backgroundColor: ColorConst.whiteGreen,
                        ),
                        title: Text(
                          "Popey Shop - New York",
                          style: FStyles.headline5bold,
                        )),
                    Container(
                      padding: PMconst.small,
                      child: Row(
                        children: [
                          Image.asset('assets/images/broccoli.png', width: 80),
                          SizedBox(width: context.w * 0.05),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data[0][2]['name'],
                                  style: FStyles.headline5bold),
                              Text("${data[0][2]['howmuch']} Kilogram",
                                  style: FStyles.headline5main),
                              Text("\$ ${data[0][2]['cost']}",
                                  style: FStyles.headline5bold),
                            ],
                          ),
                          SizedBox(width: context.w * 0.07),
                          SizedBox(
                            width: context.w * 0.25,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(child: IconConst.minusbutton),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text("1", style: FStyles.headline5bold,),
                                  ),
                                ),
                                InkWell(child: IconConst.plusbutton),
                              ],
                            ),
                          )
                        ],
                      ),
                      decoration: BoxAllDecoration.decor(ColorConst.whiteGreen),
                    )
                  ],
                ),
                decoration: BoxAllDecoration.decor(Colors.transparent,
                    borderColor: ColorConst.mainColor)),
          )
        ],
      ),
    ));
  }
}
