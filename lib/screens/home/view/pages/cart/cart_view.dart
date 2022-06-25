import 'package:flutter/material.dart';
import 'package:organico/config/init/navigation/navigator.dart';
import 'package:organico/core/components/box_full_decoration.dart';
import 'package:organico/core/constants/colors/color_const.dart';
import 'package:organico/core/constants/icons/icon_const.dart';
import 'package:organico/core/constants/pmconst/pm_const.dart';
import 'package:organico/core/extensions/context_extension.dart';
import 'package:organico/core/font/font_style.dart';
import 'package:organico/services/product_data_service.dart';
import 'package:organico/widgets/apbar/app_bar_widget.dart';
import 'package:organico/widgets/buttons/elevated_button.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = ProductDataService.instance.productList;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(text: "My Cart"),
            SizedBox(height: context.h * 0.04),
            Padding(
              padding: PMconst.small,
              child: Container(
                width: context.w,
                padding: PMconst.small,
                decoration: BoxAllDecoration.decor(Colors.transparent,
                    borderColor: ColorConst.mainColor),
                child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: ColorConst.whiteGreen,
                        child: IconConst.home,
                      ),
                      title: const Text(
                        "Popey Shop - New York",
                        style: FStyles.headline5bold,
                      ),
                    ),
                    Container(
                      padding: PMconst.small,
                      decoration: BoxAllDecoration.decor(ColorConst.whiteGreen),
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
                                    child: const Text(
                                      "1",
                                      style: FStyles.headline5bold,
                                    ),
                                  ),
                                ),
                                InkWell(child: IconConst.plusbutton),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: PMconst.small,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: context.h * 0.06,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Total", style: FStyles.headline5main),
                  Text("\$${data[0][2]['cost']}", style: FStyles.headline5bold)
                ],
              ),
            ),
            ElevatedButtonWidget(
                width: context.w * 0.6,
                height: context.h * 0.06,
                child: const Text("Add to bag"),
                onPressed: () {
                  NavigationService.instance.pushNamed(routeName: '/orderstatusview', args: context);
                })
          ],
        ),
      ),
    );
  }
}
