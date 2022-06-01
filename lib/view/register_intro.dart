import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/my_colors.dart';
import 'package:techblog/my_string.dart';

class RegisterIntro extends StatelessWidget {
  const RegisterIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textThem = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.images.techbot.path,
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: MyString.welcom,
                    style: textThem.headline5,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "بزن بریم",
                ),
                style: ButtonStyle(
                    textStyle: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return textThem.headline1;
                  }
                  return textThem.subtitle1;
                }), backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return SolidColors.colorSeeMore;
                  }
                  return SolidColors.primary;
                })),
              )
            ],
          ),
        ),
      ),
    );
  }
}
