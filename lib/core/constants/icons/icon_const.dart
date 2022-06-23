import 'package:flutter_svg/flutter_svg.dart';
import 'package:organico/core/constants/colors/color_const.dart';

class IconConst{
  //logo
  static final SvgPicture logo = SvgPicture.asset('assets/icons/Logo.svg');
  
  static final SvgPicture forgot = SvgPicture.asset('assets/icons/Forgot.svg');
  static final SvgPicture welcome = SvgPicture.asset('assets/icons/Welcome.svg');
  static final SvgPicture eye = SvgPicture.asset('assets/icons/eye.svg');
  static final SvgPicture password = SvgPicture.asset('assets/icons/password.svg');
  static final SvgPicture coupon = SvgPicture.asset('assets/icons/Coupon.svg');

  //arrows
  static final SvgPicture downarrow = SvgPicture.asset('assets/icons/DownArrow.svg');
  static final SvgPicture leftarrow = SvgPicture.asset('assets/icons/leftarrow.svg');
  static final SvgPicture rightarrow = SvgPicture.asset('assets/icons/RightArrow.svg', color: ColorConst.mainColor,);

  // home
  static final SvgPicture home = SvgPicture.asset('assets/icons/Home.svg');
  static final SvgPicture explore = SvgPicture.asset('assets/icons/Search.svg');
  static final SvgPicture cart = SvgPicture.asset('assets/icons/Cart.svg');
  static final SvgPicture profile = SvgPicture.asset('assets/icons/Profile.svg');
}