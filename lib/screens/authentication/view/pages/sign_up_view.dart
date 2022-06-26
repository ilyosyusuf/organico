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
import 'package:organico/screens/home/cubit/home_cubit.dart';
import 'package:organico/widgets/apbar/app_bar_widget.dart';
import 'package:organico/widgets/buttons/elevated_button.dart';
import 'package:organico/widgets/textform/text_form_widget.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

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
              text: "New Registration",
              leading: IconButton(onPressed: (){
                dataFunction.changeState(PhoneVerifyState());
              }, icon: HomeCubit.isDark ? IconConst.leftarrowwhite : IconConst.leftarrow,),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: PMconst.small,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (!KeyBoardService.instance.isKeyBoard(context))
                        const Text(
                            "It looks like you don’t have an account on this number. Please let us know some information for a secure service.",
                            style: FStyles.headline5main),
                      if (!KeyBoardService.instance.isKeyBoard(context))
                        SizedBox(height: context.h * 0.03),
                      const Text("Full Name", style: FStyles.headline4text),
                      SizedBox(height: context.h * 0.01),
                      MyTextField.textField(
                          text: "Full Name", controller: data.nameController),
                      SizedBox(height: context.h * 0.02),
                      const Text("Password", style: FStyles.headline4text),
                      SizedBox(height: context.h * 0.01),
                      StatefulBuilder(builder: ((context, setState) {
                        return MyTextField.textField(
                            text: "Password",
                            controller: data.passwordController,
                            isShown: data.getShown,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  dataFunction.obSecure();
                                  setState(() {});
                                },
                                iconSize: 40,
                                icon: IconConst.eye));
                      })),
                      SizedBox(height: context.h * 0.02),
                      const Text("Password Confirmation",
                          style: FStyles.headline4text),
                      SizedBox(height: context.h * 0.01),
                      StatefulBuilder(
                        builder: ((context, setState) {
                          return MyTextField.textField(
                            text: "Password Confirmation",
                            controller: data.confirmationController,
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
                      SizedBox(height: context.h * 0.02),
                      SizedBox(
                        width: context.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(value: false, onChanged: (v) {}),
                            const Text("I Accept the "),
                            const InkWell(
                                child: Text("Terms of Use",
                                    style: FStyles.headline5text)),
                            const Text(" and "),
                            const InkWell(
                                child: Text("Privacy Policy",
                                    style: FStyles.headline5text)),
                          ],
                        ),
                      ),
                      SizedBox(height: context.h * 0.05),
                      ElevatedButtonWidget(
                          height: context.h * 0.06,
                          width: context.w,
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {}),
                      Container(
                        alignment: Alignment.center,
                        height: context.h * 0.12,
                        child: const Text(
                          "or use",
                          style: FStyles.headline5main,
                        ),
                      ),
                      ElevatedButtonWidget(
                          height: context.h * 0.06,
                          width: context.w,
                          backgroundColor: Colors.transparent,
                          borderColor: ColorConst.mainColor,
                          child: Text(
                            "Sign Up With Google",
                            style: TextStyle(color: HomeCubit.isDark ? ColorConst.white : ColorConst.dark,),
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
