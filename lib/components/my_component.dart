import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/fake_data.dart';
import 'package:url_launcher/url_launcher.dart';

import 'my_colors.dart';

class TechDivaider extends StatelessWidget {
  const TechDivaider({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: SolidColors.divaiderColor,
      indent: size.width / 5,
      endIndent: size.width / 5,
    );
  }
}

class MainGradientTags extends StatelessWidget {
  const MainGradientTags({
    Key? key,
    required this.textThem,
    required this.index,
    required this.list,
  }) : super(key: key);

  final TextTheme textThem;
  final int index;
  final List list;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: GradiantColors.tags,
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
        child: Row(
          children: [
            ImageIcon(
              Assets.icons.hashtag,
              color: Colors.white,
              size: 15,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              list[index].title,
              style: textThem.headline2,
            ),
          ],
        ),
      ),
    );
  }
}

Future myLaunchUrl(String url) async {
  var uri = Uri.parse(url);

  if (await canLaunchUrl(uri)) {
    launchUrl(uri);
  } else {
    log("could not launch ${uri.toString()}");
  }
}
