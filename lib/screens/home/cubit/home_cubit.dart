import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/core/constants/colors/color_const.dart';
import 'package:organico/screens/home/state/home_state.dart';

class HomeCubit extends Cubit<MainHomeState> {
  HomeCubit() : super(HomeState());

  int currentIndex = 0;

  onStateChange(int index) {
    currentIndex = index;
    switch (index) {
      case 0:
        return emit(HomeState());
      case 1:
        return emit(ExploreState());
      case 2:
        return emit(CartState());
      case 3:
        return emit(ProfileState());    
    }
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

  List colorList = [ColorConst.whiteGreen, ColorConst.whitePink, ColorConst.whiteYellow, ColorConst.blackPink, ColorConst.whiteGreen, ColorConst.whitePink, ColorConst.whiteYellow, ColorConst.blackPink];
}
