import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/screens/authentication/state/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(SignInState());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  changeState(AuthState state) {
    emit(state);
  }
}