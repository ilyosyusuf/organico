import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/core/components/keyboard_service.dart';
import 'package:organico/core/constants/colors/color_const.dart';
import 'package:organico/core/constants/icons/icon_const.dart';
import 'package:organico/core/constants/pmconst/pm_const.dart';
import 'package:organico/core/extensions/context_extension.dart';
import 'package:organico/core/font/font_style.dart';
import 'package:organico/screens/authentication/cubit/auth_cubit.dart';
import 'package:organico/screens/authentication/state/auth_state.dart';
import 'package:organico/widgets/apbar/app_bar_widget.dart';
import 'package:organico/widgets/buttons/elevated_button.dart';
import 'package:organico/widgets/textform/text_form_widget.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return signInScaffold(context);
  }

  Scaffold signInScaffold(BuildContext context) {
    var data = context.watch<AuthCubit>();
    var dataFunction = context.read<AuthCubit>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(
              text: "Reset Password",
                            leading: IconButton(onPressed: (){
                dataFunction.changeState(SignInState());
              }, icon: IconConst.leftarrow),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: PMconst.small,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                          "Please fill in the field below to reset your current password.",
                          style: FStyles.headline5main),
                      SizedBox(height: context.h * 0.03),
                      SizedBox(height: context.h * 0.02),
                      const Text("New Password", style: FStyles.headline4text),
                      SizedBox(height: context.h * 0.01),
                      StatefulBuilder(
                        builder: ((context, setState) {
                          return MyTextField.textField(
                              text: "New Password",
                              controller: data.passwordController,
                              isShown: data.getShown,
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    dataFunction.obSecure();
                                    setState(() {});
                                  },
                                  iconSize: 40,
                                  icon: IconConst.eye));
                        }),
                      ),
                      SizedBox(height: context.h * 0.02),
                      const Text("New Password Confirmation",
                          style: FStyles.headline4text),
                      SizedBox(height: context.h * 0.01),
                      StatefulBuilder(
                        builder: ((context, setState) {
                          return MyTextField.textField(
                            text: "New Password Confirmation",
                            controller: data.confirmationController,
                            isShown: data.getShown,
                            suffixIcon: IconButton(
                                iconSize: 40,
                                onPressed: () {
                                  dataFunction.obSecure();
                                  setState(() {});
                                },
                                icon: IconConst.eye),
                          );
                        }),
                      ),
                      SizedBox(height: context.h * 0.04),
                      ElevatedButtonWidget(
                          height: context.h * 0.06,
                          width: context.w,
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {}),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
