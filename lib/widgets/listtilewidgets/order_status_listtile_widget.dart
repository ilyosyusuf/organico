import 'package:flutter/material.dart';
import 'package:organico/core/components/box_full_decoration.dart';
import 'package:organico/core/extensions/context_extension.dart';
import 'package:organico/core/font/font_style.dart';
import 'package:organico/widgets/listtilewidgets/profile_list_tile_widget.dart';

class OrderStatusWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget trailing;
  final Color color;
  const OrderStatusWidget(
      {this.trailing = const SizedBox(),
      required this.subtitle,
      required this.title,
      required this.color,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.h * 0.087,
      width: context.w * 0.7,
      decoration: BoxAllDecoration.decor(color),
      child: ProfileListTileWidget(title: title, subtitle: Text(subtitle)),
    );
  }
}
