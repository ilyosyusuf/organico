import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:organico/config/init/navigation/navigator.dart';
import 'package:organico/core/constants/icons/icon_const.dart';
import 'package:organico/core/extensions/context_extension.dart';
import 'package:organico/core/font/font_style.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<Color?>? colorAnimation;
  Animation<Alignment?>? alignmentAnimation;
  Color colorOfContainer = Colors.black;
  double widthOfContainer = 300;
  double heightOfContainer = 100;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      lowerBound: 0.0,
      upperBound: 1.0,
      duration: const Duration(seconds: 3),
    );

    animationController!.forward();

    animationController!.addListener(() {
      debugPrint(animationController!.value.toString());
      setState(() {});
    });

    animationController!.addStatusListener((status) {
      debugPrint("Status: $status");
      if (status == AnimationStatus.completed) {
        NavigationService.instance.pushNamedAndRemoveUntil('/mainauthview');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Opacity(
            opacity: animationController!.value,
            child: IconConst.logo,
          ),
          SizedBox(height: context.h * 0.03),
          Text("Organico", style: FStyles.headline2s)
        ],
      ),
    ));
  }
}
