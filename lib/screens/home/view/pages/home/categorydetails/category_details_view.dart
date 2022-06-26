import 'package:flutter/material.dart';
import 'package:organico/core/constants/colors/color_const.dart';
import 'package:organico/core/constants/icons/icon_const.dart';
import 'package:organico/core/extensions/context_extension.dart';
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
    return Scaffold(
    body: SafeArea(
      child: Column(
        children: [
          AppBarWidget(text: "Categories", trailing: IconButton(onPressed: (){}, icon: IconConst.sort)),
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
                      name: productData[i]['name'],
                      color: ColorConst.whiteGreen,
                      height: context.h * 0.1,
                      cost: productData[i]['cost'].toString(),
                      image_url: productData[i]['image_url'].toString(),
                      market: productData[i]['market'],
                    );
                  },
                  itemCount: productData.length,
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