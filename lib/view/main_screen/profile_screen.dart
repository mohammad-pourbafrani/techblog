import 'package:flutter/material.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/components/my_colors.dart';
import 'package:techblog/components/my_string.dart';

import '../../components/my_component.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
    required this.size,
    required this.textThem,
    required this.bodyMargin,
  }) : super(key: key);

  final Size size;
  final TextTheme textThem;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //avatar image
          Image(
            image: Assets.images.profileAvatar,
            height: 100,
          ),
          const SizedBox(
            height: 16,
          ),
          //edite profile
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageIcon(
                Assets.icons.penBlue,
                color: SolidColors.colorSeeMore,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                MyString.profileImageEdite,
                style: textThem.headline3,
              )
            ],
          ),
          const SizedBox(
            height: 60,
          ),
          //user name
          Text(
            "فاطمه امیری",
            style: textThem.headline4,
          ),
          //email adrres
          Text(
            "fatemeamiri@gmail.com",
            style: textThem.headline4,
          ),
          const SizedBox(
            height: 40,
          ),
          //divider
          TechDivaider(size: size),
          //my favorit blog
          InkWell(
            onTap: () {
              //این جا قراره یچیزی نوشته شه|
            },
            splashColor: SolidColors.primary,
            child: SizedBox(
              height: 32,
              child: Center(
                child: Text(
                  MyString.myFavBlog,
                  style: textThem.headline4,
                ),
              ),
            ),
          ),
          //divider
          TechDivaider(size: size),
          //my favorit Podcast
          InkWell(
            onTap: () {
              //این جا قراره یچیزی نوشته شه|
            },
            splashColor: SolidColors.primary,
            child: SizedBox(
              height: 32,
              child: Center(
                child: Text(
                  MyString.myFavPodcast,
                  style: textThem.headline4,
                ),
              ),
            ),
          ),
          //divider
          TechDivaider(size: size),
          //log out
          InkWell(
            onTap: () {
              //این جا قراره یچیزی نوشته شه|
            },
            splashColor: SolidColors.primary,
            child: SizedBox(
              height: 32,
              child: Center(
                child: Text(
                  MyString.logOut,
                  style: textThem.headline4,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}
