import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/core/components/box_full_decoration.dart';
import 'package:organico/core/extensions/context_extension.dart';
import 'package:organico/core/font/font_style.dart';
import 'package:organico/screens/home/cubit/home_cubit.dart';

class CategoriesWidget extends StatelessWidget {
  final int index;
  const CategoriesWidget({
    Key? key,
    required this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = context.watch<HomeCubit>();
    return Padding(
      padding: EdgeInsets.only(left: 18.0),
      child: InkWell(
        child: Container(
          height: context.h * 0.16,
          width: context.w * 0.32,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(data.categoriesList[index], width: 80),
                SizedBox(height: context.h * 0.01),
                Text(
                  data.categoriesName[index],
                  style: FStyles.headline5bold,
                ),
              ],
            ),
          ),
          decoration: BoxAllDecoration.decor(data.colorList[index])),
      ),
    );
  }
}