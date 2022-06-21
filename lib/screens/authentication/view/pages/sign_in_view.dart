import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/core/constants/icons/icon_const.dart';
import 'package:organico/core/constants/pmconst/pm_const.dart';
import 'package:organico/core/extensions/context_extension.dart';
import 'package:organico/core/font/font_style.dart';
import 'package:organico/screens/authentication/cubit/auth_cubit.dart';
import 'package:organico/widgets/buttons/elevated_button.dart';
import 'package:organico/widgets/textform/text_form_widget.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return signInScaffold(context);
  }

  Scaffold signInScaffold(BuildContext context) {
    var data = context.watch<AuthCubit>();
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Padding(
        padding: PMconst.medium,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconConst.welcome,
            SizedBox(height: context.h * 0.05),
            Text("Welcome", style: FStyles.headline2s),
            Text(
              "Welcome to Organico Mobile Apps. Please fill in the field below to sign in.",
              style: FStyles.headline5main,
            ),
            SizedBox(height: context.h * 0.05),
            MyTextField.textField(
                text: "Your Phone Number", controller: data.phoneController),
            SizedBox(height: context.h * 0.03),
            MyTextField.textField(
                prefixIcon: IconButton(
                  onPressed: () {},
                  icon: IconConst.password,
                  iconSize: 10,
                ),
                suffixIcon: IconButton(onPressed: () {}, icon: IconConst.eye),
                text: "Password",
                controller: data.passwordController),
            Padding(
              padding: PMconst.extraSmall,
              child: Container(
                alignment: Alignment.centerRight,
                height: context.h * 0.03,
                width: context.h,
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    "Forgot Password?",
                    style: FStyles.headline5text,
                  ),
                ),
              ),
            ),
            SizedBox(height: context.h * 0.06),
            ElevatedButtonWidget(
              height: context.h * 0.06,
              child: Text("Sign In", style: TextStyle(color: Colors.white),), onPressed: (){})
          ],
        ),
      ),
    )));
  }
}
