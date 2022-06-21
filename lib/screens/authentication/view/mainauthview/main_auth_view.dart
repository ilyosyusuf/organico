import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/screens/authentication/cubit/auth_cubit.dart';
import 'package:organico/screens/authentication/state/auth_state.dart';

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
          if (state is SplashState) {
            return Center(child: Text("Splash"));
          } else if (state is SignUpState) {
            return Center(child: Text("Sign Up"));
          } else if (state is SignInState) {
            return Center(child: Text("Sign In"));
          } else if (state is ForgotPasswordState) {
            return Center(child: Text("Forgot Password"));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
