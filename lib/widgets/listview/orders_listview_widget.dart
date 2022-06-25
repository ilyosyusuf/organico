import 'package:flutter/material.dart';
import 'package:organico/core/components/box_only_decoration.dart';
import 'package:organico/core/constants/pmconst/pm_const.dart';
import 'package:organico/core/extensions/context_extension.dart';
import 'package:organico/screens/home/cubit/home_cubit.dart';

class OrdersListViewWidget extends StatelessWidget {
  final List imageData;
  final List colorData;

  const OrdersListViewWidget({
    Key? key,
    required this.imageData,
    required this.colorData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 2,
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Container(
            width: context.w * 0.2,
            height: context.h * 0.12,
            padding: PMconst.extraSmall,
            child: Image.asset(imageData[i]),
            decoration: BoxOnlyDecoration.decor(colorData[i],
                bottomLeft: 10.0,
                bottomRight: 10.0,
                topLeft: 10.0,
                topRight: 10.0),
          ),
        );
      },
    );
  }
}
