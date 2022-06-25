import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:organico/core/constants/colors/color_const.dart';
import 'package:organico/core/constants/icons/icon_const.dart';
import 'package:organico/screens/home/state/home_state.dart';

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
}
