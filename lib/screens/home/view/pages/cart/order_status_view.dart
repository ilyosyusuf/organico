import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/config/init/navigation/navigator.dart';
import 'package:organico/core/components/box_full_decoration.dart';
import 'package:organico/core/components/box_only_decoration.dart';
import 'package:organico/core/constants/colors/color_const.dart';
import 'package:organico/core/constants/icons/icon_const.dart';
import 'package:organico/core/constants/pmconst/pm_const.dart';
import 'package:organico/core/extensions/context_extension.dart';
import 'package:organico/core/font/font_style.dart';
import 'package:organico/screens/home/cubit/home_cubit.dart';
import 'package:organico/widgets/apbar/app_bar_widget.dart';
import 'package:organico/widgets/buttons/elevated_button.dart';
import 'package:organico/widgets/container/bordered_container_widget.dart';
import 'package:organico/widgets/listtilewidgets/leading_for_listtile_widget.dart';
import 'package:organico/widgets/listtilewidgets/profile_list_tile_widget.dart';
import 'package:organico/widgets/listview/orders_listview_widget.dart';
import 'package:organico/widgets/rating/rating_dialog_widget.dart';
import 'package:rating_dialog/rating_dialog.dart';

class OrderStatusView extends StatelessWidget {
  final BuildContext forcontext;
  const OrderStatusView({Key? key, required this.forcontext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return orderScaffold(forcontext);
  }

  Scaffold orderScaffold(BuildContext context) {
    var data = context.watch<HomeCubit>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(
                leading: IconButton(
                    onPressed: () {
                      NavigationService.instance.pop("");
                    },
                    icon: IconConst.leftarrow),
                text: 'Popey Shop - New York'),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: PMconst.small,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Order Status", style: FStyles.headline4sbold),
                      SizedBox(height: context.h * 0.02),
                      BorderedContainerWidget(
                          containerChild: ProfileListTileWidget(
                              title: "Completed",
                              subtitle: const Text("10:25 AM"),
                              trailing: IconConst.rightarrow)),
                      SizedBox(height: context.h * 0.03),
                      Text("Overview", style: FStyles.headline4sbold),
                      SizedBox(height: context.h * 0.02),
                      BorderedContainerWidget(
                        height: context.h * 0.3,
                        containerChild: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: data.overviewNames.length,
                          itemBuilder: (context, i) {
                            return Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(data.overviewNames[i],
                                            style: FStyles.headline5main),
                                        Text(":", style: FStyles.headline5main),
                                      ],
                                    )),
                                    SizedBox(width: context.w * 0.03),
                                    Expanded(
                                        child: Text(data.overviewDetails[i],
                                            style: FStyles.headline5bold)),
                                  ],
                                ),
                                SizedBox(height: context.h * 0.02),
                              ],
                            );
                          },
                        ),
                      ),
                      SizedBox(height: context.h * 0.03),
                      Text("Order Summary", style: FStyles.headline4sbold),
                      SizedBox(height: context.h * 0.02),
                      BorderedContainerWidget(
                        height: context.h * 0.12,
                        containerChild: OrdersListViewWidget(
                          imageData: data.categoriesList,
                          colorData: data.colorList,
                          itemCount: 2,
                        ),
                      ),
                      SizedBox(height: context.h * 0.03),
                      Text("Delivery", style: FStyles.headline4sbold),
                      SizedBox(height: context.h * 0.02),
                      BorderedContainerWidget(
                        containerChild: Column(
                          children: [
                            Row(
                              children: [
                                IconConst.pinlocation,
                                SizedBox(width: context.w * 0.03),
                                Text("4517 Washington Ave. New York 39495",
                                    style: FStyles.headline5main)
                              ],
                            ),
                            Row(
                              children: [
                                IconConst.location,
                                SizedBox(width: context.w * 0.03),
                                Text("Home", style: FStyles.headline5main)
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: context.h * 0.03),
                      Text("Coupon", style: FStyles.headline4sbold),
                      SizedBox(height: context.h * 0.02),
                      BorderedContainerWidget(
                        containerChild: ProfileListTileWidget(
                          title: "Free Shipping",
                          leading: LeadingForListTile(
                              leadingChildColor: ColorConst.whiteGreen,
                              leadingChild: IconConst.coupon),
                        ),
                      ),
                      SizedBox(height: context.h * 0.03),
                      Text("Payment Method", style: FStyles.headline4sbold),
                      SizedBox(height: context.h * 0.02),
                      BorderedContainerWidget(
                        containerChild: ProfileListTileWidget(
                          title: "Credit Card",
                          leading: LeadingForListTile(
                              leadingChildColor: ColorConst.whiteGreen,
                              leadingChild: IconConst.creditcard),
                        ),
                      ),
                      SizedBox(height: context.h * 0.03),
                      SizedBox(
                        width: context.w,
                        height: context.h * 0.2,
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: data.totalNames.length,
                            itemBuilder: (context, i) {
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(data.totalNames[i],
                                          style: i == 3
                                              ? FStyles.headline4s
                                              : FStyles.headline5main),
                                      Text(data.totalCosts[i],
                                          style: i == 3
                                              ? FStyles.headline4s
                                              : FStyles.headline5main),
                                    ],
                                  ),
                                  SizedBox(height: context.h * 0.02),
                                ],
                              );
                            }),
                      ),
                      SizedBox(height: context.h * 0.03),
                      ElevatedButtonWidget(
                          height: context.h * 0.06,
                          width: context.w,
                          child: Text("Order again"),
                          onPressed: () {}),
                      SizedBox(height: context.h * 0.03),
                      ElevatedButtonWidget(
                        height: context.h * 0.06,
                        width: context.w,
                        backgroundColor: ColorConst.white,
                        borderColor: ColorConst.kPrimaryColor,
                        child: const Text(
                          "Rate Now",
                          style: TextStyle(color: ColorConst.kPrimaryColor),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return RatingDialogWidget();
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
