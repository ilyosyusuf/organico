import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/screens/home/cubit/home_cubit.dart';
import 'package:organico/screens/home/state/home_state.dart';
import 'package:organico/screens/home/view/pages/home/home_view.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        var data = HomeCubit();
        data.getProducts();
        return data;
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
            return Center(child: Text("Explore"));
          } else if (state is CartState) {
            return Center(child: Text("Cart"));
          } else if (state is ProfileState) {
            return Center(child: Text("Home"));
          } else if (state is ErrorState) {
            return Center(child: Text("Error"));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
