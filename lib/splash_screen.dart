import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/main_screen.dart';
import 'package:techblog/my_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4)).then((value) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const MainScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                height: 64,
                image: Assets.images.logo,
              ),
              const SizedBox(
                height: 32,
              ),
              const SpinKitFadingCube(
                color: SolidColors.primary,
                size: 32.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
