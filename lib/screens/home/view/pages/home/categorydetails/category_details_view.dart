import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/config/init/navigation/navigator.dart';
import 'package:organico/core/constants/colors/color_const.dart';
import 'package:organico/core/constants/icons/icon_const.dart';
import 'package:organico/core/extensions/context_extension.dart';
import 'package:organico/screens/home/cubit/home_cubit.dart';
import 'package:organico/screens/home/state/home_state.dart';
import 'package:organico/services/product_data_service.dart';
import 'package:organico/widgets/apbar/app_bar_widget.dart';
import 'package:organico/widgets/categorywidget/main_products_category_widget.dart';

class CategoryDetailsView extends StatelessWidget {
  final List data;
  const CategoryDetailsView({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return categoryDetailsScaffold(data[1]);
  }

  Scaffold categoryDetailsScaffold(BuildContext context) {
    var productData = ProductDataService.instance.productList[data[0]];
    var cubitData = context.watch<HomeCubit>();
    var cubitDataFunction = context.read<HomeCubit>();
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          AppBarWidget(
              text: data[2].toString(),
              leading: IconButton(
                  onPressed: () {
                    NavigationService.instance.pop("");
                  },
                  icon: HomeCubit.isDark ? IconConst.leftarrowwhite : IconConst.leftarrow,),
                  trailing: IconButton(
                  onPressed: () {
                  },
                  icon: HomeCubit.isDark ? IconConst.sortwhite : IconConst.sort,),
                  ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(right: 18.0, top: 10.0),
            child: SizedBox(
                child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: context.h * 0.27,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 18.0,
              ),
              itemBuilder: (context, i) {
                return InkWell(
                  onTap: () {
                    NavigationService.instance
                        .pushNamed(routeName: '/detailsview', args: productData[i]);
                  },
                  child: MainProductsCategoryWidget(
                    index: i,
                    name: productData[i]['name'],
                    color: cubitData.colorList[i],
                    height: context.h * 0.1,
                    cost: productData[i]['cost'].toString(),
                    image_url: productData[i]['image_url'].toString(),
                    market: productData[i]['market'],
                  ),
                );
              },
              itemCount: productData.length,
            )),
          ))
        ],
      ),
    ));
  }
}
