import 'package:flutter/material.dart';
import 'package:organico/core/font/font_style.dart';

class CategoryListTile extends StatelessWidget {
  final String text;
  const CategoryListTile({
    Key? key,
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text, style: FStyles.headline5bold),
      trailing: Text("See all", style: FStyles.headline5main),
    );
  }
}