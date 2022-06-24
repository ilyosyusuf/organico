import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/screens/home/cubit/home_cubit.dart';
import 'package:organico/screens/home/state/home_state.dart';
import 'package:organico/screens/home/view/pages/cart/cart_view.dart';
import 'package:organico/screens/home/view/pages/explore/explore_view.dart';
import 'package:organico/screens/home/view/pages/home/home_view.dart';
import 'package:organico/screens/home/view/pages/profile/profile_view.dart';
import 'package:organico/widgets/tabbar/tabbar_widget.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return HomeCubit();
      },
      child: mainScaffold(),
    );
  }

  Scaffold mainScaffold() {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<HomeCubit, MainHomeState>(
        listener: ((context, state) {}),
        builder: (context, state) {
          if (state is HomeState) {
            return HomeView();
          } else if (state is ExploreState) {
            return ExploreView();
          } else if (state is CartState) {
            return CartView();
          } else if (state is ProfileState) {
            return ProfileView();
          } else if (state is ErrorState) {
            return Center(child: Text("Error"));
          } else {
            return Container();
          }
        },
      ),
      bottomNavigationBar: TabBarWidget(),
    );
  }
}
