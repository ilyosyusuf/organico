import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:organico/core/constants/colors/color_const.dart';
import 'package:organico/core/constants/icons/icon_const.dart';
import 'package:organico/screens/home/state/home_state.dart';
import 'package:organico/services/product_data_service.dart';

class HomeCubit extends Cubit<MainHomeState> {
  HomeCubit() : super(HomeState());

  int currentIndex = 0;

  onStateChange(int index) {
    currentIndex = index;
    switch (index) {
      case 0:
        return emit(HomeState());
      case 1:
        return emit(ExploreState());
      case 2:
        return emit(CartState());
      case 3:
        return emit(ProfileState());
    }
  }

  // List for categories in homeview
  List categoriesList = [
    'assets/images/broccoli.png',
    'assets/images/banana.png',
    'assets/images/meat.png'
  ];

  // List for categories name in homeview
  List categoriesName = ['Vegetables', 'Fruits', 'Meats'];

  // Colors list for home view
  List colorList = [
    ColorConst.whiteGreen,
    ColorConst.whitePink,
    ColorConst.whiteYellow,
    ColorConst.blackPink,
    ColorConst.whiteGreen,
    ColorConst.whitePink,
    ColorConst.whiteYellow,
    ColorConst.blackPink
  ];

  // Icons list for profile page
  List profileIconList = [
    IconConst.profilewhite,
    IconConst.documentwhite,
    IconConst.heartwhite,
    IconConst.locationwhite,
    IconConst.creditcardwhite,
    IconConst.headphonewhite,
    IconConst.lockwhite,
    IconConst.logoutwhite
  ];

  // Title list for profile page
  List titleList = [
    "Edit Profile",
    "My Orders",
    "My Wishlist",
    "My Address",
    "Payment Method",
    "Customer Service",
    "Change Password",
    "Logout"
  ];
  TextEditingController passwordController = TextEditingController();
  TextEditingController newpasswordController = TextEditingController();
  TextEditingController confirmationController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController ccvController = TextEditingController();
  TextEditingController expiresController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  bool _isShown = true;

  get getShown => _isShown;

  void obSecure() {
    _isShown = !_isShown;
  }

  final imagePicker = ImagePicker();
  XFile? image;

  void fromGallery() async {
    image = (await imagePicker.pickImage(source: ImageSource.gallery))!;
    // emit(HomeState());
  }

  changeState(MainHomeState state) {
    emit(state);
  }

  String groupValue = "radios";

  void radioButton(dynamic v) {
    groupValue = v;
  }

  List<String> cuponSubtitle = [
    '7 days remaining',
    '7 days remaining',
    '7 days remaining',
    '0 days remaining',
  ];

  List<String> cuponTitle = [
    '15% Discount all item',
    'Free Shipping',
    '10% Discount all item',
    'Free Shipping',
  ];

  List mostSearched = ['Onion', 'Watermelon', 'Blackurrant', 'Mushroom'];
  final Set searchedItems = {};
  search(String text) {
    for (var i = 0;
        i < ProductDataService.instance.productList[0].length;
        i++) {
      if (text.isEmpty) {
        searchedItems.clear();
      } else if (ProductDataService.instance.productList[0][i]['name']
          .toString()
          .toLowerCase()
          .contains(text.toString().toLowerCase())) {
        debugPrint(
            ProductDataService.instance.productList[0][i]['name'].toString());
        searchedItems.add(ProductDataService.instance.productList[0][i]);
      }
    }
  }

  // Lists for order status view
  List overviewNames = [
    "Order ID",
    "Shop Name",
    "Date",
    "Notes",
  ];

  List overviewDetails = [
    "20210302001",
    "Popey Shop - New York",
    "02 Mar 2021",
    "Please check the product before packaging.",
  ];


  // List for categories in orderstatusview
  List orderstatusongoingList = [
    'assets/images/broccoli.png',
    'assets/images/carrot.png',
  ];

    List orderhistoryList = [
    'assets/images/paprika.png',
    'assets/images/banana.png',
    'assets/images/broccoli.png',
  ];

  // List for total in order status view
  List totalNames = [
    "Subtotal",
    "Delivery charge",
    "Coupon",
    "Total",
  ];

  List totalCosts = [
    "\$9.98",
    "\$1",
    "-\$1",
    "\$9.98",
  ];

  // Lists for My Bag View
  List<String> baginfo = ['Subtotal', 'Delivery charge', 'Coupon', 'Total'];

  List<String> baginfoprice = [
      '9.98',
      '1',
      '-1',
      '9.98'
    ''
  ];
}
