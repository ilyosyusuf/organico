import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/screens/authentication/state/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(ResetPasswordState());

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmationController = TextEditingController();
  TextEditingController authorizationController = TextEditingController();

  bool _isShown = true;

  get getShown => _isShown;

  void obSecure() {
    _isShown = !_isShown;
  }

  changeState(AuthState state) {
    emit(state);
  }
}