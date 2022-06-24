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
  static final SvgPicture plusbutton = SvgPicture.asset('assets/icons/PlusButton.svg');
  static final SvgPicture minusbutton = SvgPicture.asset('assets/icons/MinusButton.svg');
  static final SvgPicture sort = SvgPicture.asset('assets/icons/Sort.svg');

  static final SvgPicture notification = SvgPicture.asset('assets/icons/Union.svg');
  static final SvgPicture settings = SvgPicture.asset('assets/icons/Settings.svg');

  //arrows
  static final SvgPicture downarrow = SvgPicture.asset('assets/icons/DownArrow.svg');
  static final SvgPicture leftarrow = SvgPicture.asset('assets/icons/leftarrow.svg');
  static final SvgPicture rightarrow = SvgPicture.asset('assets/icons/RightArrow.svg', color: ColorConst.mainColor,);

  // home
  static final SvgPicture home = SvgPicture.asset('assets/icons/Home.svg');
  static final SvgPicture explore = SvgPicture.asset('assets/icons/Search.svg');
  static final SvgPicture cart = SvgPicture.asset('assets/icons/Cart.svg');
  static final SvgPicture profile = SvgPicture.asset('assets/icons/Profile.svg');

  // profile
  static final SvgPicture profilewhite = SvgPicture.asset('assets/icons/profile/ProfileWhite.svg');
  static final SvgPicture creditcardwhite = SvgPicture.asset('assets/icons/profile/CreditCardWhite.svg');
  static final SvgPicture documentwhite = SvgPicture.asset('assets/icons/profile/DocumentWhite.svg');
  static final SvgPicture headphonewhite = SvgPicture.asset('assets/icons/profile/HeadPhoneWhite.svg');
  static final SvgPicture heartwhite = SvgPicture.asset('assets/icons/profile/HeartWhite.svg');
  static final SvgPicture locationwhite = SvgPicture.asset('assets/icons/profile/LocationWhite.svg');
  static final SvgPicture lockwhite = SvgPicture.asset('assets/icons/profile/LockWhite.svg');
  static final SvgPicture logoutwhite = SvgPicture.asset('assets/icons/profile/LogoutWhite.svg');

  // notification
  static final SvgPicture truckwhite = SvgPicture.asset('assets/icons/profile/TruckWhite.svg');
  static final SvgPicture tagwhite = SvgPicture.asset('assets/icons/profile/TagWhite.svg');
  static final SvgPicture mailwhite = SvgPicture.asset('assets/icons/profile/MailWhite.svg');
}