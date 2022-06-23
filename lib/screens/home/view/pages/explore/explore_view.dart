import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:organico/core/constants/icons/icon_const.dart';
import 'package:organico/core/extensions/context_extension.dart';
import 'package:organico/services/product_data_service.dart';
import 'package:organico/widgets/apbar/main_app_bar_widget.dart';
import 'package:organico/widgets/categorywidget/main_products_category_widget.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = ProductDataService.instance.productList;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MainAppBarWidget(text: "Explore", trailing: IconConst.sort),
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
                      return MainProductsCategoryWidget(index: i);
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