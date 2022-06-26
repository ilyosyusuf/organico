import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:organico/config/init/navigation/navigator.dart';
import 'package:organico/core/extensions/context_extension.dart';
import 'package:organico/core/font/font_style.dart';
import 'package:organico/widgets/buttons/elevated_button.dart';
import 'package:rating_dialog/rating_dialog.dart';

class RatingDialogWidget extends StatelessWidget {
  const RatingDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
                                children: [
                                  RatingDialog(
                                    initialRating: 1.0,
                                    title: const Text(
                                      'Rate the Order',
                                      style: FStyles.headline4sbold,
                                      textAlign: TextAlign.center,
                                    ),
                                    message: const Text(
                                      'Rate your completed order by pressing the star below.',
                                      style: FStyles.headline5main,
                                      textAlign: TextAlign.center,
                                    ),
                                    enableComment: false,
                                    submitButtonText: 'Rate Now',
                                    submitButtonTextStyle:
                                        TextStyle(color: Colors.black),
                                    onSubmitted: (response) {
                                      print(
                                          'rating: ${response.rating}, comment: ${response.comment}');
                                    },
                                  ),
                                  Positioned(
                                    top: context.h * 0.555,
                                    left: context.h * 0.125,
                                    child: ElevatedButtonWidget(
                                      width: context.w * 0.5,
                                      child: Text("Rate now"),
                                      onPressed: () {
                                        NavigationService.instance.pop("");
                                      },
                                    ),
                                  ),
                                ],
                              );
  }
}