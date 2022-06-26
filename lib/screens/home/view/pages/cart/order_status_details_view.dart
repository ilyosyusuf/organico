import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:im_stepper/stepper.dart';
import 'package:organico/config/init/navigation/navigator.dart';
import 'package:organico/core/constants/colors/color_const.dart';
import 'package:organico/core/constants/icons/icon_const.dart';
import 'package:organico/core/constants/pmconst/pm_const.dart';
import 'package:organico/core/extensions/context_extension.dart';
import 'package:organico/screens/home/cubit/home_cubit.dart';
import 'package:organico/widgets/apbar/app_bar_widget.dart';
import 'package:organico/widgets/listtilewidgets/order_status_listtile_widget.dart';

class OrderStatusDetailsView extends StatelessWidget {
  final BuildContext newcontext;
  const OrderStatusDetailsView({required this.newcontext,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return scafold(newcontext);
  }

  Scaffold scafold(BuildContext context) {
    return Scaffold(
    body: SafeArea(
        child: Column(
      children: [
        AppBarWidget(
          leading: IconButton(onPressed: (){
            NavigationService.instance.pop("");
          }, icon: IconConst.leftarrow),
          text: 'Order Status Details',
        ),
        Padding(
          padding: PMconst.small,
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: context.w * 0.2,
                      height: context.h * 0.55,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: IconStepper(
                          enableNextPreviousButtons: false,
                          stepColor: ColorConst.grey,
                          activeStepColor: ColorConst.kPrimaryColor,
                          direction: Axis.vertical,
                          icons: [
                            IconConst.done,
                            IconConst.done,
                            IconConst.done,
                            IconConst.done,
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                        height: context.h * 0.47,
                        width: context.w * 0.7,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: context.watch<HomeCubit>().orderStatusSubTitles.length,itemBuilder: (_, i) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: context.h * 0.038),
                            child: OrderStatusWidget(
                              color: i == 0 ? ColorConst.grey.withOpacity(0.5) : i == 1 ? ColorConst.grey.withOpacity(0.5) :  i == 2 ? ColorConst.blackPink : i == 3 ? ColorConst.blackPink : ColorConst.white,
                                subtitle: context.watch<HomeCubit>().orderStatusSubTitles[i], title: context.watch<HomeCubit>().orderStatusTitles[i]),
                          );
                        }))
                  ],
                ),
              )
            ],
          ),
        )
      ],
    )),
  );
  }
}
