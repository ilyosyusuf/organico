import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/core/components/keyboard_service.dart';
import 'package:organico/core/constants/icons/icon_const.dart';
import 'package:organico/core/constants/pmconst/pm_const.dart';
import 'package:organico/core/extensions/context_extension.dart';
import 'package:organico/core/font/font_style.dart';
import 'package:organico/screens/authentication/cubit/auth_cubit.dart';
import 'package:organico/screens/authentication/state/auth_state.dart';
import 'package:organico/widgets/buttons/elevated_button.dart';
import 'package:organico/widgets/textform/intl_phone_field_widget.dart';
import 'package:organico/widgets/textform/text_form_widget.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return signInScaffold(context);
  }

  Scaffold signInScaffold(BuildContext context) {
    var data = context.watch<AuthCubit>();
    var dataFunction = context.read<AuthCubit>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: PMconst.medium,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!KeyBoardService.instance.isKeyBoard(context))
                  IconConst.welcome,
                SizedBox(height: context.h * 0.03),
                const Text("Welcome", style: FStyles.headline2s),
                const Text(
                  "Welcome to Organico Mobile Apps. Please fill in the field below to sign in.",
                  style: FStyles.headline5main,
                ),
                SizedBox(height: context.h * 0.04),
                PhoneTextField.phoneField(
                    text: "Your Phone Number",
                    controller: data.phoneController),
                SizedBox(height: context.h * 0.01),
                StatefulBuilder(
                  builder: ((context, setState) {
                    return MyTextField.textField(
                        isShown: data.getShown,
                        prefixIcon: IconButton(
                          onPressed: () {},
                          iconSize: 40,
                          icon: IconConst.password,
                        ),
                        suffixIcon: IconButton(
                            iconSize: 40,
                            onPressed: () {
                              dataFunction.obSecure();
                              setState(() {});
                            },
                            icon: IconConst.eye),
                        text: "Password",
                        controller: data.passwordController);
                  }),
                ),
                Padding(
                  padding: PMconst.extraSmall,
                  child: Container(
                    alignment: Alignment.centerRight,
                    height: context.h * 0.03,
                    width: context.h,
                    child: InkWell(
                      onTap: () {
                        dataFunction.changeState(ForgotPasswordState());
                      },
                      child: const Text(
                        "Forgot Password?",
                        style: FStyles.headline5text,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: context.h * 0.05),
                ElevatedButtonWidget(
                    height: context.h * 0.06,
                    child: const Text(
                      "Sign In",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {}),
                SizedBox(height: context.h * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't You have an account? "),
                    InkWell(
                        onTap: () {
                          dataFunction.changeState(PhoneVerifyState());
                        },
                        child:
                            const Text("Sign Up", style: FStyles.headline5text))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
