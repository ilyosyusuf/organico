import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/config/init/navigation/navigator.dart';
import 'package:organico/core/constants/icons/icon_const.dart';
import 'package:organico/core/constants/pmconst/pm_const.dart';
import 'package:organico/core/extensions/context_extension.dart';
import 'package:organico/core/font/font_style.dart';
import 'package:organico/screens/home/cubit/home_cubit.dart';
import 'package:organico/widgets/categorywidget/main_products_category_widget.dart';

class SearchView extends StatelessWidget {
  final BuildContext forcontext;
  const SearchView({required this.forcontext, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => HomeCubit(), child: scafold(forcontext));
  }

  Scaffold scafold(BuildContext forcontext) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: forcontext.w * 0.05),
              child: SizedBox(
                height: forcontext.h * 0.1,
                width: forcontext.w,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          NavigationService.instance.pop("");
                        },
                        icon: IconConst.leftarrow),
                    const Spacer(),
                    SizedBox(
                      width: forcontext.w * 0.75,
                      height: forcontext.h * 0.05,
                      child: CupertinoSearchTextField(
                        onChanged: (text) =>
                            forcontext.read<HomeCubit>().search(text),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: PMconst.medium,
              child: SizedBox(
                height: forcontext.h * 0.8,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Recents',
                        style: FStyles.headline5bold,
                      ),
                      SizedBox(height: forcontext.h * 0.01),
                      SizedBox(
                        height: forcontext.h * 0.3,
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 4,
                            itemBuilder: (context, i) {
                              return ListTile(
                                trailing: IconConst.xIcon,
                                leading: IconConst.explore,
                                title: Text(
                                  forcontext
                                      .watch<HomeCubit>()
                                      .mostSearched[i]
                                      .toString(),
                                  style: FStyles.headline5main,
                                ),
                              );
                            }),
                      ),
                      const Text(
                        'Popular',
                        style: FStyles.headline5bold,
                      ),
                      SizedBox(height: forcontext.h * 0.01),
                      SizedBox(
                        height: forcontext.h,
                        width: forcontext.w,
                        child: GridView.builder(
                          itemCount: forcontext
                              .watch<HomeCubit>()
                              .searchedItems
                              .length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: forcontext.h * 0.05,
                                  mainAxisExtent: forcontext.h * 0.35),
                          itemBuilder: (context, i) {
                            return MainProductsCategoryWidget(
                                market: forcontext
                                    .watch<HomeCubit>()
                                    .searchedItems
                                    .toList()[i]['market']
                                    .toString(),
                                image_url: forcontext
                                    .watch<HomeCubit>()
                                    .searchedItems
                                    .toList()[i]['image_url']
                                    .toString(),
                                cost: forcontext
                                    .watch<HomeCubit>()
                                    .searchedItems
                                    .toList()[i]['cost']
                                    .toString(),
                                name: forcontext
                                    .watch<HomeCubit>()
                                    .searchedItems
                                    .toList()[i]['name']
                                    .toString(),
                                height: forcontext.h * 0.15,
                                index: i,
                                color: forcontext
                                    .watch<HomeCubit>()
                                    .colorList[i]);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
