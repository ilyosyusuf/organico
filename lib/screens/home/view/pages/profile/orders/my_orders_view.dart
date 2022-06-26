import 'package:flutter/material.dart';
import 'package:organico/config/init/navigation/navigator.dart';
import 'package:organico/core/constants/colors/color_const.dart';
import 'package:organico/core/constants/icons/icon_const.dart';
import 'package:organico/screens/home/cubit/home_cubit.dart';
import 'package:organico/screens/home/view/pages/profile/orders/history_view.dart';
import 'package:organico/screens/home/view/pages/profile/orders/ongoing_view.dart';
import 'package:organico/widgets/apbar/app_bar_widget.dart';

class MyOrdersView extends StatefulWidget {
  final BuildContext forcontext;

  const MyOrdersView({Key? key, required this.forcontext}) : super(key: key);

  @override
  State<MyOrdersView> createState() => _MyOrdersViewState();
}

class _MyOrdersViewState extends State<MyOrdersView>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return myOrderScaffold(widget.forcontext);
  }

  Scaffold myOrderScaffold(BuildContext context) {
    return Scaffold(
      body: SafeArea(
    child: Column(
      children: [
        AppBarWidget(
          text: "My Orders",
          leading: IconButton(
              onPressed: () {
                NavigationService.instance.pop("");
              },
              icon: HomeCubit.isDark ? IconConst.leftarrowwhite : IconConst.leftarrow,),
        ),
        MyTabbar(),
        Expanded(
            child: TabBarView(controller: _tabController, children: [
          OnGoingView(forcontext: context),
          HistoryView(forcontext: context),
        ]))
      ],
    ),
  ));
  }

  TabBar MyTabbar() => TabBar(
          controller: _tabController,
          labelColor: ColorConst.kPrimaryColor,
          unselectedLabelColor: ColorConst.mainColor,
          indicatorColor: ColorConst.kPrimaryColor,
          tabs: [
            Tab(
              text: "Ongoing",
            ),
            Tab(text: "History"),
          ]);
}
