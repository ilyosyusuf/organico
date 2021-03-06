import 'package:flutter/material.dart';
import 'package:organico/screens/authentication/view/mainauthview/main_auth_view.dart';
import 'package:organico/screens/authentication/view/pages/splash_view.dart';
import 'package:organico/screens/home/view/mainview/main_view.dart';
import 'package:organico/screens/home/view/pages/cart/bag_view.dart';
import 'package:organico/screens/home/view/pages/cart/order_status_details_view.dart';
import 'package:organico/screens/home/view/pages/cart/order_status_view.dart';
import 'package:organico/screens/home/view/pages/home/categorydetails/category_details_view.dart';
import 'package:organico/screens/home/view/pages/home/coupon/coupon_view.dart';
import 'package:organico/screens/home/view/pages/home/details/details_view.dart';
import 'package:organico/screens/home/view/pages/home/home_view.dart';
import 'package:organico/screens/home/view/pages/home/search/search_view.dart';
import 'package:organico/screens/home/view/pages/profile/address/address_view.dart';
import 'package:organico/screens/home/view/pages/profile/customs/custom_service_view.dart';
import 'package:organico/screens/home/view/pages/profile/editprofile/changednumberconfirmation_view.dart';
import 'package:organico/screens/home/view/pages/profile/editprofile/edit_profile_view.dart';
import 'package:organico/screens/home/view/pages/profile/notifications/notification_settings_view.dart';
import 'package:organico/screens/home/view/pages/profile/notifications/notification_view.dart';
import 'package:organico/screens/home/view/pages/profile/orders/my_orders_view.dart';
import 'package:organico/screens/home/view/pages/profile/password/change_password_view.dart';
import 'package:organico/screens/home/view/pages/profile/paymentmethod/add_payment_method_view.dart';
import 'package:organico/screens/home/view/pages/profile/paymentmethod/payment_method_view.dart';
import 'package:organico/screens/home/view/pages/profile/profilemainview/profile_view.dart';

class MyRoute {
  static final MyRoute _instance = MyRoute._init();
  static MyRoute get instance => _instance;
  MyRoute._init();

  Route? onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case '/mainauthview':
        return _pages(MainAuthView());
      case '/mainview':
        return _pages(MainView());
      case '/splashview':
        return _pages(SplashView());
      case '/profileview':
        return _pages(ProfileView());
      case '/notificationview':
        return _pages(NotificationView());
      case '/notificationsettingsview':
        return _pages(NotificationSettingsView());
      case '/changepasswordview':
        return _pages(ChangePasswordView(forcontext: args as BuildContext));
      case '/paymentmethodview':
        return _pages(PaymentMethodView(forcontext: args as BuildContext));
      case '/addressview':
        return _pages(AddressView());
      case '/editprofileview':
        return _pages(EditProfileView(forcontext: args as BuildContext));
      case '/changednumberconfirmationview':
        return _pages(
            ChangedNumberConfirmationView(forcontext: args as BuildContext));
      case '/addpaymentmethodview':
        return _pages(AddPaymentMethodView(forcontext: args as BuildContext));
      case '/customerserviceview':
        return _pages(CustomerServiceView(forcontext: args as BuildContext));
      case '/home':
        return _pages(HomeView());
      case '/detailsview':
        return _pages(DetailsView(
          product: args as Map,
        ));
      case '/coupon_view':
        return _pages(CouponView(
          forcontext: args as BuildContext,
        ));
      case '/search_view':
        return _pages(SearchView(
          forcontext: args as BuildContext,
        ));
      case '/orderstatusview':
        return _pages(OrderStatusView(
          forcontext: args as BuildContext,
        ));
      case '/myordersview':
        return _pages(MyOrdersView(forcontext: args as BuildContext));
      case '/bagview':
        return _pages(BagView(newcontext: args as BuildContext));
      case '/categorydetailsview':
        return _pages(CategoryDetailsView(data: args as List));
      case '/orderstatusdetailsview':
        return _pages(OrderStatusDetailsView(newcontext: args as BuildContext));
    }
  }

  _pages(Widget page) {
    return MaterialPageRoute(builder: (context) => page);
  }
}
