import 'package:flutter/cupertino.dart';
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
import 'package:organico/services/product_data_service.dart';
import 'package:organico/widgets/categorywidget/categories_widget.dart';
import 'package:organico/widgets/categorywidget/main_products_category_widget.dart';
import 'package:organico/widgets/listtilewidgets/category_list_tile.dart';
import 'package:organico/widgets/listtilewidgets/coupon_list_tile.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return homeScaffold(context);
  }

  Scaffold homeScaffold(BuildContext context) {
    var data = ProductDataService.instance.productList;
    var cubitData = context.watch<HomeCubit>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: context.h * 0.01),
            const Text("Your Location", style: FStyles.headline52),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Bandun, Cimahi", style: FStyles.headline4sbold),
                IconConst.downarrow,
              ],
            ),
            SizedBox(height: context.h * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: CupertinoSearchTextField(
                onTap: (){
                  NavigationService.instance.pushNamed(routeName: '/search_view', args: context);
                },
                placeholder: "Search anything here",
                padding: PMconst.small,
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            SizedBox(height: context.h * 0.03),
            CouponListTileWidget(
              leadingColor: ColorConst.whiteGreen,
              title: "You have 3 coupon",
              subtitle:
                  Text("Let’s use this coupon", style: FStyles.headline5main),
              leadingChild: IconConst.coupon,
              trailing: IconConst.rightarrow,
              onTap: () {
                NavigationService.instance
                    .pushNamed(routeName: '/coupon_view', args: context);
              },
            ),
            SizedBox(height: context.h * 0.01),
            CategoryListTile(text: "Choose Category"),
            Container(
              height: context.h * 0.16,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cubitData.categoriesName.length,
                itemBuilder: (context, i) {
                  return InkWell(
                    onTap: (){
                      NavigationService.instance.pushNamed(
                            routeName: '/categorydetailsview', args: [
                              i,
                              context,
                              cubitData.categoriesName[i]
                            ]);

                    },
                    child: CategoriesWidget(index: i));
                },
              ),
            ),
            SizedBox(height: context.h * 0.03),
            CategoryListTile(text: "Best Selling"),
            Container(
              height: context.h * 0.27,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data[0].length,
                itemBuilder: (context, i) {
                  return InkWell(
                      onTap: () {
                        NavigationService.instance.pushNamed(
                            routeName: '/detailsview', args: data[0][i]);
                      },
                      child: MainProductsCategoryWidget(
                        index: i,
                        name: data[0][i]['name'],
                        color: cubitData.colorList[i],
                        height: context.h * 0.1,
                        cost: data[0][i]['cost'].toString(),
                        image_url: data[0][i]['image_url'].toString(),
                        market: data[0][i]['market'],
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
