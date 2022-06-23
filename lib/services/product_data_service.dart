import 'dart:convert';

import 'package:flutter/services.dart' as bundle;
import 'package:organico/models/product_model.dart';
import 'package:organico/screens/home/cubit/home_cubit.dart';


class ProductDataService {
  static final ProductDataService _instance = ProductDataService._init();
  static ProductDataService get instance => _instance;
  ProductDataService._init();

    // List for profucts
  List productList = [];

  Future getProducts() async {
    final data =
        await bundle.rootBundle.loadString('lib/core/mock/product_data.json');
    productList = jsonDecode(data) as List;
    print(productList);
    // emit(HomeState());
    //  productList = products.map((e) => ProductModel.fromJson(e)).toList();
    //  print(productList[0].howmuch.toString());
    return productList;
  }
}