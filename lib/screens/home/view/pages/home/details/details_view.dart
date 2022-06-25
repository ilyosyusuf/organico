import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/config/init/navigation/navigator.dart';
import 'package:organico/core/components/box_only_decoration.dart';
import 'package:organico/core/constants/colors/color_const.dart';
import 'package:organico/core/constants/icons/icon_const.dart';
import 'package:organico/core/constants/pmconst/pm_const.dart';
import 'package:organico/core/extensions/context_extension.dart';
import 'package:organico/core/font/font_style.dart';
import 'package:organico/widgets/apbar/app_bar_widget.dart';
import 'package:organico/widgets/buttons/elevated_button.dart';
import 'package:readmore/readmore.dart';

class DetailsView extends StatelessWidget {
  final Map product;
  const DetailsView({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButtonWidget(
                  height: context.h * 0.06,
                  width: context.w * 0.8,
                  child: Text('Add to cart'),
                  onPressed: () {}),
              SizedBox(
                width: context.w * 0.03,
              ),
              IconConst.message
            ],
          )
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarWidget(
              text: "",
              leading: IconButton(
                icon: IconConst.leftarrow,
                onPressed: () {
                  NavigationService.instance.pop("");
                },
              ),
              trailing: IconButton(onPressed: (){}, icon: IconConst.heart)
            ),
            SizedBox(
              height: context.h * 0.873,
              child: Padding(
                padding: PMconst.small,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 5,
                        child: SizedBox(
                          width: context.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: SizedBox(
                                  height: context.h * 0.25,
                                  width: context.w * 0.7,
                                  child: Image.asset(
                                    product['image_url'],
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Text(
                                product['name'],
                                style: FStyles.headline4sbold,
                              ),
                              Row(
                                children: [
                                  Text(
                                    product['market'],
                                    style: FStyles.headline5main,
                                  ),
                                  const Spacer(),
                                  IconConst.minusbutton,
                                  SizedBox(
                                      width: context.w * 0.1,
                                      child: const Center(
                                          child: Text(
                                        '14',
                                        style: FStyles.headline4sbold,
                                      ))),
                                  IconConst.plusbutton
                                ],
                              ),
                              Text(
                                '${product['cost']} / Kg',
                                style: FStyles.headline4sbold,
                              )
                            ],
                          ),
                        )),
                    Expanded(
                        flex: 6,
                        child: SizedBox(
                          width: context.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Details',
                                style: FStyles.headline5bold,
                              ),
                              SizedBox(height: context.h * 0.02),
                              ReadMoreText(
                                product['details'],
                                style: FStyles.headline5main,
                                trimLines: 3,
                                colorClickableText: ColorConst.dark,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: 'Show more',
                                trimExpandedText: 'Show less',
                                moreStyle: FStyles.headline5bold,
                                lessStyle: FStyles.headline5bold,
                              ),
                              SizedBox(
                                height: context.h * 0.02,
                              ),
                              ListTile(
                                leading: Container(
                                  width: context.w * 0.12,
                                  height: context.w * 0.12,
                                  padding: PMconst.extraSmall,
                                  child: IconConst.clock,
                                  decoration: BoxOnlyDecoration.decor(
                                      ColorConst.whiteGreen,
                                      bottomLeft: 10.0,
                                      bottomRight: 10.0,
                                      topLeft: 10.0,
                                      topRight: 10.0),
                                ),
                                title: const Text(
                                  'Time Delivery',
                                  style: FStyles.headline5bold,
                                ),
                                subtitle: const Text(
                                  '35 - 40 minut',
                                  style: FStyles.headline5main,
                                ),
                              ),
                              SizedBox(
                                height: context.h * 0.02,
                              ),
                              ListTile(
                                leading:Container(
                                  width: context.w * 0.12,
                                  height: context.w * 0.12,
                                  padding: PMconst.extraSmall,
                                  child: IconConst.tag,
                                  decoration: BoxOnlyDecoration.decor(
                                      ColorConst.whiteGreen,
                                      bottomLeft: 10.0,
                                      bottomRight: 10.0,
                                      topLeft: 10.0,
                                      topRight: 10.0),
                                ),
                                title: const Text(
                                  'Category',
                                  style: FStyles.headline5bold,
                                ),
                                subtitle: Text(
                                  product['category'],
                                  style: FStyles.headline5main,
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
