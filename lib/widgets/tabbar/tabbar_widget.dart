import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/core/constants/colors/color_const.dart';
import 'package:organico/core/constants/icons/icon_const.dart';
import 'package:organico/screens/home/cubit/home_cubit.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabBar(
        activeColor: ColorConst.white,
        currentIndex: context.watch<HomeCubit>().currentIndex,
        
        onTap: (v) => context.read<HomeCubit>().onStateChange(v),
        items: [
          BottomNavigationBarItem(icon: IconConst.homewhite, label: 'Home'),
          BottomNavigationBarItem(icon: IconConst.explore, label: 'Explore'),
          BottomNavigationBarItem(icon: IconConst.cart, label: 'Cart'),
          BottomNavigationBarItem(icon: IconConst.profile, label: 'Profile'),
        ]);
  }
}
