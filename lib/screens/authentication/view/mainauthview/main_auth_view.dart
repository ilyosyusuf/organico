import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/screens/authentication/cubit/auth_cubit.dart';
import 'package:organico/screens/authentication/state/auth_state.dart';
import 'package:organico/screens/authentication/view/pages/authorization_view.dart';
import 'package:organico/screens/authentication/view/pages/forgot_password_view.dart';
import 'package:organico/screens/authentication/view/pages/otac_number_view.dart';
import 'package:organico/screens/authentication/view/pages/phone_verification.dart';
import 'package:organico/screens/authentication/view/pages/reset_password_view.dart';
import 'package:organico/screens/authentication/view/pages/sign_in_view.dart';
import 'package:organico/screens/authentication/view/pages/sign_up_view.dart';

class MainAuthView extends StatelessWidget {
  const MainAuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: authScaffold(),
    );
  }

  Scaffold authScaffold() {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: ((context, state) {}),
        builder: (context, state) {
          if (state is SignUpState) {
            return SignUpView();
          } else if (state is SignInState) {
            return SignInView();
          } else if (state is PhoneVerifyState) {
            return PhoneVerificationView();
          } else if (state is AuthorizationState) {
            return AuthorizationView();
          } else if (state is ForgotPasswordState) {
            return ForgotPasswordView();
          }  else if (state is ResetPasswordState) {
            return ResetPasswordView();
          }
           else if (state is OtacNumberState) {
            return OtacNumberView();
          } 
           else {
            return Container();
          }
        },
      ),
    );
  }
}
