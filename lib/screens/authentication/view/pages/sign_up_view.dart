import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              onPressed: (){
                dataFunction.changeState(SignInState());
              },
            ),
            SizedBox(
              child: SingleChildScrollView(
                child: Padding(
                  padding: PMconst.small,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          "It looks like you don’t have an account on this number. Please let us know some information for a secure service.",
                          style: FStyles.headline5main),
                      SizedBox(height: context.h * 0.03),
                      Text("Full Name", style: FStyles.headline4text),
                      SizedBox(height: context.h * 0.01),
                      MyTextField.textField(
                          text: "Full Name", controller: data.nameController),
                      SizedBox(height: context.h * 0.02),
                      Text("Password", style: FStyles.headline4text),
                      SizedBox(height: context.h * 0.01),
                      MyTextField.textField(
                          text: "Password",
                          controller: data.nameController,
                          suffixIcon:
                              IconButton(onPressed: () {}, icon: IconConst.eye)),
                      SizedBox(height: context.h * 0.02),
                      Text("Password Confirmation", style: FStyles.headline4text),
                      SizedBox(height: context.h * 0.01),
                      MyTextField.textField(
                        text: "Password Confirmation",
                        controller: data.nameController,
                        suffixIcon:
                            IconButton(onPressed: () {}, icon: IconConst.eye),
                      ),
                      SizedBox(height: context.h * 0.02),
                      SizedBox(
                        width: context.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(value: false, onChanged: (v) {}),
                            Text("I Accept the "),
                            InkWell(
                                child: Text("Terms of Use",
                                    style: FStyles.headline5text)),
                            Text(" and "),
                            InkWell(
                                child: Text("Privacy Policy",
                                    style: FStyles.headline5text)),
                          ],
                        ),
                      ),
                      SizedBox(height: context.h * 0.03),
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
                        height: context.h * 0.1,
                        child: Text("or use", style: FStyles.headline5main,),
                        ),
                                          ElevatedButtonWidget(
                          height: context.h * 0.06,
                          width: context.w,
                          backgroundColor: ColorConst.white,
                          borderColor: ColorConst.mainColor,
                          child: const Text(
                            "Sign Up With Google",
                            style: FStyles.headline5s
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


