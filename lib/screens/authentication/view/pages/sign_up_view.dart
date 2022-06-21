import 'package:flutter/material.dart';
import 'package:organico/core/constants/icons/icon_const.dart';
import 'package:organico/core/constants/pmconst/pm_const.dart';
import 'package:organico/core/extensions/context_extension.dart';
import 'package:organico/core/font/font_style.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return signInScaffold(context);
  }

  Scaffold signInScaffold(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Padding(
        padding: PMconst.medium,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconConst.welcome,
            SizedBox(height: context.h * 0.06),
            Container(
              height: context.h * 0.08,
              width: context.w,
              color: Colors.amber,),
            // Text("Tekst 😒")
            Text("Welcome", style: FStyles.headline2s,)
          ],
        ),
      ),
    )));
  }
}
