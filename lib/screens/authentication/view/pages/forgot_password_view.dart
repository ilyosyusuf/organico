import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/core/components/keyboard_service.dart';
import 'package:organico/core/constants/icons/icon_const.dart';
import 'package:organico/core/constants/pmconst/pm_const.dart';
import 'package:organico/core/extensions/context_extension.dart';
import 'package:organico/core/font/font_style.dart';
import 'package:organico/screens/authentication/cubit/auth_cubit.dart';
import 'package:organico/screens/authentication/state/auth_state.dart';
import 'package:organico/widgets/apbar/app_bar_widget.dart';
import 'package:organico/widgets/buttons/elevated_button.dart';
import 'package:organico/widgets/textform/intl_phone_field_widget.dart';
import 'package:organico/widgets/textform/text_form_widget.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return forgotPasswordScaffold(context);
  }

  Scaffold forgotPasswordScaffold(BuildContext context) {
    var data = context.watch<AuthCubit>();
    var dataFonction = context.read<AuthCubit>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(
              text: "Forgot Password",
              onPressed: () {
                dataFonction.changeState(SignInState());
              },
            ),
            SingleChildScrollView(
              child: Padding(
                padding: PMconst.medium,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (!KeyBoardService.instance.isKeyBoard(context))
                      IconConst.forgot,
                    SizedBox(height: context.h * 0.04),
                    const Text("Enter Your Phone Number",
                        style: FStyles.headline2s),
                    const Text(
                      "We need to verify you. We will send you a one-time authorization code. ",
                      style: FStyles.headline5main,
                    ),
                    SizedBox(height: context.h * 0.04),
                    PhoneTextField.phoneField(
                        text: "Your Phone Number",
                        controller: data.phoneController),
                    SizedBox(height: context.h * 0.1),
                    ElevatedButtonWidget(
                        height: context.h * 0.06,
                        width: context.w,
                        child: const Text(
                          "Next",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          dataFonction.changeState(OtacNumberState());
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
