import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/core/constants/pmconst/pm_const.dart';
import 'package:organico/core/extensions/context_extension.dart';
import 'package:organico/core/font/font_style.dart';
import 'package:organico/screens/authentication/cubit/auth_cubit.dart';
import 'package:organico/widgets/apbar/app_bar_widget.dart';
import 'package:organico/widgets/textform/text_form_widget.dart';

class AuthorizationView extends StatelessWidget {
  const AuthorizationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = context.watch<AuthCubit>();
    var dataFonction = context.read<AuthCubit>();
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          AppBarWidget(onPressed: () {}, text: "OTAC Number"),
          SizedBox(height: context.h * 0.05),
          Text("Enter Authorization Code", style: FStyles.headline3s),
          SizedBox(height: context.h * 0.03),
          Text("We have sent SMS to:", style: FStyles.headline5main),
          SizedBox(height: context.h * 0.01),
          Text("+998(XX) XXX XX XX", style: FStyles.headline3s),
          SizedBox(height: context.h * 0.03),
          MyTextField.textField(
              text: "6 Digit Code", controller: data.authorizationController),
          Padding(
            padding: PMconst.extraSmall,
            child: Container(
              alignment: Alignment.centerRight,
              height: context.h * 0.03,
              width: context.h,
              child: InkWell(
                onTap: () {},
                child: const Text(
                  "Resend Code",
                  style: FStyles.headline5text,
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
