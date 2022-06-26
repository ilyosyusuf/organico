import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/core/constants/icons/icon_const.dart';
import 'package:organico/core/constants/pmconst/pm_const.dart';
import 'package:organico/core/extensions/context_extension.dart';
import 'package:organico/core/font/font_style.dart';
import 'package:organico/screens/authentication/cubit/auth_cubit.dart';
import 'package:organico/screens/authentication/state/auth_state.dart';
import 'package:organico/screens/home/cubit/home_cubit.dart';
import 'package:organico/widgets/apbar/app_bar_widget.dart';
import 'package:organico/widgets/buttons/elevated_button.dart';
import 'package:organico/widgets/textform/text_form_widget.dart';

class OtacNumberView extends StatelessWidget {
  const OtacNumberView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = context.watch<AuthCubit>();
    var dataFonction = context.read<AuthCubit>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(
              text: "OTAC Number",
              leading: IconButton(
                  onPressed: () {
                    dataFonction.changeState(ForgotPasswordState());
                  },
                  icon: HomeCubit.isDark ? IconConst.leftarrowwhite : IconConst.leftarrow,),
            ),
            SizedBox(height: context.h * 0.06),
            const Text("Enter Authorization Code", style: FStyles.headline3s),
            SizedBox(height: context.h * 0.03),
            const Text("We have sent SMS to:", style: FStyles.headline5main),
            SizedBox(height: context.h * 0.005),
            const Text("+998(XX) XXX XX XX", style: FStyles.headline3s),
            SizedBox(height: context.h * 0.03),
            Padding(
              padding: PMconst.small,
              child: Column(
                children: [
                  MyTextField.textField(
                      text: "6 Digit Code",
                      controller: data.authorizationController),
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
                  SizedBox(height: context.h * 0.03),
                  ElevatedButtonWidget(
                      height: context.h * 0.06,
                      child: const Text("Next"),
                      onPressed: () {
                        dataFonction.changeState(ResetPasswordState());
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
