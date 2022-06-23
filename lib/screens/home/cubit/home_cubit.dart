import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/core/constants/colors/color_const.dart';
import 'package:organico/screens/home/state/home_state.dart';
import 'package:flutter/services.dart' as bundle;

class HomeCubit extends Cubit<MainHomeState> {
  HomeCubit() : super(HomeState());

  // List for profucts
  List productList = [];

  Future getProducts() async {
    final data =
        await bundle.rootBundle.loadString('lib/core/mock/product_data.json');
    productList = jsonDecode(data) as List;
    print(productList);
    emit(HomeState());
    return productList;
  }

  // List for categories in homeview
  List categoriesList = [
    'assets/images/broccoli.png',
    'assets/images/banana.png',
    'assets/images/meat.png'
  ];

  // List for categories name in homeview
    List categoriesName = [
    'Vegetables',
    'Fruits',
    'Meats'
  ];

  List colorList = [ColorConst.whiteGreen, ColorConst.whitePink, ColorConst.whiteYellow];
}
