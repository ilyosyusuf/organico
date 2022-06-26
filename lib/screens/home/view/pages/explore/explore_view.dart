import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/core/constants/icons/icon_const.dart';
import 'package:organico/core/extensions/context_extension.dart';
import 'package:organico/screens/home/cubit/home_cubit.dart';
import 'package:organico/screens/home/state/home_state.dart';
import 'package:organico/services/product_data_service.dart';
import 'package:organico/widgets/apbar/app_bar_widget.dart';
import 'package:organico/widgets/categorywidget/main_products_category_widget.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = ProductDataService.instance.productList;
    var cubitData = context.watch<HomeCubit>();
    var cubitDataFunction = context.read<HomeCubit>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(text: "Explore", trailing: IconButton(onPressed: (){
                    cubitDataFunction.changeTheme(ExploreState());
            }, icon: IconConst.sort)),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 18.0, top: 10.0),
                child: SizedBox(
                  child:               GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: context.h * 0.27,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 18.0,
                    ), 
                    itemBuilder: (context, i){
                      return MainProductsCategoryWidget(
                        index: i,
                        name: data[0][i]['name'],
                        color: cubitData.colorList[i],
                        height: context.h * 0.1,
                        cost: data[0][i]['cost'].toString(),
                        image_url: data[0][i]['image_url'].toString(),
                        market: data[0][i]['market'],
                      );
                    },
                    itemCount: data[0].length,
                    )
                ),
              )

            )
          ],
        ),
      )
    );
  }
}