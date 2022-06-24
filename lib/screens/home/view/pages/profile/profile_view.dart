import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/core/constants/colors/color_const.dart';
import 'package:organico/core/constants/icons/icon_const.dart';
import 'package:organico/core/extensions/context_extension.dart';
import 'package:organico/core/font/font_style.dart';
import 'package:organico/screens/home/cubit/home_cubit.dart';
import 'package:organico/widgets/apbar/main_app_bar_widget.dart';
import 'package:organico/widgets/listtilewidgets/category_list_tile.dart';
import 'package:organico/widgets/listtilewidgets/coupon_list_tile.dart';
import 'package:organico/widgets/listtilewidgets/profile_list_tile_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubitData = context.watch<HomeCubit>();
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          MainAppBarWidget(
            text: "Profile",
            trailing:
                IconButton(onPressed: () {}, icon: IconConst.notification),
          ),
          SizedBox(height: context.h * 0.01),
          CircleAvatar(
            radius: 70,
            foregroundImage: AssetImage('assets/images/Avatar.png'),
          ),
          SizedBox(height: context.h * 0.01),
          Text("Jane Doe", style: FStyles.headline4sbold),
          Text("(307) 555-0133", style: FStyles.headline5main),
          SizedBox(height: context.h * 0.04),
          Expanded(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: cubitData.titleList.length,
              itemBuilder: (context, i){
              return ProfileListTileWidget(leadingColor: ColorConst.profilemaincolor, title: cubitData.titleList[i], leadingChild: cubitData.profileIconList[i]);
            }) 
          )

        ],
      ),
    ));
  }
}
