import 'package:flutter/material.dart';

class KeyBoardService{
  static final KeyBoardService _instance = KeyBoardService._init();
  static KeyBoardService get instance => _instance;
  KeyBoardService._init();

  isKeyBoard(context)  => MediaQuery.of(context).viewInsets.bottom != 0;
}