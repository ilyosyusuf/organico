import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/core/constants/colors/color_const.dart';
import 'package:organico/core/constants/pmconst/pm_const.dart';
import 'package:organico/core/extensions/context_extension.dart';
import 'package:organico/core/font/font_style.dart';
import 'package:organico/screens/home/cubit/home_cubit.dart';
import 'package:organico/services/product_data_service.dart';
import 'package:organico/widgets/buttons/elevated_button.dart';
import 'package:organico/widgets/container/bordered_container_widget.dart';
import 'package:organico/widgets/listtilewidgets/profile_list_tile_widget.dart';
import 'package:organico/widgets/listview/orders_listview_widget.dart';

class HistoryView extends StatelessWidget {
  final BuildContext forcontext;
  const HistoryView({Key? key, required this.forcontext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return historyContainer(forcontext);
  }

  Container historyContainer(BuildContext context) {
    var data = ProductDataService.instance.productList;
    // var cubitData = context.watch<HomeCubit>();

    List colorList = [
      ColorConst.whiteGreen,
      ColorConst.whitePink,
      ColorConst.whiteYellow,
      ColorConst.blackPink,
      ColorConst.whiteGreen,
      ColorConst.whitePink,
      ColorConst.whiteYellow,
      ColorConst.blackPink
    ];

    List categoriesList = [
      'assets/images/paprika.png',
      'assets/images/banana.png',
      'assets/images/broccoli.png',
    ];

    return Container(
      child: Padding(
        padding: PMconst.small,
        child: Column(
          children: [
            BorderedContainerWidget(
              containerChild: Column(
                children: [
                  ProfileListTileWidget(
                      title: "Popey Shop - New York",
                      trailing: Text("Completed",
                          style: TextStyle(color: ColorConst.kPrimaryColor))),
                  SizedBox(
                      height: forcontext.h * 0.10,
                      child: OrdersListViewWidget(
                          imageData: categoriesList,
                          colorData: colorList,
                          itemCount: categoriesList.length)),
                  Padding(
                    padding: PMconst.small,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("02 Mar 2021", style: FStyles.headline5main),
                        ElevatedButtonWidget(
                            width: context.w * 0.5,
                            child: Text("Order again"),
                            onPressed: () {})
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: context.h * 0.04),
            BorderedContainerWidget(
              containerChild: Column(
                children: [
                  ProfileListTileWidget(
                      title: "Popey Shop - New York",
                      trailing: Text("Canceled", style: FStyles.headline5main)),
                  SizedBox(
                      height: forcontext.h * 0.10,
                      child: OrdersListViewWidget(
                          imageData: categoriesList,
                          colorData: colorList,
                          itemCount: categoriesList.length)),
                  Padding(
                    padding: PMconst.small,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("27 Feb 2021", style: FStyles.headline5main),
                        ElevatedButtonWidget(
                            width: context.w * 0.5,
                            child: Text("Order again"),
                            onPressed: () {})
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
