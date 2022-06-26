import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/config/init/navigation/navigator.dart';
import 'package:organico/core/constants/colors/color_const.dart';
import 'package:organico/core/constants/icons/icon_const.dart';
import 'package:organico/core/constants/pmconst/pm_const.dart';
import 'package:organico/core/extensions/context_extension.dart';
import 'package:organico/core/font/font_style.dart';
import 'package:organico/screens/home/cubit/home_cubit.dart';
import 'package:organico/widgets/apbar/app_bar_widget.dart';
import 'package:organico/widgets/buttons/elevated_button.dart';
import 'package:organico/widgets/cart/cart_widget.dart';
import 'package:organico/widgets/container/bordered_container_widget.dart';
import 'package:organico/widgets/listtilewidgets/coupon_list_tile.dart';
import 'package:organico/widgets/listtilewidgets/leading_for_listtile_widget.dart';
import 'package:organico/widgets/textform/text_form_widget.dart';

class BagView extends StatelessWidget {
  final BuildContext newcontext;
  const BagView({required this.newcontext, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return scafold(newcontext);
  }

  Scaffold scafold(BuildContext context) {
    var cubitData = newcontext.watch<HomeCubit>();
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ElevatedButtonWidget(
          height: context.h * 0.06,
          child: Text("Order Now"),
          onPressed: () {
            NavigationService.instance
                .pushNamed(routeName: '/orderstatusview', args: context);
          }),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            AppBarWidget(
              text: 'My bag',
              leading: IconButton(onPressed: () {
                NavigationService.instance.pop("");
              }, icon: IconConst.leftarrow),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: PMconst.extraSmall,
                      child: Container(
                        width: newcontext.w,
                        padding: PMconst.small,
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
                            CartWidget(
                              index: 3,
                              newcontext: context,
                            ),
                            CartWidget(newcontext: newcontext, index: 5),
                            ElevatedButtonWidget(
                                height: context.h * 0.06,
                                width: context.w,
                                backgroundColor: ColorConst.white,
                                borderColor: ColorConst.kPrimaryColor,
                                child: Text(
                                  "Add more +",
                                  style: TextStyle(
                                      color: ColorConst.kPrimaryColor),
                                ),
                                onPressed: () {}),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: PMconst.medium,
                      child: SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Address',
                              style: FStyles.headline4sbold,
                            ),
                            SizedBox(height: context.h * 0.01),
                            MyTextField.textField(
                              suffixIcon: IconButton(
                                icon: IconConst.pen,
                                onPressed: () {},
                              ),
                              text:
                                  '3517 W. Gray St. Utica, Pennsylvania 57867',
                              maxlines: 5,
                            ),
                            SizedBox(height: context.h * 0.03),
                            const Text(
                              'Note',
                              style: FStyles.headline4sbold,
                            ),
                            SizedBox(height: context.h * 0.01),
                            MyTextField.textField(
                              text:
                                  'Please check the product before packaging.',
                              maxlines: 5,
                            ),
                            SizedBox(height: context.h * 0.03),
                            const Text(
                              'Card',
                              style: FStyles.headline4sbold,
                            ),
                            SizedBox(height: context.h * 0.01),
                            BorderedContainerWidget(
                              containerChild: CouponListTileWidget(
                                leadingColor: ColorConst.whiteGreen,
                                leadingChild: LeadingForListTile(
                                    leadingChildColor: ColorConst.whiteGreen,
                                    leadingChild: IconConst.coupon),
                                title: 'Free shipping',
                                trailing: IconConst.rightarrow,
                              ),
                            ),
                            SizedBox(height: context.h * 0.03),
                            const Text(
                              'Payment method',
                              style: FStyles.headline4sbold,
                            ),
                            SizedBox(height: context.h * 0.01),
                            BorderedContainerWidget(
                                containerChild: CouponListTileWidget(
                              leadingColor: ColorConst.whiteGreen,
                              leadingChild: LeadingForListTile(
                                  leadingChildColor: ColorConst.whiteGreen,
                                  leadingChild: IconConst.creditcard),
                              title: 'Credit Card',
                            )),
                            SizedBox(height: context.h * 0.03),
                            SizedBox(
                              height: context.h * 0.3,
                              child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: newcontext
                                      .watch<HomeCubit>()
                                      .baginfo
                                      .length,
                                  itemBuilder: (context, i) {
                                    return Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(cubitData.baginfo[i],
                                                style: i == 3
                                                    ? FStyles.headline4sbold
                                                    : FStyles.headline5main),
                                            Text(cubitData.baginfoprice[i],
                                                style: i == 3
                                                    ? FStyles.headline4sbold
                                                    : FStyles.headline5main),
                                          ],
                                        ),
                                        SizedBox(height: context.h * 0.02),
                                      ],
                                    );
                                  }),
                            ),

                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
