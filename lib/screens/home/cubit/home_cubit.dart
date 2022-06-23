import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/screens/home/state/home_state.dart';
import 'package:flutter/services.dart' as bundle;

class HomeCubit extends Cubit<MainHomeState> {
  HomeCubit() : super(HomeState());

  List productList = [];

  Future getProducts() async {
    final data =
        await bundle.rootBundle.loadString('lib/core/mock/product_data.json');
    productList = jsonDecode(data) as List;
    print(productList);
    emit(HomeState());
    return productList;
  }
}